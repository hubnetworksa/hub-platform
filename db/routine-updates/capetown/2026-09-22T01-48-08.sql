-- Jobs 1-2: Constantia suburb sweep (3 new standalone businesses, 4 Constantia Village tenants)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'constantia-uitsig-constantia', 'Constantia Uitsig',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Spaanschemat River Road, Constantia, Cape Town, 7806', '021 794 6500', 'https://www.constantiauitsig.co.za', NULL,
  'Constantia Uitsig is a 17th-century wine estate in the Constantia Valley producing award-winning wines, with a hotel and spa on the property.',
  NULL, NULL,
  '["https://www.constantiauitsig.co.za", "https://capreo.com/en/wine-estates/constantia-uitsig/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'constantia-uitsig-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alphen-boutique-hotel-and-spa-constantia', 'The Alphen Boutique Hotel & Spa',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Alphen Drive, Constantia, Cape Town, 7806', '021 795 6300', 'https://www.alphen.co.za', NULL,
  'The Alphen Boutique Hotel & Spa is a boutique hotel on a historic wine-farm homestead in Constantia, offering a spa and a 24-hour front desk.',
  NULL, NULL,
  '["https://www.alphen.co.za/contact/", "https://www.sa-venues.com/visit/alphenboutiquehotel/map.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alphen-boutique-hotel-and-spa-constantia'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'high-constantia-wine-cellar-constantia', 'High Constantia Wine Cellar',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Groot Constantia Road, Constantia, Cape Town, 7806', '021 794 7171', 'https://www.highconstantia.co.za', 'info@highconstantia.co.za',
  'High Constantia Wine Cellar is a small wine cellar in the Constantia Valley offering wine tastings of its own-label wines.',
  NULL, NULL,
  '["https://highconstantia.co.za/contact-us/", "https://capeofgoodwine.com/high-constantia/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'high-constantia-wine-cellar-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-constantia-village-constantia', 'Kauai',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Shop 27A, Constantia Village, Cnr Doordrift & Spaanschemat River Rd, Constantia, Cape Town, 7806', '021 569 2529', NULL, 'constantia@kauai.co.za',
  'Kauai is a branch of the Kauai smoothie and juice bar chain in Constantia Village, serving wraps, salads, smoothies and coffee.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/kauai-constantia-village/", "https://www.facebook.com/KAUAIConstantiaVillage/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-constantia-village-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'exclusive-books-constantia-village-constantia', 'Exclusive Books',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Shop 46, Constantia Village, Spaanschemat River Rd, Constantia, Cape Town, 7800', '021 794 7800', NULL, 'constantia@exclusivebooks.co.za',
  'Exclusive Books is a branch of the Exclusive Books bookstore chain in Constantia Village.',
  NULL, NULL,
  '["https://constantiavillage.co.za/stores/exclusive-books/", "https://www.yep.co.za/biz/store/exclusive-books-pty-ltd/373839"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'exclusive-books-constantia-village-constantia'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-constantia-village-constantia', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Constantia Main Road, Constantia Village, Constantia, Cape Town, 7806', '021 799 7711', NULL, NULL,
  'Woolworths is a branch of the Woolworths supermarket and clothing chain in Constantia Village, with an in-store cafe.',
  NULL, NULL,
  '["https://constantiavillage.co.za/stores/woolworths/", "https://za.africabz.com/western-cape/woolworths-constantia-village-70881"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-constantia-village-constantia'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-constantia-village-constantia', 'Pick n Pay',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Spaanschemat River Road, Constantia Village, Constantia, Cape Town, 7806', '021 794 5031', NULL, NULL,
  'Pick n Pay is a branch of the Pick n Pay supermarket chain in Constantia Village.',
  NULL, NULL,
  '["https://constantiavillage.co.za/stores/pick-n-pay/", "https://za.africabz.com/western-cape/pick-n-pay-constantia-29632"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-constantia-village-constantia'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
