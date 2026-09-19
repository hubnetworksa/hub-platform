INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-heathfield-heathfield', 'Tops at Spar Heathfield',
  (SELECT id FROM suburbs WHERE slug = 'heathfield'),
  '35 Main Road, Heathfield, Cape Town, 7945', '021 712 2744', NULL, NULL,
  'Tops at Spar Heathfield is a liquor store on Main Road in Heathfield, offering wines, spirits and beers.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/heathfield/tops-at-spar/35-main-road", "https://za.africabz.com/western-cape/tops-at-spar-heathfield-393235"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-heathfield-heathfield'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
