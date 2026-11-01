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

## 2026-11-01

### Changes to existing attractions
- **Run limitation**: operator sites are still blocked by the sandbox egress proxy (SANParks returned 403), and search snippets did not literally state current operator figures, so no price or hours change could be confirmed. Leave all page values as they are.
- **Mapungubwe National Park**: could not confirm. The page shows "R120 conservation fee", but search results suggest SANParks lists per-person rates well below and above that by visitor type (SA resident, SADC, international), so the single figure may be misleading. A human should check the SANParks tariff PDF https://www.sanparks.org/wp-content/uploads/2026/02/daily_conservation_fees_2026_27.pdf directly.
- **Polokwane Game Reserve**: could not confirm current entry price; third-party guides report about R50 adult / R30 child and conflicting hours (06:00-18:00 vs 07:00-16:30). Page shows R60 per adult. Human to check https://www.lwr.gov.za/RatesAndFees.
- **Bakone Malapa Open-Air Museum**: could not confirm the entry fee (none stated in results). Third-party listings give Mon-Fri 08:00-15:30 or 16:00 with weekends by arrangement; leave as is.
- Other attractions (Modjadji Cycad Reserve, Peter Mokaba Stadium, Tzaneen & the Magoebaskloof, Hugh Exton Photographic Museum, Meropa Casino, Polokwane Golf Club, The Ranch Golf Course): could not confirm; leave as is.

### Closures and notices
- None found.

### Suggested new attractions
- None this run (could not verify any with 2 sources).
