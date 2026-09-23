INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sonnekus-boutique-hotel-bistro-st-james', 'Sonnekus Boutique Hotel & Bistro',
  (SELECT id FROM suburbs WHERE slug = 'st-james'),
  '88 Main Road, St James, Cape Town, 7945', '071 344 6047', NULL, NULL,
  'Sonnekus Boutique Hotel & Bistro is a seaside boutique hotel in St James with an on-site bistro serving all-day brunch, gourmet sandwiches and light lunches.',
  NULL, NULL,
  '["https://www.sonnekus.co.za/", "https://www.lekkeslaap.co.za/accommodation/sonnekus-boutique-hotel--bistro", "https://whatsonincapetown.com/sonnekus-by-ideas-cartel-in-st-james/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sonnekus-boutique-hotel-bistro-st-james'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
