// Browser side of the business search: fetches the prebuilt pack once (for
// the rows to render) and runs queries in a Web Worker, falling back to the
// main thread if workers aren't available. Results come back as row indexes.
import { SearchEngine, type SearchPack, type PackRow } from './fuzzy-search';

export interface SearchResult {
  i: Int32Array;
  bucket: Uint8Array;
  score: Float32Array;
}

export function createSearchClient<T extends PackRow>(url: string) {
  const packP: Promise<SearchPack> = fetch(url).then((r) => r.json());
  let worker: Worker | null = null;
  let fallback: Promise<SearchEngine> | null = null;
  let seq = 0;
  const pending = new Map<number, { q: string; suburb: string; resolve: (r: SearchResult) => void }>();

  const viaMain = (q: string, suburb: string): Promise<SearchResult> => {
    fallback ??= packP.then((p) => new SearchEngine(p));
    return fallback.then((engine) => {
      const hits = engine.search(q, { suburb });
      return {
        i: Int32Array.from(hits, (h) => h.i),
        bucket: Uint8Array.from(hits, (h) => h.bucket),
        score: Float32Array.from(hits, (h) => h.score),
      };
    });
  };

  try {
    worker = new Worker(new URL('./search-worker.ts', import.meta.url), { type: 'module' });
    worker.postMessage({ type: 'init', url: new URL(url, location.href).href });
    worker.onmessage = (e: MessageEvent) => {
      const p = pending.get(e.data.id);
      if (p) {
        pending.delete(e.data.id);
        p.resolve(e.data as SearchResult);
      }
    };
    worker.onerror = () => {
      // Worker failed to start or died: answer everything on the main thread.
      worker = null;
      for (const [id, p] of pending) {
        pending.delete(id);
        viaMain(p.q, p.suburb).then(p.resolve);
      }
    };
  } catch {
    worker = null;
  }

  return {
    /** The rows to render, once the pack has loaded. */
    load: packP.then((pack) => ({ pack, rows: pack.d as T[] })),
    search(q: string, suburb: string): Promise<SearchResult> {
      if (!worker) return viaMain(q, suburb);
      return new Promise((resolve) => {
        const id = ++seq;
        pending.set(id, { q, suburb, resolve });
        worker!.postMessage({ id, q, suburb });
      });
    },
  };
}
