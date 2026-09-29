-- Jobs 1-2: suburb research -- glencairn, hangberg, imizamo-yethu

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noluthando-day-care-centre-imizamo-yethu', 'Noluthando Day Care Centre',
  (SELECT id FROM suburbs WHERE slug = 'imizamo-yethu'),
  'Barry Road, Imizamo Yethu, Hout Bay, Cape Town, 7806', '021 790 1464', NULL, NULL,
  'Noluthando Day Care Centre is a childcare and early learning facility in Imizamo Yethu, Hout Bay, operating from premises provided by the Department of Public Works since 1998.',
  NULL, NULL,
  '["http://www.myafricapages.com/south_africa/105490/noluthando-day-care-project-hout-bay-western-cape", "https://noluthandodaycare.co.za/about/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noluthando-day-care-centre-imizamo-yethu'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
