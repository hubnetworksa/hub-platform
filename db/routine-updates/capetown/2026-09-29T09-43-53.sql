INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'macassar-pottery-macassar', 'Macassar Pottery',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  '53 Fish Street, Macassar, 7130', '082 747 7104', 'https://macassarpottery.com/', NULL,
  'Macassar Pottery is a ceramic design and manufacturing studio in Macassar, established in 2010, that trains and employs local youth and sells handcrafted pottery, ceramics and musical instruments such as udu drums.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Attraction_Review-g7158557-d7052058-Reviews-Proudly_Macassar_Pottery-Macassar_Western_Cape.html", "https://macassarpottery.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'macassar-pottery-macassar'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'engen-false-bay-1-stop-macassar', 'Engen False Bay 1 Stop',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'N2 Highway, Macassar, 7130', '021 857 1050', NULL, NULL,
  'Engen False Bay 1 Stop is a 24-hour Engen filling station and travel stop on the N2 highway in Macassar, with on-site shops including Woolworths Food, Equatorial Bakery and a Wimpy restaurant.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/engen-false-bay-1-stop-7575", "https://www.fueldirectory.co.za/listing-contact.php?listings_id=5972"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'engen-false-bay-1-stop-macassar'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-false-bay-engen-1-stop-macassar', 'Wimpy False Bay Engen 1 Stop',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'N2 Highway, Macassar, 7130', '021 857 1050', 'https://locations.wimpy.co.za/restaurants-Engen1StopFalseBay-WimpyFalseBayEngen1Stop', NULL,
  'Wimpy False Bay Engen 1 Stop is a branch of the Wimpy family restaurant chain, located inside the Engen False Bay 1 Stop filling station on the N2 in Macassar.',
  NULL, NULL,
  '["https://locations.wimpy.co.za/restaurants-Engen1StopFalseBay-WimpyFalseBayEngen1Stop", "https://www.cylex.net.za/company/wimpy-17617715.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-false-bay-engen-1-stop-macassar'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-macassar', 'Woolworths Food',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'N2 Highway, Macassar, 7130', '021 857 1050', NULL, NULL,
  'This Woolworths Food outlet is located inside the Engen False Bay 1 Stop filling station on the N2 in Macassar, offering groceries and ready meals to travellers.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/woolworths-engen-false-bay-1-stop-in-cape-town", "https://za.africabz.com/western-cape/engen-false-bay-1-stop-7575"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-food-macassar'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
