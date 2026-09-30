INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-lebowakgomo-lebowakgomo', 'Nedbank Lebowakgomo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'phasha-shopping-centre-lebowakgomo'),
  'Winkel 3, Ingang 2, Cnr R518 & R579, Phasha Shopping Centre, Lebowakgomo, 0737', '015 633 9280', NULL, 'LebowakgomoBM@nedbank.co.za',
  'Nedbank Lebowakgomo is a Nedbank bank branch inside Phasha Shopping Centre, Lebowakgomo.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/lebowakgomo/nedbank-cnr-r-r/46479", "https://www.callupcontact.com/b/Banks/Nedbank_LEBOWAKGOMO/1098"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-lebowakgomo-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fnb-lebowakgomo-lebowakgomo', 'FNB Lebowakgomo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'phasha-shopping-centre-lebowakgomo'),
  'Shops 15-18, Phasha Shopping Centre, Cnr R518 & R579, Lebowakgomo, 0737', '015 633 4224', NULL, NULL,
  'FNB Lebowakgomo is an FNB bank branch inside Phasha Shopping Centre, Lebowakgomo.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/first-national-bank-fnb-in-lebowakgomo", "https://brabys.com/south-africa/lebowakgomo/verified-business/f-n-b"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fnb-lebowakgomo-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kothabeng-guesthouse-lebowakgomo', 'Ko''Thabeng Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  '1855 A, Ko''Thabeng Street, Bester, 0737, Lebowakgomo', '072 261 6161', NULL, 'info.malesolo@gmail.com',
  'Ko''Thabeng Guesthouse is a guesthouse in Bester, Lebowakgomo.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/ko-thabeng-guesthouse.html", "https://www.bedandbreakfast.eu/en/a/Nnya76H92c0f/kothabeng-guesthouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kothabeng-guesthouse-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
