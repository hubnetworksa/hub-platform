INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'noordhoek-garden-emporium-noordhoek', 'Noordhoek Garden Emporium',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  'Cnr Katzenellenbogen Street & Noordhoek Main Road, Noordhoek, Cape Town, 7979', NULL, NULL,
  '["https://www.facebook.com/NoordhoekGardenEmporium/", "https://noordhoekgardenemporium.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-femme-health-and-beauty-noordhoek', 'La Femme Health & Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-garden-emporium-noordhoek'),
  'Noordhoek Garden Emporium, Cnr Katzenellenbogen Street & Noordhoek Main Road, Noordhoek, Cape Town, 7979', '021 789 2425', NULL, NULL,
  'La Femme Health & Beauty Salon is a beauty salon and spa in Noordhoek Garden Emporium, Noordhoek.',
  NULL, NULL,
  '["https://www.facebook.com/lafemmenoordhoek/", "https://lafemmebeauty.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-femme-health-and-beauty-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-dutch-gardens-noordhoek', 'Cape Dutch Gardens',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-garden-emporium-noordhoek'),
  'Noordhoek Garden Emporium, Cnr Katzenellenbogen Street & Noordhoek Main Road, Noordhoek, Cape Town, 7979', '021 789 2100', NULL, NULL,
  'Cape Dutch Gardens is a nursery and garden centre in Noordhoek Garden Emporium, Noordhoek, stocking plants, trees, pots, decor and irrigation supplies.',
  NULL, NULL,
  '["https://www.capedutchgardens.co.za/", "https://www.brabys.com/za/western-cape/cape-town/noordhoek/nurseries/cape-dutch-gardens"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-dutch-gardens-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sbg-cape-town-noordhoek', 'SBG Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-garden-emporium-noordhoek'),
  'Studio 2, Noordhoek Garden Emporium, Noordhoek Main Road, Noordhoek, Cape Town, 7975', '083 760 1183', NULL, NULL,
  'SBG Cape Town is a martial arts gym in Noordhoek Garden Emporium, Noordhoek, offering jiu-jitsu, MMA and kickboxing classes.',
  NULL, NULL,
  '["https://sbgcapetown.co.za/contact/", "https://www.slapbump.co.za/gym/sbg-noordhoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sbg-cape-town-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
