INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-milk-restaurant-khayelitsha', 'The Milk Restaurant & Champagne Bar',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '33 Zantsi Street, corner Makabeni Road, Village 1 North, Khayelitsha, Cape Town, 7784', '+27 81 414 8913', NULL, NULL,
  'The Milk Restaurant & Champagne Bar is a fine-dining restaurant with a rooftop lounge-bar in Khayelitsha.',
  NULL, NULL,
  '["https://www.bizcommunity.com/Article/196/436/224148.html", "https://insideguide.co.za/cape-town/restaurants/the-milk-restaurant-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-milk-restaurant-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'silulo-ulutho-technologies-khayelitsha-mall-khayelitsha', 'Silulo Ulutho Technologies (Khayelitsha Mall)',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'khayelitsha-mall-khayelitsha'),
  '10A Khayelitsha Mall, Khayelitsha, Cape Town, 7784', '021 361 3212', NULL, NULL,
  'Silulo Ulutho Technologies is a South African computer sales, training and internet cafe chain; its Khayelitsha Mall branch is inside the mall.',
  NULL, NULL,
  '["https://siluloulutho.co.za/branches/", "https://www.yellosa.co.za/company/786478/silulo-ulutho-technologieskhayelitsha-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'silulo-ulutho-technologies-khayelitsha-mall-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'silulo-ulutho-technologies-town-1-village-1-khayelitsha', 'Silulo Ulutho Technologies (Town 1 Village 1)',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '13 Makabeni Road, Khayelitsha Town 1 Village 1, Cape Town, 7784', '021 361 0488', NULL, NULL,
  'Silulo Ulutho Technologies is a South African computer sales, training and internet cafe chain; this branch is in Khayelitsha''s Town 1 Village 1.',
  NULL, NULL,
  '["https://siluloulutho.co.za/branches/", "https://www.thinklocal.co.za/biz/silulo-ulutho-technologies-khayelitsha"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'silulo-ulutho-technologies-town-1-village-1-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
