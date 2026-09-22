INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'christian-achievers-academy-private-school-ivy-park', 'Christian Achievers Academy Private School',
  (SELECT id FROM suburbs WHERE slug = 'ivy-park'),
  '1 Nelson Mandela Drive, Ivy Park, Polokwane, 0699', '015 291 2478', 'https://www.lightofthenations.co.za', NULL,
  'Christian Achievers Academy Private School is an independent school in Ivy Park offering pre-school and primary-level education.',
  NULL, NULL,
  '["https://za.ypgo.net/Christian+Achievers+Academy+Private+School-19173295802", "https://www.yellosa.co.za/company/883665/christian-achievers-academy-private-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'christian-achievers-academy-private-school-ivy-park'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masai-lodge-ivy-park', 'Masai Lodge',
  (SELECT id FROM suburbs WHERE slug = 'ivy-park'),
  '44 Langenhoven Street, Ivy Park, Polokwane, 0699', '015 292 6451', 'https://masailodgesa.co.za', NULL,
  'Masai Lodge is a guest lodge offering overnight accommodation in Ivy Park.',
  NULL, NULL,
  '["https://masailodgesa.co.za/contact-us/", "https://www.yellosa.co.za/company/151575/masai-lodge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masai-lodge-ivy-park'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
