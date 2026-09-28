INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nampak-liquid-packaging-seshego', 'Nampak Liquid Packaging',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'Freedom Drive, Seshego, Polokwane, 0699', '015 223 7059', 'https://www.nampak.com', NULL,
  'Nampak Liquid Packaging is a packaging manufacturing and container sales and hire business based in the Seshego Industrial Site, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.ananzi.co.za/ads/za/limpopo/polokwane/seshego/containers-sales-hire/nampak-liquid-packaging-pty-ltd", "https://www.findmy.co.za/services/business/nampak-liquid-packaging/12613"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nampak-liquid-packaging-seshego'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
