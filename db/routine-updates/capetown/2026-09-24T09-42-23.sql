INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'petries-pharmacy-sea-point', 'Petrie''s Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '13 Regent Road, Sea Point, Cape Town', '021 434 1858', NULL, NULL,
  'Petrie''s Pharmacy is a community pharmacy on Regent Road, in Sea Point.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/39538_2", "https://www.thinklocal.co.za/biz/petries-pharmacy-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'petries-pharmacy-sea-point'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'make-sea-point', 'MAKE',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '204 Main Road, Sea Point, Cape Town', '021 434 8899', NULL, NULL,
  'MAKE is an Asian restaurant on Main Road in Sea Point, serving a menu of sushi, dim sum and other Asian-inspired dishes.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d2468248-Reviews-or30-Make_Restaurant-Cape_Town_Central_Western_Cape.html", "https://www.findglocal.com/ZA/Cape-Town/134495703311920/MAKE-restaurant-Sea-Point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'make-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crumbs-and-cream-sea-point', 'Crumbs & Cream',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '16 Regent Road, Sea Point, Cape Town', '083 659 4439', 'https://www.crumbsandcream.co.za', NULL,
  'Crumbs & Cream is a vintage-style ice cream and dessert parlour on Regent Road in Sea Point, known for gelato, crepes and customisable ice cream sandwiches.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/crumbs-cream-sea-point/", "https://www.eatout.co.za/venue/crumbs-cream/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crumbs-and-cream-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
