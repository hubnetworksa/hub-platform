INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bomat-security-service-penina-park', 'Bomat Security Service',
  (SELECT id FROM suburbs WHERE slug = 'penina-park'),
  '40 Limpopo Ave, Penina Park, Polokwane, 0699', '015 291 5245', NULL, 'bomatsecurity@mweb.co.za',
  'Bomat Security Service is a security services provider in Penina Park, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/penina-park/security-services/bomat-security-service", "https://www.yellosa.co.za/company/248887/bomat-security-service", "https://www.thinklocal.co.za/biz/bomat-security-services-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bomat-security-service-penina-park'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morwa-motsho-consulting-engineering-penina-park', 'Morwa-Motsho Consulting Engineering',
  (SELECT id FROM suburbs WHERE slug = 'penina-park'),
  '43 Mutale Ave, Penina Park, Polokwane, 0699', '015 295 7361', NULL, 'morwa@mweb.co.za',
  'Morwa-Motsho Consulting Engineering is a consulting engineering firm in Penina Park, Polokwane.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/7540518_2", "https://www.brabys.com/za/limpopo/polokwane/penina-park/consulting-engineers/morwa-motsho-consulting-engineering", "https://sabusinesslistings.co.za/listings/morwa-motsho-consulting-engineering/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'morwa-motsho-consulting-engineering-penina-park'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);
