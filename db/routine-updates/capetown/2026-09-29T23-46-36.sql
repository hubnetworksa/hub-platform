INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kirstenhof-bookshop-kirstenhof', 'Kirstenhof Bookshop',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  '254 Main Road, Kirstenhof, Cape Town, 7945', '021 712 3070', NULL, NULL,
  'Kirstenhof Bookshop is a charity bookshop on Main Road, Kirstenhof, selling second-hand books, CDs, DVDs and computer games in aid of the Help the Rural Child charity.',
  NULL, NULL,
  '["https://www.fmr.co.za/locations/help-the-rural-child-charity-bookshop/", "https://ruralchild.org.za/our-shops/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kirstenhof-bookshop-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);
