// Client-only: fire a GA4 custom event. gtag only exists on the live domain
// (see BaseLayout), so on previews/localhost this is a silent no-op.
declare global {
  interface Window {
    gtag?: (...args: unknown[]) => void;
  }
}

export function gaEvent(name: string, params: Record<string, string | number | boolean> = {}): void {
  try {
    if (typeof window !== 'undefined' && typeof window.gtag === 'function') window.gtag('event', name, params);
  } catch {
    /* analytics must never break the page */
  }
}
