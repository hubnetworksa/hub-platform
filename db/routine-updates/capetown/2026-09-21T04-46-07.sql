INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'folk-cafe-st-james', 'Folk Cafe',
  (SELECT id FROM suburbs WHERE slug = 'st-james'),
  '54 Main Road, The Old Post Office Building, St James, Cape Town', '021 276 3656', NULL, 'reservations@folkcoffee.co.za',
  'Folk Cafe is a cafe and restaurant in the old post office building in St James, next to the St James train station, serving small plates, cocktails and Neapolitan-style wood-fired pizza.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/folk-cafe", "https://www.eatout.co.za/venue/folk-cafe-st-james/", "https://www.dineplan.com/restaurants/folk-cafe-st-james"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'folk-cafe-st-james'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'st-james-guesthouses-st-james', 'St James Guesthouses',
  (SELECT id FROM suburbs WHERE slug = 'st-james'),
  '94-108 Main Road, St James, Cape Town, 7945', '021 788 4543', 'https://www.stjamesguesthouses.com/', 'guesthouses@rovos.co.za',
  'St James Guesthouses is a guesthouse property on Main Road in St James, comprising the Manor Guesthouse and Homestead Villa.',
  NULL, NULL,
  '["https://www.hotelplanner.com/Hotels/258821/Reservations-St-James-Manor-Cape-Town-108-96-94-Main-Rd-00000", "https://www.stjamesguesthouses.com/contact/", "https://www.sa-venues.com/westerncape/guesthouses/stjames.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'st-james-guesthouses-st-james'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
