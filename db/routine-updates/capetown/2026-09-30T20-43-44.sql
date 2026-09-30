-- Belhar (job 1/2): 1 new business, tenant of the already-known Cavalier Shopping Centre

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salon-jean-paul-belhar', 'Salon Jean Paul',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'cavalier-shopping-centre-belhar'),
  'Shop 9, Cavalier Shopping Centre, Robert Sobukwe Road, Belhar, Cape Town, 7493', '021 934 1122', NULL, NULL,
  'Salon Jean Paul is a hair salon inside Cavalier Shopping Centre in Belhar, offering hairstyling, braiding, colouring and other hair services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/salon-jean-paul-belhar-robert-sobukwe-road-cape-town-30Ar44", "https://www.brabys.com/za/western-cape/bonteheuwel/belhar/unisex-hairdressers/salon-jean-paul-unisex"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salon-jean-paul-belhar'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
