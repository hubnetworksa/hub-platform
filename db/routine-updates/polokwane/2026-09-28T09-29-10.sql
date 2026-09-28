INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mens-clinic-international-polokwane-central', 'Mens Clinic International',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'library-gardens-polokwane-central'),
  'Suite 111A, Library Gardens, Corner Grobler & Schoeman Street, Polokwane, 0699', '015 291 1213', NULL, NULL,
  'Mens Clinic International is a men''s health clinic based in Library Gardens, Polokwane Central, part of a national network offering circumcision and other men''s health procedures.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/moregloed/clinics/mens-clinic-international", "https://yellpo.com/countries/south-africa/cities/limpopo/items/mens-clinic-international-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mens-clinic-international-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
