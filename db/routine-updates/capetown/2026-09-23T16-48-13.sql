-- Jobs 1-2: Fish Hoek suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-stag-and-maiden-cafe-fish-hoek', 'The Stag & Maiden Cafe',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Shop 6, Recreation Road, Fish Hoek, Cape Town, 7975', '082 773 3265', NULL, NULL,
  'The Stag & Maiden Cafe is a family-run coffee shop and cafe serving breakfast, brunch and lunch, in Fish Hoek.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g635515-d12557424-Reviews-The_Stag_Maiden_Cafe-Fish_Hoek_Western_Cape.html", "https://za.africabz.com/western-cape/the-stag-coffee-company-10485"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-stag-and-maiden-cafe-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'watsons-meat-market-fish-hoek', 'Watson''s Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '146A Main Road, Fish Hoek, Cape Town, 7975', '021 782 4357', NULL, NULL,
  'Watson''s Meat Market is a butchery on Main Road offering meat, produce and groceries, in Fish Hoek.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/watsons-meat-market", "https://www.yep.co.za/biz/store/watsons-meat-market/374158"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'watsons-meat-market-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fish-hoek-veterinary-clinic-fish-hoek', 'Fish Hoek Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '77 Kommetjie Road, Fish Hoek, Cape Town, 7975', '021 782 1279', NULL, NULL,
  'Fish Hoek Veterinary Clinic is a SAVA-listed small-animal veterinary practice offering wellness, surgery, diagnostics and exotics services, in Fish Hoek.',
  NULL, NULL,
  '["https://savet.co.za/vet/fish-hoek-veterinary-clinic", "https://topvet.net/practices/south-africa/western-cape/cape-town/fish-hoek-veterinary-clinic-26581"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fish-hoek-veterinary-clinic-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-fish-hoek-galley-fish-hoek', 'The Fish Hoek Galley',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Bayside on Fish Hoek Beach, Beach Road, Fish Hoek, Cape Town, 7975', '021 782 3354', 'https://www.fishhoekgalley.com/', NULL,
  'The Fish Hoek Galley is a seafood restaurant at Bayside on Fish Hoek Beach, the only restaurant and takeaway located right on the beach in the southern Peninsula.',
  NULL, NULL,
  '["https://www.fishhoekgalley.com/contact/", "https://www.tripadvisor.co.za/Restaurant_Review-g635515-d6714793-Reviews-The_Galley_Restaurant-Fish_Hoek_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-fish-hoek-galley-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'warrens-pharmacy-fish-hoek', 'Warren''s Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '71 Main Road, Fish Hoek, Cape Town, 7975', '021 782 1101', NULL, NULL,
  'Warren''s Pharmacy is a retail pharmacy on Main Road, Fish Hoek.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/warrens-pharmacy-62617", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=326529"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'warrens-pharmacy-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
