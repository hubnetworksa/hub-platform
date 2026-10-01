## 2026-10-01

### Changes to existing attractions
- **Run limitation**: web fetches to operator sites are blocked by the sandbox egress proxy, and search snippets did not literally state current figures, so no price or hours change could be confirmed. Leave all page values as they are.
- **Polokwane Game Reserve**: could not confirm current entry price. A search summary suggested the Limpopo Wildlife Resorts rates page (https://www.lwr.gov.za/RatesAndFees) may list a different per-adult fee plus a per-vehicle fee than the page's "approx. R50 per adult / R30 per child"; a human should check that page directly.
- Other attractions (Bakone Malapa, Hugh Exton Photographic Museum, Meropa Casino, Polokwane Golf Club, The Ranch Golf Course, Magoebaskloof & Debengeni Falls): could not confirm; leave as is.

### Closures and notices
- None found.

### Suggested new attractions
- None this run (could not verify any with 2 sources).

### Tooling note
- `scripts/routines/next.mjs` reads `src/site-content/tourism.ts`, which does not exist; Polokwane's content is `src/site-content/polokwane/tourism.ts` (different structure), so the work packet's `currentPicks` was empty. Attractions were taken from that file instead.
