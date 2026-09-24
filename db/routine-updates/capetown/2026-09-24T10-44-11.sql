INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pro-spa-bantry-bay', 'Pro Spa',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '52 De Wet Road, Bantry Bay, Cape Town', '078 99 11 246', 'https://pro-spa.co.za', NULL,
  'Pro Spa is a spa offering treatments at the 52 De Wet Boutique Hotel in Bantry Bay.',
  NULL, NULL,
  '["https://pro-spa.co.za/page3.html", "https://www.tripadvisor.com/Attraction_Review-g312654-d22851035-Reviews-Pro_Spa-Bantry_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pro-spa-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
