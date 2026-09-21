INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'phoenix-industrial-safety-supplies-superbia', 'Phoenix Industrial & Safety Supplies',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '13 Cobalt Street, Superbia, Polokwane, 0759', '015 292 4230', NULL, 'plksales@phoenixindustrial.co.za',
  'Phoenix Industrial & Safety Supplies is a PPE and industrial safety supplies branch on Cobalt Street, part of a national safety-equipment supplier.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/phoenix-industrial-and-safety-supplies-in-polokwane", "https://www.brabys.com/za/limpopo/polokwane/safety-clothing/phoenix-industrial-safety-supplies", "https://phoenixindustrial.co.za/polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'phoenix-industrial-safety-supplies-superbia'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'allpro-truck-and-trailer-components-superbia', 'Allpro Truck and Trailer Components',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '46 Platinum Street, Superbia, Polokwane, 0700', '015 293 0334', NULL, NULL,
  'Allpro Truck and Trailer Components supplies truck body parts, spares and trailer accessories on Platinum Street.',
  NULL, NULL,
  '["https://www.shopshours.co.za/engine-parts/polokwane", "https://polokwane.infoisinfo.co.za/search/truck/b/pietersburg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'allpro-truck-and-trailer-components-superbia'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
