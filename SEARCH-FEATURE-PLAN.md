# PolokwaneHub Search Feature — Implementation Plan

18 Sept 2026 · @Guy

## Overview

Add a working keyword + suburb search to polokwanehub.com, modeled loosely on the best patterns found while researching other SA directories (Cylex's plain-language "What? / Where?" two-field search beat Brabys, saYellow and Yellow Pages SA on usability).

Two constraints drive every decision in this plan:

1. **Usable like Google/Cylex, not like saYellow.** A free-text keyword field, and a "Where?" field scoped to Polokwane and its suburbs (not "All South Africa") — typeable, not locked to a rigid dropdown-only taxonomy.
2. **Zero risk to existing Google rankings.** 789 listing pages, 33 suburb pages and 9 category/section pages are already indexed. Nothing in this plan renames, redirects, or restructures any of them — search is purely additive.

## Suburb data (single source of truth)

The "Where?" field must pull from the exact same suburb list already driving `/suburb/`, so it can never drift out of sync with real listings. Do not hand-type this list into the search component — read it from whatever content collection or data file already generates the suburb pages.

- **Polokwane Central & CBD:** Hospital Park, Moregloed, Polokwane Central, Superbia
- **Polokwane East:** Bendor, Bendor Park, Broadlands, Ivy Park, Serala View, Sterpark, Thornhill Estate
- **Polokwane South:** Annadale, Dalmada, Eduan Park, Extension 71, Extension 76, Fauna Park, Flora Park, Penina Park, Southern Gateway
- **Polokwane West & Industrial:** Capricorn, Futura, Ladanna, Nirvana, Welgelegen, Westenburg
- **Seshego:** Seshego, Seshego Zone 1, Seshego Zone 4
- **Mankweng:** Mankweng
- **Greater Capricorn:** Lebowakgomo

If a suburb has 0 businesses today (Broadlands, Serala View, Southern Gateway), still include it in the dropdown — it keeps the "Where?" field trustworthy and future-proof as listings grow.

## Phase 1 — Build the search index

Goal: one build-time export of every business, generated from the same content source that already drives `/suburb/`, `/category/`, `/section/`, and each listing page. No new manual data entry.

Steps:

1. Locate the content collection (or data file) already powering listing pages — this is your source of truth.
2. Create `src/pages/search-index.json.ts` (an Astro endpoint) that loops over every business and outputs, per business:
   - name
   - category / section
   - suburb
   - url (its existing listing page URL — unchanged)
   - short description or tags, if available
3. Confirm the endpoint builds to a static JSON file at `/search-index.json` and that its business count matches the site total (789 at time of writing).
4. Keep this file out of the sitemap and out of internal navigation links — it's a data file for the search feature, not a page for people or Google to land on directly.

## Phase 2 — Choose and set up the search engine

Two realistic options for an Astro static site:

**Option A — Pagefind (recommended).** Purpose-built for static sites like Astro. It indexes your already-built HTML automatically as a post-build step — no manual index maintenance, and it handles fuzzy keyword matching well out of the box.

- `npm install -D pagefind`
- Add a postbuild script: `pagefind --site dist`
- It outputs a `/pagefind/` directory alongside your build that the search UI queries client-side.
- Filtering by suburb: tag each indexed listing page with a `data-pagefind-filter="suburb:Bendor"` attribute (or similar) on the listing template, so Pagefind can filter results by suburb natively.

**Option B — Fuse.js against the Phase 1 JSON.** More manual, but gives full control over ranking (e.g. boosting exact suburb matches, weighting name over description).

- `npm install fuse.js`
- Load `/search-index.json` client-side, build a Fuse instance keyed on name, category, suburb.
- Filter/boost programmatically before rendering results.

**Recommendation:** start with Pagefind — it's less code to maintain and was built exactly for this use case. Only reach for Fuse.js if Pagefind's filtering turns out too limiting for suburb-specific ranking.

## Phase 3 — Build the SearchBar component

Create `src/components/SearchBar.astro`, following Cylex's proven pattern (the most usable of the directories reviewed) rather than Brabys' single-bar-plus-region-dropdown or saYellow's rigid category-code system.

Fields:

- **"What?"** — free-text input, placeholder like "Business name or service (e.g. plumber, bakery)"
- **"Where?"** — free-text input with autocomplete/suggestions drawn from the Phase 0 suburb list (grouped by area, as above), but not forced — leave blank to search all of Polokwane
- Search button

Behavior:

- On submit, navigate to `/search/?q=<what>&suburb=<where>` (both optional — either can be blank)
- Progressive enhancement: the form works as a plain GET even if JS hasn't hydrated yet, since `/search/` reads the query string
- Style with your existing brand (`#0f2e1a` dark green), not Brabys' orange — this is a UI pattern being borrowed, not a visual clone

Placement: homepage hero, sitting above or alongside the existing "What are you looking for?" category grid — do not remove that grid, it's live internal linking that Google has already indexed and values. Also worth adding a compact version of the bar to the site header so it's reachable from every page.

## A–Z browse option (Cylex also offers this)

Not everyone wants to type — Cylex pairs its "What? / Where?" search with an A–Z category index, and saYellow's biggest weakness was forcing a search-only path. Give PolokwaneHub the same fallback: a pure-browse way to find things.

What to add:

- An A–Z businesses index: `/businesses/` (or similar), listing every business name alphabetically with jump links (A, B, C… at the top, anchored to sections on the page). Reuses the Phase 1 search index as its data source — no new content needed.
- An A–Z categories index: since your categories are already a manageable list (9 sections), a simple alphabetised version of `/category/` covers this with almost no extra work — mostly a sort order, not a new page.
- Both live as small "Browse A–Z" links near the SearchBar (e.g. "or browse alphabetically"), so it's an option, not a competing feature.

Why this is safe for SEO too: unlike `/search/`, an A–Z index is genuinely useful to index — it's just another way to link to your existing listing/category pages, which strengthens internal linking rather than risking it. Leave it indexable (no noindex) and add it to sitemap.xml.

Build note: this can be a static Astro page generated at build time from the same content collection as everything else — no Pagefind/Fuse.js dependency, since there's no keyword matching involved, just alphabetical sorting.

## Phase 4 — Build the /search/ results page

Create `src/pages/search.astro` (or `search/index.astro`):

1. On load, read `q` and `suburb` from `Astro.url.searchParams` (or client-side `URLSearchParams` if fully client-rendered).
2. Query Pagefind (or Fuse.js) with those values; filter by suburb if provided.
3. Render results reusing your existing listing-card component — same look as suburb/category pages, so results feel native to the site rather than bolted on.
4. Handle the empty state: "No results for '<query>' in <suburb>" with a suggestion to browse `/category/` or `/suburb/` instead — this also quietly reinforces those existing indexed pages.
5. Show the active filters (what was searched, which suburb) with an easy way to clear/change them, so users aren't stuck re-typing from scratch.

## Phase 5 — SEO safety (the non-negotiable part)

The risk was never "adding search" — it's changing or removing URLs Google already has indexed. This phase is what guarantees that doesn't happen.

1. Add `<meta name="robots" content="noindex,follow">` to `/search/`. Search-results pages add no unique value to the index and risk duplicate-content flags. `follow` keeps link equity flowing through any links on the results page.
2. Exclude `/search/` and `/search-index.json` from sitemap.xml. Noindexed pages don't belong in a sitemap.
3. Check robots.txt — optionally add `Disallow: /search/` as a second layer, though noindex alone is sufficient.
4. Do not change any existing URL. No renaming `/suburb/{slug}/`, `/category/{slug}/`, `/section/{slug}/`, or individual listing pages. No new redirects.
5. Don't remove existing internal links. The homepage's category grid and suburb list are indexed internal-linking signals — the search bar is added alongside them, not instead of them.
6. No changes to canonical tags on any existing page.

If every one of these six points holds, there is no mechanism by which this feature could affect existing rankings — it's additive only.

## Phase 6 — Testing and rollout

1. Build and test locally in VS Code — confirm `npm run build` generates `/search-index.json` (or the Pagefind index) with the correct business count.
2. Deploy to a preview/staging branch first (Netlify, Vercel, and Cloudflare Pages all give free PR previews) rather than pushing straight to production.
3. On the preview URL, click through a handful of existing suburb and listing pages — confirm they render identically to production, untouched.
4. Test the search itself: a few keyword-only searches, a few suburb-only searches, a few combined, and one that should return zero results (confirm the empty state works).
5. Confirm `/search/` shows `noindex` in page source on the preview build.
6. Promote to production once satisfied.
7. In the week after go-live, spot-check 5–10 previously-indexed pages in Google Search Console's URL Inspection tool to confirm Google still sees them exactly as before.
8. No sitemap resubmission needed — you haven't changed any indexed URL, only added a new noindexed one.

## Quick checklist

- [ ] Locate the content collection driving listing/suburb/category pages
- [ ] Build search-index.json.ts endpoint, verify business count matches site total
- [ ] Install Pagefind, add postbuild script, tag listing templates with `data-pagefind-filter="suburb:..."`
- [ ] Build SearchBar.astro — "What?" / "Where?" fields, suburb autocomplete from the grouped list, brand-green styling
- [ ] Add SearchBar to homepage hero (keep existing category grid) and site header
- [ ] Build /search/ results page, reusing existing listing-card component
- [ ] Add empty-state handling and active-filter display
- [ ] Add noindex,follow meta to /search/
- [ ] Exclude /search/ and /search-index.json from sitemap.xml
- [ ] Confirm no existing URLs, redirects, or canonical tags changed
- [ ] Deploy to preview/staging, click through existing pages unchanged
- [ ] Test keyword-only, suburb-only, combined, and zero-result searches
- [ ] Promote to production
- [ ] Spot-check indexed pages in Search Console a week after go-live
- [ ] Build A–Z businesses index and A–Z categories index, linked near the SearchBar
- [ ] Leave A–Z pages indexable and add them to sitemap.xml
