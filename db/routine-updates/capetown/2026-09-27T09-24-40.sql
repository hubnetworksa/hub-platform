INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-maynard-mall-wynberg', 'KFC',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop No 13, Maynard Mall, Main Road, Wynberg, Cape Town, 7708', '021 797 6740', NULL, NULL,
  'KFC is a fried chicken and fast-food outlet in Maynard Mall, Wynberg, serving burgers, twisters and family meal deals with dine-in, delivery and pickup.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/wynberg/shop-no-13-maynard-mall-main-road-wynberg", "https://za.africabz.com/western-cape/kfc-maynard-mall-26705"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-maynard-mall-wynberg', 'Zone Fitness',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Maynard Mall, Main Road, Wynberg, Cape Town', '+27 21 762 0290', NULL, NULL,
  'Zone Fitness is a gym in Maynard Mall, Wynberg, part of a national fitness chain offering group classes and gym equipment for members.',
  NULL, NULL,
  '["https://zonefitness.co.za/wynberg/", "https://www.cylex.net.za/company/zone-fitness---wynberg-23789669.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-maynard-mall-wynberg', 'Ackermans',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 46, Maynard Mall, Main Road, Wynberg, Cape Town, 7800', '021 761 0000', NULL, NULL,
  'Ackermans is a South African value clothing retailer''s Wynberg branch in Maynard Mall, selling clothing, footwear and homeware for the whole family.',
  NULL, NULL,
  '["https://south-africa.searchinafrica.com/business/5676843/south-africa/western-cape/cape-town/wynberg/main-rd/departmental-stores/clothing-retailers/ackermans", "https://www.facebook.com/MaynardMall/posts/ackermans-we-are-openmonday-to-friday-09h00-to-15h00saturday-09h00-to-13h00sunda/3972868069419847/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sportscene-maynard-mall-wynberg', 'Sportscene',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 8, Maynard Mall, Main Road, Wynberg, Cape Town', '021 763 4832', NULL, NULL,
  'Sportscene is a sneaker and streetwear retailer''s branch in Maynard Mall, Wynberg, stocking sports footwear and branded apparel.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/sportscene/130-main-rd-wynberg", "https://www.africanadvice.com/1345608/Sportswear/Cape_Town/Sportscene/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sportscene-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beeline-clothing-maynard-mall-wynberg', 'Beeline Clothing',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 39B, Maynard Mall, Wynberg, Cape Town', '067 028 8494', NULL, NULL,
  'Beeline Clothing is a family and children''s clothing factory shop with a branch in Maynard Mall, Wynberg.',
  NULL, NULL,
  '["https://beelineclothing.co.za/maynard-mall/", "https://www.facebook.com/photo.php?fbid=777459324577784&id=100069411707230&set=a.415076387482748"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beeline-clothing-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'multiserv-maynard-mall-wynberg', 'Multiserv',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 10, Maynard Mall, Main Road, Wynberg, Cape Town, 7800', '+27 87 237 9998', NULL, NULL,
  'Multiserv is a shoe repair, key cutting and leather repair outlet in Maynard Mall, Wynberg, part of a national chain operating since 1969.',
  NULL, NULL,
  '["https://multiserv.co.za/store/maynard-mall-wynberg/", "https://www.cylex.net.za/company/multiserv-maynard-mall-wynberg-23861466.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'multiserv-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-maynard-mall-wynberg', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 2, Maynard Mall, Cnr Wetton & Main Road, Wynberg, Cape Town, 7800', '021 761 8746', NULL, NULL,
  'PEP is a value clothing and homeware retailer''s branch in Maynard Mall, Wynberg.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/777196/pep-stores-pty-ltdbrancheswynbergmaynard-mall", "https://my-catalogue.co.za/stores/cape-town/pep-stores/maynard-mall-cnr-church-street-main-road-wynberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'penny-lane-wynberg', 'Penny Lane',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '4 Penny Lane, Wynberg, Cape Town, 7800', '+27 82 314 2506', NULL, NULL,
  'Penny Lane is a breakfast and coffee cafe in Wynberg known for affordable, homestyle meals in a quaint setting.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/wynberg/coffee-shops/penny-lane-cake-and-coffee-shop", "https://za.africabz.com/western-cape/penny-lane-73445"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'penny-lane-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cosy-corner-wynberg', 'Cosy Corner',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '119 Ottery Road, Wynberg, Cape Town', '+27 21 797 2498', NULL, NULL,
  'Cosy Corner is a Cape Malay halaal eatery in Wynberg trading since 1973, known for its gatsbys and masala steak sandwiches.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cosy-corner-wynberg/", "https://www.yep.co.za/biz/store/iyp/15952704_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cosy-corner-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
