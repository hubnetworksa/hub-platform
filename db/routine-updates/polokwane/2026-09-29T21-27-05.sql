INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ensemble-security-dalmada', 'Ensemble Security',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'Plot 13, Dalmada, Polokwane, 0699', '087 898 4911', 'https://ensemblesecurity.co.za', NULL,
  'Ensemble Security is a security services provider based in Dalmada, offering security solutions to homes and businesses across the greater Polokwane area.',
  NULL, NULL,
  '["https://ensemblesecurity.co.za/contact-us/", "https://www.zoominfo.com/c/ensemble-security/1326158376"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ensemble-security-dalmada'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dalmada-kwekery-dalmada', 'Dalmada Kwekery',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'R71, Dalmada, Polokwane, 0699', '072 673 4143', NULL, NULL,
  'Dalmada Kwekery is a plant nursery on the R71 in Dalmada, selling plants, trees and pots to the greater Polokwane area.',
  NULL, NULL,
  '["https://www.facebook.com/Polokwanekwekery/", "https://www.homeimprovement4u.co.za/directory/category/landscaping-gardens/nurseries/location/limpopo-province/capricorn/polokwane/dalmada-ah/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dalmada-kwekery-dalmada'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);
