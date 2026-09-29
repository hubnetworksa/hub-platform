INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medellin-harrington-district-six', 'Medellin Harrington',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '99 Harrington Street, District Six, Cape Town, 7925', '072 698 3152', 'https://medellin.co.za/harrington/', NULL,
  'Medellin Harrington is a men''s grooming barbershop on Harrington Street in District Six, offering haircuts, hair styling, hot towel shaves, manicures, pedicures and massages.',
  NULL, NULL,
  '["https://medellin.co.za/harrington/", "https://www.fresha.com/lvp/medellin-gentlemen-groomers-harrington-harrington-street-cape-town-loPj11"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medellin-harrington-district-six'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tambourine-district-six', 'Tambourine',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '104 Harrington Street, District Six, Cape Town, 8000', '021 612 0528', 'https://tambourine.co.za/', NULL,
  'Tambourine is a small-plates restaurant in a renovated heritage building in District Six, focused on local, seasonal and sustainable Cape cuisine, including pasture-raised meat and line-caught fish.',
  NULL, NULL,
  '["https://tambourine.co.za/", "https://www.capetownccid.org/news/t-tambourine-cape-town-cbds-new-eatery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tambourine-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
