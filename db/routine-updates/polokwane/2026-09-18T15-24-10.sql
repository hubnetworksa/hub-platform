INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mj-gateway-lodge-dalmada', 'MJ Gateway Lodge',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  '14 Geluk Street, Dalmada, Polokwane, 0700', '015 263 6390', NULL, NULL,
  'MJ Gateway Lodge is a guesthouse offering accommodation, conferencing and catering services, in Dalmada.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/lp/polokwane/accommodation-establishments/m-j-gateway-lodge_158172+5.html", "https://za.polomap.com/polokwane/3745"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mj-gateway-lodge-dalmada'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
