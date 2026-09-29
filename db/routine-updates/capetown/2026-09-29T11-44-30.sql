INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jamaica-me-crazy-woodstock', 'Jamaica Me Crazy',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '74 Roodebloem Road, Woodstock, Cape Town', '021 448 0691', 'https://www.jamaicamecrazy.co.za', NULL,
  'Jamaica Me Crazy is a long-running Caribbean-inspired rooftop restaurant on Roodebloem Road, in Woodstock.',
  NULL, NULL,
  '["https://www.jamaicamecrazy.co.za/", "https://www.thinklocal.co.za/biz/jamaica-me-crazy-woodstock", "https://www.tripadvisor.com/Restaurant_Review-g6776544-d2629691-Reviews-Jamaica_Me_Crazy-Woodstock_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jamaica-me-crazy-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salisburys-woodstock', 'Salisburys',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '79 Roodebloem Road, Woodstock, Cape Town, 7925', '021 838 2595', 'https://www.salisburys.co.za', NULL,
  'Salisburys is a deli and wine shop on Roodebloem Road offering breakfast and lunch, fresh cold cuts and takeaway prepared dishes, in Woodstock.',
  NULL, NULL,
  '["https://www.salisburys.co.za/", "https://www.eatout.co.za/venue/salisburys-deli-wineshop/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d4570154-Reviews-Salisburys_Deli_and_Wineshop-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salisburys-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
