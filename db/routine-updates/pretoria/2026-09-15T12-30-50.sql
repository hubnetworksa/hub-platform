INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fishaways-eldoraigne-eldoraigne', 'Fishaways Eldoraigne',
  (SELECT id FROM suburbs WHERE slug = 'eldoraigne'),
  (SELECT id FROM shopping_centers WHERE slug = 'eldoraigne-village-shopping-centre-eldoraigne'),
  'Shop 57, Eldoraigne Village Shopping Centre, 1033 Saxby Avenue, Eldoraigne, Centurion, 0157', '012 654 9968', NULL, NULL,
  'Fishaways Eldoraigne is a seafood and fish & chips takeaway, in Eldoraigne Village Shopping Centre, Eldoraigne.',
  NULL, NULL,
  '["https://locations.fishaways.co.za/restaurants-EldoraigneVillageShoppingCentre-FishawaysEldoraigne", "https://www.opendi.co.za/centurion/151011.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fishaways-eldoraigne-eldoraigne'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'urban-roast-eldoraigne-eldoraigne', 'Urban Roast Eldoraigne',
  (SELECT id FROM suburbs WHERE slug = 'eldoraigne'),
  (SELECT id FROM shopping_centers WHERE slug = 'eldoraigne-village-shopping-centre-eldoraigne'),
  'Eldoraigne Village Shopping Centre, 1033 Saxby Avenue, Eldoraigne, Centurion, 0157', '012 654 0380', NULL, NULL,
  'Urban Roast Eldoraigne is a neighbourhood restaurant in Eldoraigne Village Shopping Centre, serving breakfasts, light lunches, steaks, grills, burgers and roast meals.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/urban-roast-2108", "https://www.mrd.com/delivery/restaurant/urban-roast_eldoraigne/14453"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'urban-roast-eldoraigne-eldoraigne'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
