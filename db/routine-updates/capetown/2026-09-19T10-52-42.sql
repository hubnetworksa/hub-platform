-- Bellville suburb checkpoint (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'melomed-bellville-pharmacy-bellville', 'Melomed Bellville Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Corner of Voortrekker Road & A J West Street, Bellville, Cape Town, 7530', '021 950 8920', NULL, NULL,
  'Melomed Bellville Pharmacy is a pharmacy attached to Melomed Bellville Hospital, on the corner of Voortrekker Road and A J West Street.',
  NULL, NULL,
  '["https://www.melomed.co.za/services/melomed_pharmacy.asp?m=Melomed+Pharmacies", "https://aamworx.com/business-directory/3962/melomed-bellville-pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'melomed-bellville-pharmacy-bellville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

-- New shopping centre discovered via general suburb research (job 2); too large (243 stores per
-- its own site) to enumerate tenants via blocked-WebFetch/WebSearch-snippets this run -- queued
-- for job 3's official-site sweep on a future run instead.
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tyger-valley-shopping-centre-bellville', 'Tyger Valley Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Corner of Bill Bezuidenhout Ave & Willie Van Schoor Drive, Bellville Park, Cape Town, 7530', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Tyger_Valley_Shopping_Centre", "https://www.tygervalley.co.za/", "https://www.pareto.co.za/portfolio/tyger-valley-shopping-centre/"]',
  'mall'
);
