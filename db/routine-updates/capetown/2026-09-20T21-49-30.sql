INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'golden-river-spur-fish-hoek', 'Golden River Spur',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'fish-hoek-town-square-fish-hoek'),
  '1st Floor, Fish Hoek Town Square, Main Road, Fish Hoek, Cape Town, 7975', '021 782 2631', NULL, NULL,
  'Golden River Spur is a Spur Steak Ranches family restaurant on the first floor of Fish Hoek Town Square.',
  NULL, NULL,
  '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/fish+hoek/golden-river-spur", "https://www.eatout.co.za/venue/spur-fish-hoek/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'golden-river-spur-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'warrens-pharmacy-fish-hoek', "Warren's Pharmacy",
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '71 Main Road, Fish Hoek, Cape Town, 7975', '021 782 1101', NULL, NULL,
  "Warren's Pharmacy is an independent pharmacy on Main Road, Fish Hoek.",
  NULL, NULL,
  '["https://za.africabz.com/western-cape/warrens-pharmacy-62617", "https://www.brabys.com/za/western-cape/fish-hoek/pharmacies/warrens-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'warrens-pharmacy-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-fish-hoek', 'Clicks Pharmacy Fish Hoek',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Shop 8-10, Devonshire Court, Cnr Main Road & Recreation Road, Fish Hoek, Cape Town, 7975', '021 782 8683', NULL, NULL,
  'Clicks Pharmacy Fish Hoek is a pharmacy and health, beauty and homeware retailer at Devonshire Court on the corner of Main and Recreation Roads.',
  NULL, NULL,
  '["https://clicks.co.za/store/Fish-Hoek/1685", "https://nearbyza.com/place/clicks-pharmacy-fish-hoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
