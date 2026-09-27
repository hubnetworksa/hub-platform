INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'canterbury-house-bishopscourt', 'Canterbury House',
  (SELECT id FROM suburbs WHERE slug = 'bishopscourt'),
  '16 Canterbury Drive, Bishopscourt, Cape Town, 7708', '+27 82 412 9335', NULL, NULL,
  'Canterbury House is a bed & breakfast and self-catering guesthouse in Bishopscourt.',
  NULL, NULL,
  '["https://www.afristay.com/p/2231", "https://www.canterburyhouse.co.za/contact.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'canterbury-house-bishopscourt'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'arambrook-boutique-hotel-bishopscourt', 'Arambrook Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'bishopscourt'),
  '15 Kirstenbosch Drive, Bishopscourt, Cape Town, 7708', '+27 82 449 4949', NULL, NULL,
  'Arambrook Boutique Hotel is a small luxury hotel in Bishopscourt, near Kirstenbosch.',
  NULL, NULL,
  '["https://www.expedia.com/Cape-Town-Hotels-Arambrook-Boutique-Hotel.h32442732.Hotel-Information", "https://arambrook.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'arambrook-boutique-hotel-bishopscourt'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
