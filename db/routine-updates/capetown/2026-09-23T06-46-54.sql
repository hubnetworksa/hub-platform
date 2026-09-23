-- Job 1/2: mandela-park suburb research, 2 new businesses (1 linked to existing Khaya Corner)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-spade-boutique-hotel-mandela-park', 'The Spade Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  '8 Alfred Nzo Street, Mandela Park, Khayelitsha, Cape Town, 7784', '087 061 1999', 'https://thespadeboutiquehotel.co.za/', NULL,
  'The Spade Boutique Hotel is a boutique hotel and spa on Alfred Nzo Street, in Mandela Park, Khayelitsha.',
  NULL, NULL,
  '["https://thespadeboutiquehotel.co.za/contact-us/", "https://www.tripadvisor.com/Hotel_Review-g2427234-d23829371-Reviews-The_Spade_Boutique_Hotel_And_Spa-Khayelitsha_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-spade-boutique-hotel-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-courier-guy-mandela-park', 'The Courier Guy',
  (SELECT id FROM suburbs WHERE slug = 'mandela-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'khaya-corner-mandela-park'),
  'Khaya Corner, Cnr Govan Mbeki & Oscar Mpetha Roads, Mandela Park, Khayelitsha, Cape Town, 7784', '021 367 0100', NULL, NULL,
  'The Courier Guy is a parcel courier and drop-off kiosk in Khaya Corner, Mandela Park.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/the-courier-guy-khayelitsha-021-367-0100", "https://heycompanies.co.za/02330555/The_Courier_Guy_Kiosk_Khayelitsha"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-courier-guy-mandela-park'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
