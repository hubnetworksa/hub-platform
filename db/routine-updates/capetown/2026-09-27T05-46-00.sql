-- Jobs 1-2: Fresnaye suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ashby-manor-guest-house-fresnaye', 'Ashby Manor Guest House',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '242 High Level Road, Fresnaye, Cape Town, 8005', '+27 21 434 1323', NULL, NULL,
  'Ashby Manor Guest House is a 16-room Victorian-era guesthouse in Fresnaye, Cape Town.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Hotel_Review-g1233430-d7702718-Reviews-Ashby_Manor_Guest_House-Fresnaye_Western_Cape.html", "https://southafricafirm.com/western-cape/ashby-manor-guest-house-3781"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ashby-manor-guest-house-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ginger-lime-food-studio-fresnaye', 'Ginger & Lime Food Studio',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '2b Disandt Avenue, Fresnaye, Cape Town, 8005', '+27 83 251 6282', NULL, NULL,
  'Ginger & Lime Food Studio is a cooking-class and events venue in Fresnaye offering hands-on food experiences and private bookings.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Fresnaye/Fresnaye/Other/Ginger-And-Lime-Food-Studio/store/2893b41", "https://gingerandlime.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ginger-lime-food-studio-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
