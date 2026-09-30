INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'z-n-hardware-manenberg', 'Z & N Hardware',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 6A, Nyanga Junction Shopping Centre, Duinefontein Road, Manenberg, Cape Town, 7764', '021 692 4400', NULL, NULL,
  'Z & N Hardware is a hardware store in Nyanga Junction Shopping Centre, Manenberg.',
  NULL, NULL,
  '["https://www.africanadvice.com/1231263/Hardware/Western_Cape/Z_And_N_Hardware/", "https://south-africa.worldplaces.me/view-place/62555392-z-and-n-hardware.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'z-n-hardware-manenberg'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
