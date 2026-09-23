-- Suburb: Westridge (Mitchells Plain) -- job 1/2 research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westridge-hardware-westridge', 'Westridge Hardware',
  (SELECT id FROM suburbs WHERE slug = 'westridge'),
  'Westridge Centre, Simonsig Road, Westridge, Mitchells Plain, Cape Town, 7798', '021 391 5477', NULL, NULL,
  'Westridge Hardware is a hardware store in Westridge, Mitchells Plain.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/westridge-hardware-mitchells-plain", "https://www.yep.co.za/biz/store/westridge-hardware/467897"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westridge-hardware-westridge'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
