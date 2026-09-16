INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-bean-on-the-move-waterkloofrand-erasmusrand', 'Mugg & Bean On The Move Waterkloofrand',
  (SELECT id FROM suburbs WHERE slug = 'erasmusrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'waterkloof-rand-centre-erasmusrand'),
  'Shop 11, Waterkloof Rand Centre, Cnr Rigel Ave & Buffelsdrift St, Erasmusrand, Pretoria, 0181', '+27 87 163 9997', NULL, NULL,
  'Mugg & Bean On The Move Waterkloofrand is a coffee shop and casual eatery in Waterkloof Rand Centre, Erasmusrand.',
  NULL, NULL,
  '["https://location.muggandbean.co.za/waterkloofrand-otm-ls", "https://www.tripadvisor.com/Restaurant_Review-g312583-d29185776-Reviews-Mugg_Bean_On_The_Move-Pretoria_Gauteng.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mugg-bean-on-the-move-waterkloofrand-erasmusrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
