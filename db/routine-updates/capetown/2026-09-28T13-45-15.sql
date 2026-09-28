INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-khaya-corner-mandela-park', 'KFC Khaya Corner',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'khaya-corner-mandela-park'),
  'Khaya Corner, Cnr Govan Mbeki & Oscar Mpetha Roads, Mandela Park, Khayelitsha, Cape Town, 7784', '021 002 8003', NULL, NULL,
  'KFC Khaya Corner is a branch of the fried chicken and fast food chain, inside the Khaya Corner shopping centre in Mandela Park.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427234-d31918915-Reviews-Kfc_Khaya_Corner-Khayelitsha_Western_Cape.html", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/kfc-khaya-corner-dadf0b"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-khaya-corner-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
