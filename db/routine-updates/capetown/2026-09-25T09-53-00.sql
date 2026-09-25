INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-liberty-promenade-mitchells-plain', 'Steers',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 196, Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 376 7209', NULL, NULL,
  'Steers is a flame-grilled burger and chicken takeaway at Liberty Promenade in Mitchells Plain.',
  NULL, NULL,
  '["https://location.steers.co.za/promenade", "https://libertypromenade.co.za/shops/steers/", "https://www.tiendeo.co.za/stores/mitchells-plain/steers-shop-promenade-food-court-promenade-centre/36043"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'central-pharmacy-mitchells-plain', 'Central Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  '5 Minuet Lane, Mitchells Plain Town Centre, Cape Town, 7785', '021 391 1691', NULL, NULL,
  'Central Pharmacy is a pharmacy in Mitchells Plain Town Centre.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10699190_2", "https://za.polomap.com/cape-town/29955"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'central-pharmacy-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
