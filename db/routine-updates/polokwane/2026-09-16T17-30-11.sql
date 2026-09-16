INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fairplay-hardware-lebowakgomo', 'Fairplay Hardware',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Stand 23BA, Lebowakgomo Central, behind Mall@Lebo, Mohlala Rd, Lebowakgomo, 0737', '015 491 7321', 'https://fairplay.co.za/', NULL,
  'Fairplay Hardware Lebowakgomo is a hardware, building materials and decor store in Lebowakgomo Central.',
  NULL, NULL,
  '["https://www.jojo.co.za/distributor/fairplay-hardware-lebowakgomo/", "https://www.top-rated.online/cities/Lepelle-Nkumpi+Local+Municipality/place/p/8041974/Fairplay+Hardware+Lebowakgomo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fairplay-hardware-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'supa-roof-lebowakgomo', 'Supa-Roof Lebowakgomo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Shop 24 BA, next to Fairplay Hardware, Mohlala Rd, Lebowakgomo, 0737', '079 843 0181', 'https://suparoof.co.za/lebowakgomo/', NULL,
  'Supa-Roof Lebowakgomo is a roofing hardware retailer supplying IBR, corrugated and tile roof sheeting.',
  NULL, NULL,
  '["https://suparoof.co.za/lebowakgomo/", "https://www.datanyze.com/people/Supa--Roof-Lebowakgomo/9469272657"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'supa-roof-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'building-materials-timber-merchants'),
  1
);
