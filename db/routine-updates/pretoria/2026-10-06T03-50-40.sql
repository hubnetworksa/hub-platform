INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'fishaways-blu-valley-the-reeds', 'Fishaways Blu Valley',
  (SELECT id FROM suburbs WHERE slug = 'the-reeds'),
  (SELECT id FROM shopping_centers WHERE slug = 'blu-valley-mall-the-reeds'),
  'Shop 3, Blu Valley Mall, Cnr Rooihuiskraal Road & Bothrill Street, The Reeds, Centurion, 0157', '012 657 0539', 'https://locations.fishaways.co.za/restaurants-BluValleyMall-FishawaysBluValley', 'info@fishaways.co.za',
  'Fishaways Blu Valley is a branch of the Fishaways seafood and fish and chips takeaway chain, serving a menu that runs from signature hake and chips to grilled fish, sushi, hot pots and platters, along with plant-based options. Orders can be placed in person, online or through the Fishaways app, for collection or delivery.

The branch trades from Shop 3 in Blu Valley Mall, on the corner of Rooihuiskraal Road and Bothrill Street in The Reeds, Centurion, open every day from 08:00 to 21:00. Its position inside the mall gives The Reeds residents a quick-service seafood option alongside the centre''s other food outlets, without needing to travel further into Centurion for a sit-down or takeaway seafood meal.',
  'Mon-Sun 08:00-21:00',
  NULL, NULL,
  '["https://locations.fishaways.co.za/restaurants-BluValleyMall-FishawaysBluValley", "https://www.cylex.net.za/company/fishaways-23692249.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fishaways-blu-valley-the-reeds'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mukwevho-accountants-the-reeds', 'Mukwevho Accountants',
  (SELECT id FROM suburbs WHERE slug = 'the-reeds'),
  (SELECT id FROM shopping_centers WHERE slug = 'blu-valley-mall-the-reeds'),
  'Blu Valley Mall, Cnr Rooihuiskraal Road & Bothrill Street, The Reeds, Centurion, 0158', '012 657 1578', 'https://mukwevhoaccountantssa.co.za', NULL,
  'Mukwevho Accountants is an accounting practice offering financial statements, personal and business tax, auditing, monthly accounts, payroll, bookkeeping, business plans and company registration services, aimed primarily at small and medium enterprises. The practice is run by a Professional Accountant (SA), a formal accounting qualification recognised in South Africa.

The firm is based in Blu Valley Mall, on the corner of Rooihuiskraal Road and Bothrill Street in The Reeds, Centurion. Operating from inside the mall gives small business owners and individuals in The Reeds a local accountant for routine bookkeeping, tax submissions and company registration, without having to travel to a dedicated office park elsewhere in Centurion for everyday accounting support.',
  NULL,
  NULL, NULL,
  '["https://cmukwevho17.findanaccountant.co.za", "https://bluvalleymall.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mukwevho-accountants-the-reeds'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-blu-valley-the-reeds', 'Woolworths Blu Valley',
  (SELECT id FROM suburbs WHERE slug = 'the-reeds'),
  (SELECT id FROM shopping_centers WHERE slug = 'blu-valley-mall-the-reeds'),
  'Blu Valley Mall, Cnr Bothrill Avenue & Rooihuiskraal Road, The Reeds, Centurion', '012 657 9320', 'https://www.woolworths.co.za', NULL,
  'Woolworths Blu Valley is a branch of the Woolworths department store chain, combining a food hall with a clothing section under one roof. The store stocks Woolworths'' usual range of fresh produce, packaged groceries and ready meals alongside clothing and general merchandise, giving shoppers a single stop for both a grocery run and clothes shopping.

The branch trades from Blu Valley Mall, on the corner of Bothrill Avenue and Rooihuiskraal Road in The Reeds, Centurion. As one of the mall''s anchor tenants, it draws shoppers doing a broader shopping trip through the centre, giving The Reeds residents a full-range grocery and clothing option without having to travel to a larger Woolworths store elsewhere in Centurion or Pretoria.',
  NULL,
  NULL, NULL,
  '["https://za.africabz.com/gauteng/woolworths-blu-valley-35833", "https://bluvalleymall.co.za/", "https://www.cybo.com/ZA-biz/woolworths-blu-valley"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-blu-valley-the-reeds'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'die-akker-guest-house-donkerhoek', 'Die Akker Guest House',
  (SELECT id FROM suburbs WHERE slug = 'donkerhoek'),
  'Plot 138, Mooiplaats, Donkerhoek, Pretoria East, 1000', '083 285 4524', 'https://die-akker.co.za', NULL,
  'Die Akker Guest House is a guesthouse set in the African bush of Donkerhoek, styled with a Provence-inspired flair and surrounded by trees and a tranquil garden setting. Guests can choose from several en-suite rooms, including the Protea, Varkoor, Iris, Witroos and Bontroos rooms, with breakfast available on request and check-in running from midday to early evening.

The property, on Plot 138 in Mooiplaats, Donkerhoek, Pretoria East, also hosts weddings alongside its overnight accommodation, giving it a dual role as both a guesthouse and a function venue. This combination suits overnight guests seeking a quiet country stay as well as couples and families planning a wedding or event in a garden setting outside the city centre.',
  NULL,
  NULL, NULL,
  '["https://die-akker.co.za/contact-us/", "https://www.lekkeslaap.co.za/accommodation/die-akker-guest-house-27"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'die-akker-guest-house-donkerhoek'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'soetwaters-guest-house-donkerhoek', 'Soetwaters Guest House',
  (SELECT id FROM suburbs WHERE slug = 'donkerhoek'),
  'Nel Avenue, Plot 8, Rhenosterfontein Road, Donkerhoek, Pretoria', '079 163 4084', 'https://www.soetwaters.co.za', NULL,
  'Soetwaters Guest House is a country guesthouse offering a quiet, rural stay within a 20-minute drive of Pretoria on the N4 freeway. The property comprises five en-suite rooms and markets itself around the peace of country living, positioning it for business travellers wanting a calm overnight base as well as leisure guests after a change of pace from the city.

The guesthouse is based on Nel Avenue, Plot 8, Rhenosterfontein Road, in the Donkerhoek and Kleinfontein area near Rayton and Bronkhorstspruit. With a number of wedding and function venues nearby, it also serves as convenient overnight accommodation for guests attending an event in the surrounding Donkerhoek countryside, rather than only standalone leisure stays.',
  NULL,
  NULL, NULL,
  '["https://www.soetwaters.co.za", "https://za.africabz.com/gauteng/soetwaters-guest-house-137070"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'soetwaters-guest-house-donkerhoek'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
