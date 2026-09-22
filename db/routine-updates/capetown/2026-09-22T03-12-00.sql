-- Jobs 1-2: Diep River suburb sweep (1 new business)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'quince-diep-river', 'Quince',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  'Little Orchard Nursery, Massinger Road, Diep River, Cape Town', '021 569 0179', NULL, 'info@quince.co.za',
  'Quince is a deli and eatery set inside Little Orchard Nursery in Diep River, with a shaded patio overlooking the nursery.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/quince-restaurant-deli", "https://www.capetownwithkids.com/quince-restaurant-deli-diep-river/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'quince-diep-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
