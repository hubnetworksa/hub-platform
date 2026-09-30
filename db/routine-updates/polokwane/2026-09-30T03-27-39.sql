INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limcoat-sandblasting-and-powder-coating-futura', 'LIMCOAT Sandblasting and Powder Coating',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '31 Chroom Street, Futura, Polokwane, 0699', '015 293 0957', NULL, NULL,
  'LIMCOAT Sandblasting and Powder Coating is an industrial sandblasting and powder-coating workshop in Futura, offering on-site sandblasting for larger projects across Limpopo.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/677581/limcoat-sandblasting-and-powder-coating", "https://www.fyple.co.za/company/limcoat-sandblasting-and-powder-coating-zpes56/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'limcoat-sandblasting-and-powder-coating-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
