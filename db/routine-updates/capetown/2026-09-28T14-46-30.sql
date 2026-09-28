INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'portlands-meat-hyper-portland', 'Portlands Meat Hyper & Deli',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Cnr Silversands and Merrydale Roads, Portlands, Mitchells Plain, Cape Town, 7785', '021 371 6882', 'https://portlandsmeat.co.za/', NULL,
  'Portlands Meat Hyper & Deli is a butchery and deli in Portlands, Mitchells Plain.',
  NULL, NULL,
  '["https://portlandsmeat.co.za/", "https://www.facebook.com/p/Portlands-Meat-Hyper-Deli-100066890422860/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'portlands-meat-hyper-portland'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
