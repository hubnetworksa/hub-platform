INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-paledi-mall-mankweng', 'Woolworths Paledi Mall',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Paledi Mall, R71, Mankweng, Polokwane, 0727', '+27 15 286 0660', NULL, NULL,
  'Woolworths Paledi Mall is a food and clothing retailer inside Paledi Mall, Mankweng.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/woolworths-paledi-mall-189903", "https://www.tiendeo.co.za/stores/polokwane/woolworths-erf-mankweng-turfloop-township-ext-on-road-r/3065"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-paledi-mall-mankweng'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greytow-salon-mankweng', 'GreyTow Salon',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'University Road, Turfloop, near Shoprite Centre (Gate 2), Mankweng', '+27 65 908 8198', NULL, NULL,
  'GreyTow Salon is a hair salon in Turfloop, Mankweng, offering braids and hairstyling by appointment.',
  NULL, NULL,
  '["https://www.instagram.com/greytow_salon/", "https://www.facebook.com/GreyTowHairSalon/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'greytow-salon-mankweng'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
