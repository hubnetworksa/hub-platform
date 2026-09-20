INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-lentegeur-lentegeur', 'Shoprite Lentegeur',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  'Cnr Merrydale Road & Lavender Street, Lentegeur, Mitchells Plain, Cape Town', '021 370 2540', NULL, NULL,
  'Shoprite Lentegeur is a supermarket, in Lentegeur.',
  NULL, NULL,
  '["https://za.polomap.com/mitchells-plain/29300", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Lentegeur/4790"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-lentegeur-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'candy-cartel-lentegeur', 'Candy Cartel',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  'Azalia Crescent, Lentegeur, Cape Town', '082 256 7938', NULL, NULL,
  'Candy Cartel is a wholesale sweet and candy shop, in Lentegeur.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/candy-cartel-485204", "https://www.facebook.com/p/Candy-Cartel-100063696634817/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'candy-cartel-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
