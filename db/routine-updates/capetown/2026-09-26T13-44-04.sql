-- Suburb checkpoint: capri-village (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'living-hope-capri-village', 'Living Hope',
  (SELECT id FROM suburbs WHERE slug = 'capri-village'),
  '7 Kommetjie Main Road, Capri, Fish Hoek, Cape Town, 7975', '021 784 2800', NULL, NULL,
  'Living Hope is a non-profit organisation running a community health care centre in Capri, Fish Hoek.',
  NULL, NULL,
  '["https://www.livinghope.co.za/contact-us/", "https://www.yep.co.za/biz/store/living-hope/218685"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'living-hope-capri-village'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
