INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'melissas-the-food-shop-gardens', 'Melissa''s The Food Shop',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '94 Kloof Street, Gardens, Cape Town', '021 424 5540', NULL, NULL,
  'Melissa''s The Food Shop is a delicatessen and cafe on Kloof Street selling handmade food and baked goods, in Gardens.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/melissas-the-food-shop", "https://www.eatout.co.za/venue/melissas-kloof-street-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'melissas-the-food-shop-gardens'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lifestyle-on-kloof-gardens', 'Lifestyle on Kloof',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '50 Kloof Street, Gardens, Cape Town', NULL, NULL,
  '["https://www.lifestyleonkloofct.co.za/", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/gardens/lifestyle-on-kloof-50-kloof-st-14048"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellness-warehouse-lifestyle-on-kloof-gardens', 'Wellness Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'lifestyle-on-kloof-gardens'),
  'Shop 9-10, 1st Floor, Lifestyle on Kloof, 50 Kloof Street, Gardens, Cape Town', '021 487 5420', NULL, NULL,
  'Wellness Warehouse is a health and wellness retailer inside Lifestyle on Kloof, stocking supplements, natural remedies and skincare, in Gardens.',
  NULL, NULL,
  '["https://za.near-place.com/wellness-warehouse-kloof-lifestyle-on-kloof-50-kloof-street-gardens-cape-town", "https://www.fresha.com/lvp/wellness-warehouse-lifestyle-on-kloof-kloof-street-cape-town-581GQZ"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wellness-warehouse-lifestyle-on-kloof-gardens'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'elevenpast-lifestyle-on-kloof-gardens', 'elevenpast',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'lifestyle-on-kloof-gardens'),
  'Shop 1-10, 1st Floor, Lifestyle on Kloof, 50 Kloof Street, Gardens, Cape Town', '021 201 1211', NULL, NULL,
  'elevenpast is a furniture, lighting and decor store inside Lifestyle on Kloof, in Gardens.',
  NULL, NULL,
  '["https://www.elevenpast.co.za/pages/lifestyle-on-kloof-centre", "https://www.cylex.net.za/company/elevenpast-23747132.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elevenpast-lifestyle-on-kloof-gardens'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
