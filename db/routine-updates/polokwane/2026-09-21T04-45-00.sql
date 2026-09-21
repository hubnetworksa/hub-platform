INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '3-1-thornhill-thornhill-estate', '3@1 Thornhill',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Thornhill Shopping Centre, Cnr Veldspaat St & Munnik Ave, Thornhill, Polokwane, 0699', '015 296 0620', NULL, NULL,
  '3@1 Thornhill is a business centre offering copy, print, scan, fax, laminating, binding and courier services in Thornhill Shopping Centre.',
  NULL, NULL,
  '["https://3at1companyregistration.co.za/locate-a-store/", "https://www.facebook.com/3at1thornhill/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '3-1-thornhill-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bmw-polokwane-thornhill-estate', 'BMW Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  'Corner Clivicola & Buffalo Thorn Street, Baobab Gardens, Polokwane, 0699', '015 299 8500', NULL, 'info@bmw-polokwane.co.za',
  'BMW Polokwane is a BMW new and used vehicle dealership at Baobab Gardens, Thornhill, offering sales and a dedicated service department.',
  NULL, NULL,
  '["https://www.bmw.co.za/en/retailers-pages/bmw_polokwane.html", "https://www.facebook.com/BMWPolokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bmw-polokwane-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
