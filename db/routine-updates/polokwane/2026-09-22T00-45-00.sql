-- hospark suburb sweep: 1 new business (Plein Street address, filed polokwane-central per that block's established suburb tagging)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kay-medical-centre-polokwane-central', 'Kay Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '2nd Floor, 64 Plein Street, Polokwane, 0699', '015 291 2499', NULL, NULL,
  'Kay Medical Centre is a medical practice offering general consultations and appointments on the 2nd floor of a Plein Street building, Polokwane.',
  NULL, NULL,
  '["https://za.near-place.com/kay-medical-centre-64-plein-street-polokwane-central-polokwane", "https://dima-health.com/listing/kay-medical-centre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kay-medical-centre-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
