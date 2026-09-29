INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-vida-luka-luxury-guesthouse-lukasrand', 'La Vida Luka - Luxury Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'lukasrand'),
  '569 Lukas Street, Lukasrand, Pretoria, 0181', '083 456 7052', 'https://lavidalukaguesthouse.co.za', 'lavidalukaguesthouse@gmail.com',
  'La Vida Luka is a luxury guesthouse in Lukasrand offering air-conditioned rooms with flat-screen TVs, private bathrooms and free WiFi, plus free parking, close to embassies, universities and hospitals in eastern Pretoria.',
  NULL, NULL,
  '["https://lavidalukaguesthouse.co.za/", "https://www.tripadvisor.com/Hotel_Review-g312583-d13814625-Reviews-La_Vida_Luka_Luxury_Guesthouse-Pretoria_Gauteng.html", "https://www.facebook.com/LaVidaLukaGuesthouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-vida-luka-luxury-guesthouse-lukasrand'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mphahlele-and-masipa-inc-attorneys-lukasrand', 'Mphahlele & Masipa Inc. Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'lukasrand'),
  '29 Florence Ribeiro Ave, Lukasrand, Pretoria, 0181', '012 753 3054', 'https://mminca.com', 'info@mminca.com',
  'Mphahlele & Masipa Inc. Attorneys is a boutique law firm in Lukasrand handling commercial litigation, mining law, administrative and procurement law, commercial arbitration, third-party claims and labour law matters for businesses and individuals.',
  NULL, NULL,
  '["https://mminca.com/job-location/29-florence-ribeiro-ave-lukasrand-pretoria-0181/", "https://www.facebook.com/mminca.law/", "https://b2bhint.com/en/company/za/mphahlele-and-masipa-attorneys--K2018231745"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mphahlele-and-masipa-inc-attorneys-lukasrand'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crawford-international-pretoria-lukasrand', 'Crawford International Pretoria',
  (SELECT id FROM suburbs WHERE slug = 'lukasrand'),
  '555 Sibelius Street, Lukasrand, Pretoria, 0181', '012 344 1886', 'https://www.crawfordinternational.co.za/pretoria', 'pretoria@crawfordinternational.co.za',
  'Crawford International Pretoria is a private, co-educational school in Lukasrand offering pre-primary, primary and secondary IEB-curriculum education for pupils aged 3 to 18, with sports facilities including a swimming pool and cricket field.',
  NULL, NULL,
  '["https://www.crawfordinternational.co.za/pretoria-preparatory", "https://en.wikipedia.org/wiki/Crawford_College,_Pretoria", "https://www.jozikids.co.za/listing/crawford-international-pretoria/about/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crawford-international-pretoria-lukasrand'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'raw-gym-lukasrand', 'RAW Gym',
  (SELECT id FROM suburbs WHERE slug = 'lukasrand'),
  '627 Sibelius Street, Lukasrand, Pretoria, 0181', '082 386 1591', 'https://rawgym.co.za', 'contact@riseaboveweaknessgym.com',
  'RAW Gym is a boxing and fitness gym in Lukasrand offering boxing, weightlifting, calisthenics and personal training, open Mon-Thu 05:00-20:00, Fri 05:00-18:30, Sat and public holidays 07:00-12:00.',
  'Mon-Thu 05:00-20:00, Fri 05:00-18:30, Sat & public holidays 07:00-12:00',
  NULL, NULL,
  '["https://rawgym.co.za/", "https://www.riseaboveweaknessgym.com/", "https://www.instagram.com/raw_gym_pta/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'raw-gym-lukasrand'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
