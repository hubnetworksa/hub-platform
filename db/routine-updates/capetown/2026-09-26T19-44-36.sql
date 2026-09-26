INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'strand-square-strand', 'Strand Square',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  'Cnr Mills Street & Fagan Street, Strand, 7140', NULL, NULL,
  '["https://www.facebook.com/strandcentre/", "https://www.siyazama.co.za/projects/strand-square-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-strand', 'Pick n Pay',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Strand Square, Fagan Street, Strand, 7140', '021 853 2538', NULL, NULL,
  'Pick n Pay is a supermarket at Strand Square in Strand.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/strand/pick-n-pay", "https://strandsquarecentre.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-strand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-strand', 'Woolworths Food',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Shop 261, Strand Square, 1 Fagan Street, Strand, 7140', '021 841 1100', NULL, NULL,
  'Woolworths Food is a supermarket at Strand Square in Strand.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/woolworths-food-311573", "https://www.tiendeo.co.za/stores/strand/woolworths"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-strand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-strand-square-strand', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Shop 6, Strand Square Shopping Centre, Fagan Street, Strand, 7140', '021 854 4114', NULL, NULL,
  'Clicks is a pharmacy and health and beauty retailer at Strand Square in Strand.',
  NULL, NULL,
  '["https://clicks.co.za/store/Strand-Square/1751", "https://www.tiendeo.co.za/stores/cape-town/clicks-strand-square-shopping-centre-fagan-street/28069"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-strand-square-strand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-strand', 'Mr Price',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Strand Square, Fagan Street, Strand, 7140', '021 854 4360', NULL, NULL,
  'Mr Price is a clothing and fashion retailer at Strand Square in Strand.',
  NULL, NULL,
  '["https://www.mrp.com/en_za/store/mr-price-strand", "https://www.ivote.co.za/view/south-africa/mr-price-strand-in-strand"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-strand'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-strand-square-strand', 'Wimpy',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Shop 1, Cnr Mills & Fagan Streets, Strand Square, Strand, 7140', '021 854 7467', NULL, NULL,
  'Wimpy is a family restaurant at Strand Square in Strand.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1236998-d17518496-Reviews-Wimpy-Strand_Western_Cape.html", "https://crave.co.za/establishment.asp?est=17923"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-strand-square-strand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-strand-square-strand', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Shop 2, Strand Square, Fagan Street, Strand, 7140', '021 492 3942', NULL, NULL,
  'The Crazy Store is a variety and discount goods retailer at Strand Square in Strand.',
  NULL, NULL,
  '["http://capetown.goveza.co.za/directory/the-crazy-store-strand-square/", "https://www.facebook.com/strandcentre/posts/we-heard-a-rumour-that-the-crazy-store-has-got-some-crazy-specials-running-this-/1149029245950843/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-strand-square-strand'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-strand-square-strand', 'PNA',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-square-strand'),
  'Shop 6 & 7, Strand Square, Fagan Street, Strand, 7140', '021 854 8108', NULL, NULL,
  'PNA is a stationery, books and arts and crafts retailer at Strand Square in Strand.',
  NULL, NULL,
  '["https://pna.co.za/store-locator/pna-strand/", "https://za.africabz.com/western-cape/pna-strand-133707"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-strand-square-strand'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);
