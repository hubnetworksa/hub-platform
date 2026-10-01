INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'wonderpark-shopping-centre-akasia', 'Wonderpark Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  'Cnr Brits Rd & Heinrich Ave, Karenpark, Akasia', NULL, NULL,
  '["https://emira.co.za/?p=977", "https://en.wikipedia.org/wiki/Akasia"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'casa-de-ross-akasia', 'Casa de Ross',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '353 & 349 Kremetart Avenue, Amandasig, Akasia, 0182', '072 583 5021', 'https://www.casadeross.co.za', NULL,
  'Casa de Ross is a guest house in Amandasig, Akasia, set in the foothills of the Magaliesberg mountain range near Rosslyn and Wonderpark Shopping Centre, offering a swimming pool, braai facilities, a dining hall for up to twenty guests and secure parking for fifteen vehicles.',
  NULL, NULL,
  '["https://www.casadeross.co.za", "https://lekkeslaap.co.za/accommodation/casa-de-ross"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'casa-de-ross-akasia'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
