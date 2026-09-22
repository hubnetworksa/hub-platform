INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'adendorff-machinery-mart-nirvana', 'Adendorff Machinery Mart',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '19 Iran Street, Nirvana X1(E), Polokwane, 0700', '015 292 0243', NULL, NULL,
  'Adendorff Machinery Mart is a machinery and equipment retailer in Nirvana, stocking generators, tools, and workshop and power equipment.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/176694/adendorff-machinery-mart", "https://my-catalogue.co.za/stores/polokwane/adendorff-machinery-mart/19-iran-street-nirvana-x1-e"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'adendorff-machinery-mart-nirvana'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harun-ebrahim-attorneys-nirvana', 'Harun Ebrahim Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '287 Orient Drive, Nirvana, Polokwane, 0699', '015 292 1474', NULL, NULL,
  'Harun Ebrahim Attorneys is a law firm in Nirvana offering legal services including divorce law.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/nirvana/attorneys/harun-ebrahim-attorneys", "https://www.procompare.co.za/providers/harun-ebrahim-attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harun-ebrahim-attorneys-nirvana'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'farouk-gani-attorneys-nirvana', 'Farouk Gani Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '12 Dubai Street, Nirvana, Polokwane, 0699', '015 292 6181', NULL, NULL,
  'Farouk Gani Attorneys is a law firm in Nirvana handling conveyancing and general legal matters.',
  NULL, NULL,
  '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/nirvana/attorneys/farouk-gani-attorneys", "https://www.brabys.com/za/limpopo/polokwane/nirvana/attorneys/farouk-gani-attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'farouk-gani-attorneys-nirvana'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
