INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'randy-warthog-bar-grill-green-point', 'Randy Warthog Bar & Grill',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '107 Main Road, Green Point, Cape Town, 8005', '021 434 9282', NULL, NULL,
  'Randy Warthog Bar & Grill is a bar and grill inside the Never at Home backpackers on Main Road, Green Point.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g12880258-d15856847-Reviews-Randy_Warthog_Bar_Grill-Green_Point_Western_Cape.html", "https://www.dining-out.co.za/md/Randy-Warthog-Restaurant-and-Bar/9761"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'randy-warthog-bar-grill-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jason-bakery-green-point', 'Jason Bakery',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '83 Main Road, Green Point, Cape Town, 8005', '021 433 0538', NULL, NULL,
  'Jason Bakery is an artisan bakery and cafe on Main Road in Green Point, known for its croissants and weekend doughssants.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/jason-bakery-green-point/", "https://insideguide.co.za/cape-town/restaurants/jason-bakery-green-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jason-bakery-green-point'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
