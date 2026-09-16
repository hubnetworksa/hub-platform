-- Party & Event Hire: 2 verified businesses. Caught another boundary
-- suburb ambiguity along the way: a directory listed All Seasons
-- Function Hire's "39 Lood St" as Ladanna, but adjacent addresses on the
-- same street (37 -> Ladanna, 41 -> Futura) straddle that exact
-- boundary; went with the business's own site, which self-reports Futura.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moseki-function-hire-catering-polokwane-central', 'Moseki Function Hire & Catering',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '7 Rissik Street, Polokwane Central, 0699', '015 297 7333', NULL, NULL,
  'A function and event hire company on Rissik Street in Polokwane Central, offering decor, tent and catering hire.',
  NULL, NULL,
  '["https://www.mosekifunctionhire.co.za/Contacts/", "https://polokwane.infoisinfo.co.za/card/moseki-function-hire-catering/325793"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moseki-function-hire-catering-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'party-event-hire'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'all-seasons-function-hire-futura', 'All Seasons Function Hire',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '39 Lood Street, Futura, 0699', '015 293 2778', NULL, NULL,
  'An event and tent hire company on Lood Street in Futura.',
  NULL, NULL,
  '["https://allseasonsfunctionhire.co.za/contact/", "https://www.thinklocal.co.za/biz/all-seasons-function-hire-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'all-seasons-function-hire-futura'),
  (SELECT id FROM categories WHERE slug = 'party-event-hire'),
  1
);
