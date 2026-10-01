-- Suburb research: retreat (2 new businesses)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'holly-wood-kitchens-and-furniture-retreat', 'Holly Wood Kitchens and Furniture',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  '6 Honeywell Road, Retreat, Cape Town, 7945', '021 701 7737', 'https://hollywooddesignstudio.com', NULL,
  'Holly Wood Kitchens and Furniture is a kitchen and furniture manufacturer and retailer on Honeywell Road in Retreat.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099859734970368/holly-wood-kitchens-and-furniture/retreat/furniture", "https://www.cylex.net.za/company/holly-wood-kitchens-and-furniture-17765552.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'holly-wood-kitchens-and-furniture-retreat'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shopmate-fish-traders-retreat', 'Shopmate Fish Traders',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  '11 Joseph Anderson Street, Retreat, Cape Town, 7945', '083 951 1663', 'https://www.shopmate.co.za', NULL,
  'Shopmate Fish Traders is a fresh and frozen seafood supplier in Retreat, delivering daily to restaurants and retail stores across the Western Cape.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099862268551168/shopmate/retreat/foods", "https://cape-town.infoisinfo.co.za/card/shopmate/517122"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shopmate-fish-traders-retreat'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
