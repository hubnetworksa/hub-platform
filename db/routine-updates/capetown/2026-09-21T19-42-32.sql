INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'codfather-seafood-and-sushi-camps-bay', 'Codfather Seafood & Sushi',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '37 The Drive, Camps Bay, Cape Town', '021 438 0782', 'https://www.codfather.co.za', 'codfather@mweb.co.za',
  'Codfather Seafood & Sushi is a seafood and sushi restaurant in Camps Bay, a block off Victoria Road.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312658-d1064762-Reviews-Codfather_Seafood_Sushi-Camps_Bay_Western_Cape.html", "https://www.codfather.co.za/contact-us-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'codfather-seafood-and-sushi-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-the-promenade-camps-bay', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 202, The Promenade, 87 Victoria Road, Camps Bay, Cape Town', '021 438 3444', NULL, NULL,
  'Woolworths is a food and grocery store in The Promenade shopping centre, Camps Bay.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/woolworths/87-victoria-road-camps-bay-shop-202-camps-bay-promenade", "https://www.tiendeo.co.za/stores/cape-town/woolworths-victoria-road-camps-bayshop-camps-bay/54234"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-the-promenade-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
