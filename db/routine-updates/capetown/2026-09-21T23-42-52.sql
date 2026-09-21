INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tokai-village-centre-tokai', 'Tokai Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Vans Road, Tokai, Cape Town', NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/tokai-village-centre?to=place.ChIJX30-RYpBzB0RfWQwoRZxVA0", "https://www.openhours-southafrica.com/en/cape-town/tokai-village-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'silver-spoon-indian-restaurant-tokai', 'Silver Spoon Indian Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'tokai-village-centre-tokai'),
  'Block A, Suite 101, 4 Vans Road, Tokai Village Centre, Tokai, Cape Town', '078 835 3351', NULL, NULL,
  'Silver Spoon Indian Restaurant is a North Indian restaurant serving vegetarian and non-vegetarian dishes, in Tokai Village Centre, Tokai.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1770549-d23345530-Reviews-Silver_Spoon_Indian_Cuisine-Tokai_Western_Cape.html", "https://www.facebook.com/silverspoontokai/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'silver-spoon-indian-restaurant-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jakes-tokai', 'Jakes',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'A5, Steenberg Village Centre, Steenberg Road, Tokai, Cape Town', '021 701 3272', 'https://jakes.co.za', 'tokai@jakes.co.za',
  'Jakes is a restaurant serving global, social food, in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.jakes.co.za/contact/", "https://www.tripadvisor.com/Restaurant_Review-g1770549-d967411-Reviews-Jakes_in_the_Village-Tokai_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jakes-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sportsmans-warehouse-tokai', 'Sportsmans Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'tokai-on-main-tokai'),
  'Tokai-on-Main Centre, Main Road, Tokai, Cape Town', '021 713 0180', 'https://www.sportsmanswarehouse.co.za', NULL,
  'Sportsmans Warehouse is a sporting goods and outdoor equipment retailer, in Tokai-on-Main, Tokai.',
  NULL, NULL,
  '["https://www.sportsmanswarehouse.co.za/store/tokai-on-main-cape-town/", "https://www.cylex.net.za/company/sportsmans-warehouse-branches-tokai-3-tokai-on-main-main-rd-19634563.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sportsmans-warehouse-tokai'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-tokai-on-main-tokai', 'PostNet Tokai-on-Main',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'tokai-on-main-tokai'),
  'Shop 7, Tokai-on-Main, Main Road, Tokai, Cape Town', '021 715 5681', 'https://www.postnet.co.za', NULL,
  'PostNet Tokai-on-Main is a courier, postal and printing services outlet, in Tokai-on-Main, Tokai.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/tokai", "https://za.readymap.info/4/11476"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-tokai-on-main-tokai'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'super-plants-garden-centre-tokai', 'Super Plants Garden Centre',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'tokai-on-main-tokai'),
  '1 Tokai-on-Main, Main Road, Tokai, Cape Town', '021 715 4666', 'https://www.superplants.co', 'tokai@superplants.co',
  'Super Plants Garden Centre is a family-owned garden centre and plant nursery, in Tokai-on-Main, Tokai, trading since 1999.',
  NULL, NULL,
  '["https://www.lifeisagarden.co.za/super-plants-tokai/", "https://www.thinklocal.co.za/biz/super-plants-garden-centre-tokai-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'super-plants-garden-centre-tokai'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);
