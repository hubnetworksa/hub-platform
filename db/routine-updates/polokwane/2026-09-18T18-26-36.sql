INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'myface-beauty-and-stylist-seshego', 'MyFace Beauty and Stylist',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '9 37th Street, Seshego-B, Polokwane, 0742', '079 038 2850', NULL, NULL,
  'MyFace Beauty and Stylist is a beauty salon in Seshego-B offering facials, skincare, makeup and dermaplaning services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/myface-beauty-and-stylist-37th-street-polokwane-a2GJjY", "https://www.facebook.com/myfacemobilebs/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'myface-beauty-and-stylist-seshego'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
