-- Job 3: shopping centre official-site sweep -- Tokai on Main (pending queue)
-- No distinct official site found for this centre (only its property manager's
-- corporate pages, not a dedicated mall site/directory) -- no tenant
-- reconciliation possible this sweep. Re-issuing this already-verified INSERT
-- (idempotent, OR IGNORE) since the row is missing from the live database despite
-- 4 existing businesses already carrying its shopping_center_slug.
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tokai-on-main-tokai', 'Tokai on Main',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Main Road, Tokai, Cape Town', NULL, NULL,
  '["https://www.guzzle.co.za/malls/1141/", "https://www.mallguide.co.za/malls/view/920/tokai-on-main-shopping-centre"]',
  'mall'
);
