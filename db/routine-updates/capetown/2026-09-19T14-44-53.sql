-- Jobs 1-2: welgemoed suburb research
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'welgemoed-forum-welgemoed', 'Welgemoed Forum',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  'Corner Jip De Jager Drive & Kommissaris Street, Welgemoed, Cape Town, 7530',
  NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/welgemoed-forum-shopping-centre.html", "https://dorpstraat.net/project/welgemoed-forum/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-welgemoed', 'Clicks Pharmacy Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 10, Welgemoed Forum, Corner Jip De Jager & Kommissaris Streets, Welgemoed, Cape Town, 7530', '021 913 2107', NULL, NULL,
  'Clicks Pharmacy Welgemoed is a branch of the Clicks pharmacy and health chain, in the Welgemoed Forum shopping centre.',
  NULL, NULL,
  '["https://clicks.co.za/store/Welgemoed/1649", "https://www.tiendeo.co.za/stores/cape-town/clicks-welgemoed-forum-corner-jip-de-jager-and-kommesaris-streets/28160"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-welgemoed', 'Vida e Caffe Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Corner Jip De Jager Drive & Kommissaris Street, Welgemoed Forum, Welgemoed, Cape Town, 7530', '021 913 0083', NULL, NULL,
  'Vida e Caffe Welgemoed is a branch of the Vida e Caffe espresso bar chain, in the Welgemoed Forum shopping centre.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312675-d17529143-Reviews-Vida_e_caffe-Welgemoed_Western_Cape.html", "https://www.facebook.com/VidaWelgemoed/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-welgemoed', 'Kauai Welgemoed Forum',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 11, Welgemoed Forum, Kommissaris Street, Welgemoed, Cape Town, 7530', '087 759 6965', NULL, NULL,
  'Kauai Welgemoed Forum is a branch of the Kauai healthy food and smoothie chain, in the Welgemoed Forum shopping centre.',
  NULL, NULL,
  '["https://locations.kauai.co.za/HealthyFood-CapeTown-KAUAIWelgemoedForum", "https://www.sluurpy.co.za/cape-town/restaurant/10852820/kauai-welgemoed-forum"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jason-sushi-restaurant-welgemoed', 'Jason Sushi & Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  'Shop 10F, Welgemoed Plaza, 23 Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 0188', 'https://www.jasonsushi.co.za', NULL,
  'Jason Sushi & Restaurant is a sushi and Chinese restaurant in Welgemoed Plaza on Kommissaris Street.',
  NULL, NULL,
  '["https://www.jasonsushi.co.za/", "https://www.yep.co.za/biz/store/jason-sushi-restaurant/522607"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jason-sushi-restaurant-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
