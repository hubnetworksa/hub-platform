INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-salon-meadowridge-meadowridge', 'Sorbet Salon Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 13, Park ''n Shop, Firgrove Way, Meadowridge, Cape Town, 7806', '021 712 3342', NULL, NULL,
  'Sorbet Salon Meadowridge is a beauty salon offering manicures, pedicures, massages, threading, tinting and waxing, in Meadowridge.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/sorbet-salon-firgrove-way-cape-town-Wq8N85", "https://za.africabz.com/western-cape/sorbet-meadowridge-79928", "https://nearbyza.com/place/sorbet-meadowridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-salon-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
