INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ntsoane-optometrist-seshego', 'Ntsoane Optometrist',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-plaza-seshego'),
  'Shop 7B, Seshego Plaza, New Era Drive, Seshego, Polokwane, 0751', '015 223 0730', NULL, NULL,
  'Ntsoane Optometrist is an eye care practice offering eye examinations and optical services, in Seshego Plaza, Seshego.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/ntsoane-optometrist/52004", "https://polokwane.infoisinfo.co.za/card/ntsoane-optometrist/319833"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ntsoane-optometrist-seshego'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tloutlou-cleaning-pest-control-seshego', 'TlouTlou Cleaning & Pest Control',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'Office 8124, Zone 6, Seshego, Polokwane, 0699', '015 023 1678', 'https://ttcp.co.za', NULL,
  'TlouTlou Cleaning & Pest Control is a black-owned company established in 2006, offering pest control, fumigation, hygiene and cleaning services, in Zone 6, Seshego.',
  NULL, NULL,
  '["https://ttcp.co.za/contact-us/", "https://www.procompare.co.za/providers/tloutlou"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tloutlou-cleaning-pest-control-seshego'),
  (SELECT id FROM categories WHERE slug = 'pest-control'),
  1
);
