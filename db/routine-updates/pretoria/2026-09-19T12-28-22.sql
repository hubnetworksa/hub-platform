INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-leeuwfontein-leeuwfontein', 'SPAR Leeuwfontein',
  (SELECT id FROM suburbs WHERE slug = 'leeuwfontein'),
  'Plot 204, Kameelfontein Road, Leeuwfontein, Roodeplaat', '082 866 8461', NULL, NULL,
  'SPAR Leeuwfontein is a supermarket serving the Leeuwfontein/Roodeplaat area.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/leeuwfontein/spar/plot-204-kameelfontein", "https://tiendeo.co.za/stores/roodeplaat/spar-tops-plot-leeuwfontein/44542"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-leeuwfontein-leeuwfontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
