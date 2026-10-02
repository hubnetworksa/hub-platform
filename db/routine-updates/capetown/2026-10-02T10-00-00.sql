INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ramasibi-guest-services-panorama', 'Ramasibi Guest Services',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '83 Uys Krige Drive, Panorama, Cape Town, 7500', '021 939 0476', 'https://ramasibi.co.za', 'info@ramasibi.co.za',
  'Ramasibi Guest Services is a bed and breakfast with 14 guest rooms, in Panorama.',
  NULL, NULL,
  '["https://ramasibi.co.za/contact/", "https://www.capetown.travel/listing/ramasibi/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ramasibi-guest-services-panorama'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
