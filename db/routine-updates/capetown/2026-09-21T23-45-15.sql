INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-village-square-plumstead', 'The Village Square',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'Main Road, Plumstead, Cape Town', NULL, NULL,
  '["https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/plumstead/the-village-square-plumstead-cape-town-3971", "https://m.facebook.com/profile.php?id=648576651823708"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-3arts-village-plumstead', 'vida e caffè 3Arts Village',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop S08-GF, 3 Arts Village, 260 Main Road, Plumstead, Cape Town', '021 879 1766', 'https://www.vidaecaffe.com', NULL,
  'vida e caffè is a coffee shop in 3Arts Village, Plumstead, part of the South African coffee chain.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/vida-e-caff%C3%A8-arts-village-halaal", "https://za.africabz.com/western-cape/vida-e-caffe-3arts-village-468701"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-3arts-village-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-3arts-village-plumstead', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop FF-S07, 3 Arts Village, 260 Main Road, Plumstead, Cape Town', '087 138 5184', 'https://www.crazystore.co.za', NULL,
  'The Crazy Store is a discount variety and gift store in 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://www.biznizdirectory.co.za/crazy-store-3art-village-gift-store-retailers-retail-trade-in-plumstead-cape-town-western-cape-72341.html", "https://www.tiendeo.co.za/stores/cape-town/crazy-store-main-rd-plumstead-cape-town-south-africa/73331"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-3arts-village-plumstead'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-home-3-arts-plumstead', 'Mr Price Home 3 Arts Plumstead',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  '260 Main Road, 3Arts Village, Plumstead, Cape Town', '080 021 2535', 'https://www.mrphome.com', NULL,
  'Mr Price Home is a homeware and decor retailer in 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://www.mrphome.com/en_za/store/mr-price-home-3-arts-plumstead", "https://www.africabizinfo.com/ZA/mr-price-home-arts-plumstead-080-021-2535"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-home-3-arts-plumstead'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-3arts-village-plumstead', 'Pick n Pay 3Arts Village',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  '260 Main Road, 3Arts Village, Plumstead, Cape Town', '021 980 5309', NULL, NULL,
  'Pick n Pay is a supermarket and anchor tenant of 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pick-n-pay-3arts-village-555613", "https://bitcoinwide.com/pick-n-pay-3arts-village-080b16c0-562c-4ce7-b5eb-5fa6c0eb66df"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-3arts-village-plumstead'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'burger-king-3arts-drive-thru-plumstead', 'Burger King 3Arts Drive-Thru',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  '260 Main Road, 3Arts Village, Plumstead, Cape Town, 7801', '021 541 0588', NULL, NULL,
  'Burger King 3Arts Drive-Thru is a fast-food drive-thru restaurant in 3Arts Village, Plumstead, prepared to Halaal guidelines.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g6776488-d10516538-Reviews-Burger_King_3Arts_Drive_Thru-Plumstead_Western_Cape.html", "https://halalbites.co.za/restaurant/burger-king-3arts-drive-thru-halaal"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'burger-king-3arts-drive-thru-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'plan-b-copy-plumstead', 'Plan B Copy',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '173 Main Road, Plumstead, Cape Town, 7800', '021 761 4112', 'https://planbcopy.co.za', NULL,
  'Plan B Copy is a large-format copy, digital printing and design business in Plumstead, established in 2014.',
  NULL, NULL,
  '["https://planbcopy.co.za/contact-us/", "https://za.africabz.com/western-cape/plan-b-copy-digital-printing-479912"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plan-b-copy-plumstead'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'malie-nail-and-beauty-salon-plumstead', 'Malie Nail and Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'Shop 3, 142-144 Main Road, Plumstead, Cape Town', '081 714 3947', NULL, 'malienbsalon@gmail.com',
  'Malie Nail and Beauty Salon is a nail and beauty salon on Main Road in Plumstead.',
  NULL, NULL,
  '["https://www.facebook.com/p/Malie-Nail-and-Beauty-Salon-100063453438741/", "https://www.bestdirectory.co.za/malie-nail-and-beauty-salon-salon-salons-and-spas-beauty-healthcare-health-beauty-in-plumstead-western-cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'malie-nail-and-beauty-salon-plumstead'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
