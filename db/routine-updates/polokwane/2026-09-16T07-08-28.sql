INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'turf-lodge-mankweng', 'Turf Lodge',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'Corner University Road & Houtbosdorp Road, Mankweng-E, Polokwane, 0727', '076 146 2202', NULL, 'turflodge@hotmail.com',
  'Turf Lodge is a guesthouse in Mankweng offering affordable accommodation right next to the University of Limpopo.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Hotel_Review-g12880261-d21336885-Reviews-Turf_Lodge-Mankweng_Limpopo_Province.html", "https://www.facebook.com/turflodgeplk/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'turf-lodge-mankweng'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
