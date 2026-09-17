-- Jobs 1-2: bendor suburb research -- new tenant of Mall of the North
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-union-mart-mall-of-the-north-bendor', 'Cape Union Mart',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'),
  'Shop U14, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1067', NULL, NULL,
  'Cape Union Mart is a national outdoor-adventure retailer, and this Mall of the North branch stocks hiking, camping, travel and outdoor clothing and gear.',
  NULL, NULL,
  '["https://mallofthenorth.co.za/shop/cape-union-mart/", "https://www.facebook.com/p/Cape-Union-Mart-Mall-of-the-North-100089369502396/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-union-mart-mall-of-the-north-bendor'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
