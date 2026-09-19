INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bergvliet-village-centre-bergvliet', 'Bergvliet Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '16 Hiddingh Road, Bergvliet, Cape Town', NULL, NULL,
  '["https://www.vermaakproperties.co.za/news/bergvliet-village-centre-16-hiddingh-road-bergvliet-city-of-cape-town/", "https://www.cylex.net.za/company/sanlic-23744147.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kirstenhof-shopping-centre-kirstenhof', 'Kirstenhof Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  'Main Road, Kirstenhof, Cape Town', NULL, NULL,
  '["https://www.quaggapropertybrokers.co.za/news/quagga-property-brokers-sells-kirstenhof-shopping-centre-complex/", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/kirstenhof/kirstenhof-centre-16967/shop-no-3-47883"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-checkers-meadowridge-meadowridge', 'KAUAI Checkers Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Meadowridge Shopping Centre, Cnr Firgrove Way & Howard Drive, Meadowridge, Cape Town, 7806', '010 109 7104', NULL, NULL,
  'KAUAI is a healthy food and juice bar inside Meadowridge Shopping Centre, offering wraps, salads, smoothies and organic coffee, in Meadowridge.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d33875737-Reviews-KAUAI_Checkers_Meadowridge-Cape_Town_Western_Cape.html", "https://locations.kauai.co.za/FoodDrink-CheckersMeadowridge-KAUAICheckersMeadowridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-checkers-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'meadowridge-pharmacy-meadowridge', 'Meadowridge Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Meadowridge Shopping Centre, Cnr Firgrove Way & Howard Drive, Meadowridge, Cape Town, 7806', '021 712 2921', NULL, NULL,
  'Meadowridge Pharmacy is a retail pharmacy inside Meadowridge Shopping Centre, in Meadowridge.',
  NULL, NULL,
  '["https://www.facebook.com/p/Meadowridge-Pharmacy-100063708632105/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=85031"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'meadowridge-pharmacy-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bergvliet-dental-medical-bergvliet', 'Bergvliet Dental & Medical',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '55 Bergvliet Rd, Bergvliet, Cape Town', '021 715 1148', NULL, NULL,
  'Bergvliet Dental & Medical is a dental and medical practice in Bergvliet, offering dentistry alongside general medical and therapy services.',
  NULL, NULL,
  '["https://www.facebook.com/Bergvlietdms/", "https://textmap.co.za/3/16413"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bergvliet-dental-medical-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mullers-dental-studio-bergvliet', 'Mullers Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  'Harry Goemans Centre, 151 Main Road, Bergvliet, Cape Town', '021 712 0189', NULL, NULL,
  'Mullers Dental Studio is a dental practice in Harry Goemans Centre on Main Road, Bergvliet.',
  NULL, NULL,
  '["https://www.mullersdentalstudio.co.za/about-us/", "https://www.medpages.info/sf/index.php?orgcode=293942&page=organisation"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mullers-dental-studio-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-converters-tokai-kirstenhof', 'Cash Converters Tokai',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  '268 Main Road, Kirstenhof, Cape Town', '021 300 5225', NULL, NULL,
  'Cash Converters Tokai is a secondhand goods and pawnbroking store on Main Road, Kirstenhof.',
  NULL, NULL,
  '["https://www.cashconverters.co.za/store/tokai/", "https://www.cybo.com/ZA-biz/cash-converters-tokai_1r"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-converters-tokai-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
