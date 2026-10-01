INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woodhill-country-club-woodhill-golf-estate', 'Woodhill Country Club',
  (SELECT id FROM suburbs WHERE slug = 'woodhill-golf-estate'),
  'Garsfontein Rd, Woodhill Residential Estate, Pretoria, 0076', '012 998 0011', NULL, NULL,
  'Woodhill Country Club is an 18-hole, par-72 golf course and clubhouse in Woodhill Golf Estate, built on a former dairy farm and opened in 1999. The parkland layout plays over undulating, tree-lined fairways with a mix of kikuyu and bent grass, and the course hosted the South African PGA Championship in 2001. On-site facilities include a driving range, pro shop, teaching academy, locker rooms, and a clubhouse restaurant and bar with panoramic terraces overlooking the course.',
  NULL, NULL,
  '["https://www.sa-venues.com/golf/woodhill-golf-course.php", "https://www.africansky.com/african-travel/south-africa/golf-courses/woodhill", "https://where2golf.com/south-africa/woodhill-country-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woodhill-country-club-woodhill-golf-estate'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
