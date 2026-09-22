INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gringos-cantina-boston', 'Gringo''s Cantina',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  '39 12th Avenue, Boston, Bellville, Cape Town, 7530', '071 894 1402', NULL, NULL,
  'Gringo''s Cantina is a Mexican-style restaurant and pizzeria, in Boston, Bellville.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/gringos-cantina-62393", "https://triptap.com/places/za/western-cape/cape-town/gringos-cantina-pizzeria-t00bf748"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gringos-cantina-boston'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fabric-friends-boston', 'Fabric Friends',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  'Shops 1 & 2, Ramir Court, Cleveland Street, Boston, Bellville, Cape Town, 7530', '021 949 7800', NULL, NULL,
  'Fabric Friends is a fabric and haberdashery shop in Boston, Bellville, selling material, ribbons, buttons and trimmings.',
  NULL, NULL,
  '["https://www.brabys.com/business/4813212/south-africa/western-cape/bellville/boston/cleveland-st/fabrics/fabric-friends", "https://za.africabz.com/western-cape/fabric-friends-101962"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fabric-friends-boston'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'willem-hair-design-boston', 'Willem Hair Design',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  '88 13th Avenue, Boston, Bellville, Cape Town, 7530', '072 250 7690', NULL, NULL,
  'Willem Hair Design is a hair salon in Boston, Bellville, offering haircuts, colour treatments and styling.',
  NULL, NULL,
  '["https://www.fresha.com/a/willem-hair-design-cape-town-88-13th-avenue-uu5e09ve", "https://www.facebook.com/Willemhairdesign0303/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'willem-hair-design-boston'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
