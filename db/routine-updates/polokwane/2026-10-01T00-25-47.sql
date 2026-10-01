INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'japie-visser-pharmacy-moregloed', 'Japie Visser Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  '17 Grobler St, Moregloed, Polokwane, 0699', '015 295 9171', NULL, NULL,
  'Japie Visser Pharmacy is a pharmacy on Grobler Street in Moregloed, Polokwane.',
  NULL, NULL,
  '["https://polokwane.infoisinfo.co.za/search/pharmacy", "https://www.yellosa.co.za/company/425653/japie-visser-groep"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'japie-visser-pharmacy-moregloed'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
