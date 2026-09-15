-- Equestria: new shopping centre "Equestria Gateway Centre" (no tenants confirmed yet)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'equestria-gateway-centre-equestria', 'Equestria Gateway Centre',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  'Simon Vermooten Rd, Equestria, Pretoria, 0184', NULL, NULL,
  '["https://pretoria.co.za/place/equestria-gateway-centre", "https://vymaps.com/ZA/Equestria-Gateway-Centre-498050/", "http://textmap.co.za/6/19446"]',
  'mall'
);
