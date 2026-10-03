// Runs the business search off the main thread so typing never blocks.
// Protocol: {type:'init', url} once, then {id, q, suburb} -> {id, i, bucket, score}.
import { SearchEngine, type SearchPack } from './fuzzy-search';

let ready: Promise<SearchEngine> | null = null;

self.onmessage = async (e: MessageEvent) => {
  const m = e.data as { type?: string; url?: string; id?: number; q?: string; suburb?: string };
  if (m.type === 'init') {
    // Same URL the page preloaded, so this is normally a cache hit.
    ready = fetch(m.url!)
      .then((r) => r.json() as Promise<SearchPack>)
      .then((p) => new SearchEngine(p));
    return;
  }
  if (!ready) return;
  const engine = await ready;
  const hits = engine.search(m.q ?? '', { suburb: m.suburb ?? '' });
  const i = new Int32Array(hits.length);
  const bucket = new Uint8Array(hits.length);
  const score = new Float32Array(hits.length);
  hits.forEach((h, k) => {
    i[k] = h.i;
    bucket[k] = h.bucket;
    score[k] = h.score;
  });
  (self as unknown as Worker).postMessage({ id: m.id, i, bucket, score }, [i.buffer, bucket.buffer, score.buffer]);
};
