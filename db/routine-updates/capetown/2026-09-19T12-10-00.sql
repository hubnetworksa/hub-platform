INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-southfield', 'Shoprite Southfield',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  'Victoria Road, Southfield, Cape Town, 7800', '021 707 5300', NULL, NULL,
  'Shoprite Southfield is a branch of the Shoprite supermarket chain on Victoria Road, Southfield.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Southfield/Shoprite-Southfield/store-details/6543", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Southfield/4810"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-southfield'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southfield-primary-school-southfield', 'Southfield Primary School',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '37 Dirkie Uys Street, Southfield, Cape Town, 7800', '021 705 6156', NULL, NULL,
  'Southfield Primary School is a co-educational public primary school on Dirkie Uys Street in Southfield.',
  NULL, NULL,
  '["https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/southfield-primary-school", "https://schoolfindersa.co.za/southfield-primary-school-city-of-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southfield-primary-school-southfield'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
