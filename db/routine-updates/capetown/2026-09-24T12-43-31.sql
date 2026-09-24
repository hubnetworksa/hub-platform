-- Rondebosch: 5 new Riverside Mall tenants discovered via general suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'danneberg-optometrist-rondebosch', 'Danneberg Optometrist',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 4, Riverside Mall, Belmont Rd, Rondebosch, Cape Town, 7701', '021 685 3726', 'https://www.danneberg.co.za', NULL,
  'Danneberg Optometrist is an eye-care practice and optical shop inside Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://mallguide.co.za/shops/view/44695/riverside-mall-rondebosch/danneberg-optometrist", "https://za.africabz.com/western-cape/danneberg-optometrist-160416"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'danneberg-optometrist-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vitacare-pharmacy-rondebosch', 'Vitacare Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 15, Riverside Mall, Main Rd, Rondebosch, Cape Town, 7700', '021 685 3030', NULL, NULL,
  'Vitacare Pharmacy is a retail pharmacy inside Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/vitacare-pharmacies/149917", "https://za.readymap.info/4/208"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vitacare-pharmacy-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-italian-art-shop-rondebosch', 'The Italian Art Shop',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Ground Floor, Riverside Mall, cnr Main Road and Rosedale Road, Rondebosch, Cape Town, 7700', '021 685 1877', 'https://www.italianartshop.co.za', 'info@italianartshop.co.za',
  'The Italian Art Shop is an art materials and supplies retailer inside Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://riversiderondebosch.co.za/store/italian-art-shop/", "https://za.africabz.com/western-cape/italian-artshop-the-41848"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-italian-art-shop-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sure-2-travel-rondebosch', 'Sure 2 Travel',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  '1 Riverside Mall, Main Road, Rondebosch, Cape Town, 7700', '021 685 2226', NULL, NULL,
  'Sure 2 Travel is a travel agency inside Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/sure-2-travel-rondebosch", "https://www.yep.co.za/biz/store/sure-2-travel/166870"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sure-2-travel-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mtn-store-rondebosch', 'MTN Store',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 11, Riverside Mall, Main Road, Rondebosch, Cape Town, 7700', '021 853 2747', 'https://www.mtn.co.za', NULL,
  'MTN Store is a mobile network retail store inside Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/9540", "http://2pos.co.za/2/3816"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mtn-store-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);
