INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marakalala-transport-flora-park', 'Marakalala Transport',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  '59 Mokgapa Street, Flora Park, Polokwane, 0699', '015 296 3698', NULL, NULL,
  'Marakalala Transport is a furniture transport and removals service based in Flora Park, Polokwane.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/tours", "https://www.thinklocal.co.za/tholongwe/furniture-transport"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marakalala-transport-flora-park'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'electric-eel-contractors-cc-flora-park', 'Electric Eel Contractors CC',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  '308 Suid Street, Flora Park, Polokwane, 0699', '015 296 2908', NULL, NULL,
  'Electric Eel Contractors CC is an electrical contracting business in Flora Park, Polokwane, that also takes on plumbing work.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/flora-park/electrical-contractors/electric-eel-contractors-cc", "https://www.yellosa.co.za/company/175109/electric-eel-contractors-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'electric-eel-contractors-cc-flora-park'),
  (SELECT id FROM categories WHERE slug = 'electricians'),
  1
);
