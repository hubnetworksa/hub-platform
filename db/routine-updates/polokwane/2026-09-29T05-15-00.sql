INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rite-price-liquor-store-ladanna', 'Rite Price Liquor Store',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '13 Witklip Street, Ladanna, Polokwane, 0700', '015 293 0731', NULL, NULL,
  'Rite Price Liquor Store is a bottle store stocking a range of liquor, beverages, snacks, water and ice, in Ladanna.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/6924587_2", "https://www.aiyellow.com/ritepriceoverlandliquors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rite-price-liquor-store-ladanna'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
