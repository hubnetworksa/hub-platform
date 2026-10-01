INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oasis-lodge-seshego-seshego-zone-1', 'Oasis Lodge Seshego',
  (SELECT id FROM suburbs WHERE slug = 'seshego-zone-1'),
  'Zone 1, Chris Hani Drive, Seshego, 0751', '015 223 0980', NULL, NULL,
  'Oasis Lodge Seshego is a lodge offering accommodation on Chris Hani Drive in Seshego Zone 1.',
  NULL, NULL,
  '["https://polokwane.infoisinfo.co.za/card/oasis-lodge-seshego/328483", "https://www.africanadvice.com/1228172/Lodges/Limpopo/Oasis_Lodge_Seshego/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oasis-lodge-seshego-seshego-zone-1'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
