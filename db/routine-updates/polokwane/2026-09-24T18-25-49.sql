INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-tractors-futura', 'Polokwane Tractors (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '33 Corundum St, Futura, Polokwane, 0699', '015 293 2664', 'http://www.polokwanetractors.co.za/', NULL,
  'Polokwane Tractors is a Massey Ferguson and Challenger tractor and farm machinery dealership in Futura, Polokwane.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/16693293_3", "https://anyflip.com/hjwp/gygh/basic/51-100"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'polokwane-tractors-futura'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);
