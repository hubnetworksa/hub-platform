INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'international-school-of-cape-town-bishopscourt', 'International School of Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'bishopscourt'),
  '4 Edinburgh Close, Bishopscourt, Cape Town, 7708', '021 763 5300', 'https://www.isct.co.za/', NULL,
  'International School of Cape Town is a Cambridge-curriculum private school in Bishopscourt.',
  NULL, NULL,
  '["https://www.isct.co.za/", "https://www.isasaschoolfinder.co.za/listing/international-school-of-cape-town/", "https://www.childmag.co.za/directory/international-school-of-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'international-school-of-cape-town-bishopscourt'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bishopsgrace-bishopscourt', 'Bishopsgrace',
  (SELECT id FROM suburbs WHERE slug = 'bishopscourt'),
  '5 Hillwood Avenue, Bishopscourt, Cape Town, 7708', '021 762 2250', NULL, NULL,
  'Bishopsgrace is a boutique guest house in Bishopscourt with individually decorated rooms, a tennis court and two swimming pools, overlooking Kirstenbosch Botanical Gardens.',
  NULL, NULL,
  '["https://www.proportal.co.za/accommodation/south-africa/western-cape/cape-town/bishopsgrace-PA1502", "https://www.thinklocal.co.za/biz/bishopsgrace-boutique-accommodation-cape-town", "https://www.hotelstravel.com/Africa/ZA/Cape_Town/BishopsgraceGuestHouseBishopscourtCapeTown.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bishopsgrace-bishopscourt'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
