INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'la-piazza-richwood', 'La Piazza',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  '39 Nederberg Drive, Richwood, Cape Town, 7441', NULL, NULL,
  '["https://www.property24.com/for-sale/richwood/milnerton/western-cape/8072/115891035", "https://galetti.co.za/property/western-cape/milnerton/richwood/66d2019e958dc2e06239bb72"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beauty-place-richwood', 'Beauty Place',
  (SELECT id FROM suburbs WHERE slug = 'richwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'la-piazza-richwood'),
  'Shop 12, La Piazza Complex, 39 Nederberg Drive, Richwood, Cape Town, 7441', '+27 81 599 9745', NULL, NULL,
  'Beauty Place is a beauty salon in La Piazza Complex, Richwood, offering nails, lashes, make-up and braiding.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/beauty-place-nederberg-drive-cape-town-znJqR2", "https://www.facebook.com/p/Beauty-Place-61552646675018/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beauty-place-richwood'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
