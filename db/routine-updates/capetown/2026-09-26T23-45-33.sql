-- Jobs 1-2: Woodstock suburb research -- new shopping centre (Woodstock Quarter) + tenants + general suburb find

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'woodstock-quarter-woodstock', 'Woodstock Quarter',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '187 Sir Lowry Road, Woodstock, Cape Town', NULL, NULL,
  '["https://woodstockquarter.co.za/contact", "https://swish.co.za/developments/view/woodstock-quarter-", "https://www.hotfrog.co.za/company/5b2a03ef2d7933ba84f77c6c724b78f3/spar-woodstock-quarter/cape-town/markets-food-stores"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'unframed-ice-cream-woodstock', 'Unframed Ice Cream',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'woodstock-quarter-woodstock'),
  'Woodstock Quarter, 187 Sir Lowry Road, Woodstock, Cape Town', '063 601 0287', NULL, NULL,
  'Unframed Ice Cream is an artisan ice cream shop in Woodstock Quarter, making vegan, dairy and sorbet ice cream.',
  NULL, NULL,
  '["https://www.woodstockquarter.co.za/tenant-directory/eateries/unframed-ice-cream", "https://za.africabz.com/western-cape/unframed-ice-cream-286095", "https://www.eatout.co.za/venue/unframed-ice-cream-woodstock/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'unframed-ice-cream-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-grange-interiors-woodstock', 'La Grange Interiors',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'woodstock-quarter-woodstock'),
  'Woodstock Quarter, 187 Sir Lowry Road, Woodstock, Cape Town', '021 447 3508', NULL, NULL,
  'La Grange Interiors is a luxury furniture and interior design showroom in Woodstock Quarter.',
  NULL, NULL,
  '["https://lagrangeinteriors.co.za/contact-us/", "https://swish.co.za/news/la-grange-interiors-have-opened-their-beautiful-new-store-at-woodstock-quarter", "https://www.cape-town-info.co.za/region/business/33304/la-grange-interiors-luxury-furniture-and-interior-design"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-grange-interiors-woodstock'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-woodstock-quarter-woodstock', 'SPAR Woodstock Quarter',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'woodstock-quarter-woodstock'),
  'Woodstock Quarter, 187 Sir Lowry Road, Woodstock, Cape Town', '021 206 0835', NULL, NULL,
  'SPAR Woodstock Quarter is a supermarket inside the Woodstock Quarter development.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/5b2a03ef2d7933ba84f77c6c724b78f3/spar-woodstock-quarter/cape-town/markets-food-stores", "https://woodstockquarter.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-woodstock-quarter-woodstock'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-woodstock-quarter-woodstock', 'Bootlegger Woodstock Quarter',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'woodstock-quarter-woodstock'),
  'Woodstock Quarter, 193 Sir Lowry Road, Woodstock, Cape Town', '021 205 3644', NULL, NULL,
  'Bootlegger Woodstock Quarter is a coffee shop and cafe branch of the Bootlegger Coffee Company chain, inside Woodstock Quarter.',
  NULL, NULL,
  '["https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerWoodstockQuarter", "https://www.woodstockquarter.co.za/tenant-directory/eateries/bootlegger", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d19993593-Reviews-Bootlegger_Coffee_Company-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-woodstock-quarter-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superette-woodstock', 'Superette',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '66 Albert Road, Woodstock, Cape Town', '021 802 5525', NULL, NULL,
  'Superette is a neighbourhood cafe and coffee shop on Albert Road in Woodstock, known for its breakfasts.',
  NULL, NULL,
  '["https://foursquare.com/v/superette/4c1b9f0b624b9c74b4a41204", "https://www.eatout.co.za/venue/superette/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d1596127-Reviews-Superette-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superette-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
