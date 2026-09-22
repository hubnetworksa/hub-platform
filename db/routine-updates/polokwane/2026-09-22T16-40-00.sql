INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ivy-med-24-ivy-park', 'Ivy Med 24',
  (SELECT id FROM suburbs WHERE slug = 'ivy-park'),
  '103 Marshall Street, Ivy Park, Polokwane, 0699', '015 151 0820', NULL, NULL,
  'Ivy Med 24 is a family medical practice in Ivy Park, Polokwane.',
  NULL, NULL,
  '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/Family-Practitioner/REO/REO1_014LI.pdf", "https://www.facebook.com/IVYMED24/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ivy-med-24-ivy-park'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);
