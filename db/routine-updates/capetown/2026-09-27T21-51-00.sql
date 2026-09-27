INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'khoisan-gourmet-ysterplaat', 'Khoisan Gourmet',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  '6 Gold Street, Northgate Estate, Ysterplaat, Cape Town, 7405', '021 511 4991', NULL, NULL,
  'Khoisan Gourmet is a rooibos and herbal tea manufacturer and exporter, trading as Khoisan Tea, in Ysterplaat.',
  NULL, NULL,
  '["http://www.khoisantea.com/contact-us/", "https://www.libstar.co.za/the-libstar-family/khoisan-gourmet/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'khoisan-gourmet-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bathroom-bizarre-northgate-ysterplaat', 'Bathroom Bizarre Northgate',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  'Cnr Platinum & Gold Street, Northgate Estate, Ysterplaat, Cape Town, 7405', '021 506 1660', NULL, NULL,
  'Bathroom Bizarre Northgate is a bathroom fittings and sanitaryware showroom at Northgate Estate, in Ysterplaat.',
  NULL, NULL,
  '["https://www.geberit.co.za/find-dealer/showrooms/Bathroom-Bizarre-Northgate-Ysterplaat/", "https://northgateestate.co.za/bathroom-bizarre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bathroom-bizarre-northgate-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
