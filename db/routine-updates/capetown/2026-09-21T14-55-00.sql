INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alta-bay-higgovale', 'Alta Bay',
  (SELECT id FROM suburbs WHERE slug = 'higgovale'),
  '12 Invermark Crescent, Higgovale, Cape Town', '021 487 8800', NULL, NULL,
  'Alta Bay is a 4-star self-catering guest house in Higgovale, a former 5-star boutique hotel converted into three luxury units set high on the slopes of Table Mountain.',
  NULL, NULL,
  '["https://www.hotelplanner.com/Hotels/303632/Reservations-Alta-Bay-Cape-Town-Invermark-Crescent-12-Higgovale-Cape-Town-8001", "https://www.tripadvisor.com/Hotel_Review-g312659-d604106-Reviews-Alta_Bay-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alta-bay-higgovale'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-paradise-lodge-and-apartments-higgovale', 'Cape Paradise Lodge and Apartments',
  (SELECT id FROM suburbs WHERE slug = 'higgovale'),
  '48 Leeuwenhof Road, Higgovale, Cape Town', '021 201 8901', 'https://www.capeparadise.co.za/', NULL,
  'Cape Paradise Lodge and Apartments is a bed and breakfast lodge in Higgovale offering both B&B rooms and self-catering luxury apartments.',
  NULL, NULL,
  '["https://www.capeparadise.co.za/", "https://www.booking.com/hotel/za/cape-paradise-lodge-and-luxury-apartments.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-paradise-lodge-and-apartments-higgovale'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
