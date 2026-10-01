-- Suburb checkpoint: mandalay
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mayas-hardware-mandalay', 'Maya''s Hardware',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Thembokwezi Square, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', '076 465 3519', 'https://mayashardware.co.za', NULL,
  'Maya''s Hardware is a hardware store in Thembokwezi Square in Mandalay, Khayelitsha, selling hardware materials, LPG gas and DIY tools.',
  NULL, NULL,
  '["https://www.facebook.com/mayashardwarelithapark/", "https://mayashardware.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mayas-hardware-mandalay'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
