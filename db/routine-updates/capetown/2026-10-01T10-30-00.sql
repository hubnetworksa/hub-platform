INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-basket-sea-point', 'Ocean Basket',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Shop 17, 1st Floor, St Johns Piazza, Main Road, Sea Point, Cape Town', '021 433 0450', NULL, NULL,
  'Ocean Basket Sea Point is a seafood restaurant branch of the Ocean Basket chain, in St Johns Piazza on Main Road, Sea Point.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/ocean-basket-seapoint/", "https://oceanbasket.co.za/our-restaurants/ocean-basket-seapoint/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-basket-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barksole-sea-point-sea-point', 'Barksole Sea Point',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '154 Main Road, Sea Point, Cape Town, 8005', '065 574 8469', NULL, NULL,
  'Barksole Sea Point is a branch of the Barksole repair chain offering shoe, luggage and leather goods repairs, key cutting and engraving, in Sea Point.',
  NULL, NULL,
  '["https://barksole.co.za/store-locator/sea-point/", "https://www.sayellow.com/view/south-africa/barksole-sea-point-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barksole-sea-point-sea-point'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
