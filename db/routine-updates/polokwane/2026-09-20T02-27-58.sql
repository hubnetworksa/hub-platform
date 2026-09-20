INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'online-sa-park-sell-sterpark', 'Online SA Park & Sell',
  (SELECT id FROM suburbs WHERE slug = 'sterpark'),
  '58 Munnik Ave, Sterpark, Polokwane, 0699', '079 799 3561', NULL, NULL,
  'Online SA Park & Sell is a used-vehicle sales lot in Sterpark, Polokwane.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/online-sa-park-sell-185037", "https://rsa.worldorgs.com/catalog/polokwane/motor-vehicle-dealer/online-sa-park-sell"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'online-sa-park-sell-sterpark'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
