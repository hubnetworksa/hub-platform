INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vredenhof-organic-estate-firgrove', 'Vredenhof Organic Estate',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Bredell Road, Firgrove, Cape Town, 7130', '021 855 0363', NULL, NULL,
  'Vredenhof Organic Estate is a family-run certified organic farm in Firgrove with a farm shop, organic nursery and coffee shop serving breakfast and lunch, plus a children''s play area.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/vredenhof-organic-estate-114092", "https://www.tripadvisor.com/Restaurant_Review-g469396-d4813306-Reviews-Vredenhof_Organic_Estate-Somerset_West_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vredenhof-organic-estate-firgrove'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
