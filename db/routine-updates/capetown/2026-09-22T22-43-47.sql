INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dawood-butchery-hanover-park', 'Dawood Butchery',
  (SELECT id FROM suburbs WHERE slug = 'hanover-park'),
  '133 Hanover Park Avenue, Hanover Park, Cape Town, 7780', '021 692 1385', 'https://dawoodbutchery.co.za/', 'kaharimeat@telkomsa.net',
  'Dawood Butchery is a halaal butchery that has served the Hanover Park community for more than 50 years, specialising in beef, lamb and boerewors along with spices and braai accessories.',
  NULL, NULL,
  '["https://dawoodbutchery.co.za/about/", "https://za.africabz.com/western-cape/dawood-muslim-butchery-116887"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dawood-butchery-hanover-park'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-hanover-park', 'Shoprite Hanover Park',
  (SELECT id FROM suburbs WHERE slug = 'hanover-park'),
  'Shoprite Centre, Stonelands Road, Hanover Park, Cape Town, 7780', '021 690 1480', NULL, NULL,
  'Shoprite Hanover Park is a branch of the Shoprite supermarket chain, in Hanover Park.',
  NULL, NULL,
  '["https://www.shopshours.co.za/shoprite/cape-town/c-57f3cabc47d677c3b27e3eb8", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Hanover_Park/4782"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-hanover-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
