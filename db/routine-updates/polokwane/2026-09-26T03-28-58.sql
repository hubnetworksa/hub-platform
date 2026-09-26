INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'smart-bnb-mankweng', 'Smart BnB',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'R71 North Mankweng Road, next to Paledi Mall, Ga-Mankoeng, Mankweng, Polokwane',
  '076 174 8888', NULL, NULL,
  'Smart BnB is a guesthouse in Turfloop, Mankweng, next to Paledi Mall and close to the University of Limpopo, offering private en-suite rooms with air-conditioning and free WiFi behind 24-hour locked gates.',
  NULL, NULL,
  '["https://www.facebook.com/SmartBnBMankweng/", "https://www.booking.com/hotel/za/smart-b-amp-b-in-turfloop-mankweng-capricorn-district-municipality.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smart-bnb-mankweng'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
