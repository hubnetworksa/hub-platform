INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-courier-guy-thornhill-thornhill-estate', 'The Courier Guy (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Shop 5, Thornhill Shopping Centre, Cnr Munnik Ave & Veldspaat St, Thornhill, Polokwane, 0713', '015 298 8647', NULL, NULL,
  'The Courier Guy (Thornhill) is a courier and parcel-delivery service operating from Thornhill Shopping Centre, Thornhill, Polokwane.',
  NULL, NULL,
  '["http://www.vezaconnect.co.za/directory/the-courier-guy-polokwane/", "https://opening-hours.co.za/03943954/The_Courier_Guy_Polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-courier-guy-thornhill-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
