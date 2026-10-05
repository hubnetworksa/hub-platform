INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'zuriel-cartridge-and-stationery-hermanstad', 'Zuriel Cartridge And Stationery',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  'Shop No.6, Garden Plaza, 4862 Hendriks St, Hermanstad, Pretoria, 0082', '012 379 7474', NULL, NULL,
  'Zuriel Cartridge And Stationery is a stationery shop in Hermanstad, Pretoria, stocking cartridges, office supplies and a range of printing accessories for home and business use. The shop also provides on-site printer repair, giving customers in the area a single stop for both everyday supplies and basic equipment servicing such as cartridge refills and printer troubleshooting.

The store trades from Shop No. 6 in Garden Plaza on Hendriks Street in Hermanstad, open Monday to Saturday. Credit card payments are accepted alongside cash, making it a convenient option for office managers, students and households restocking everyday stationery, cartridges and printing essentials without travelling further into central Pretoria.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/zuriel-cartridge-and-stationery","https://www.africabizinfo.com/ZA/zuriel-cartridge-and-stationery-012-379-7474"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zuriel-cartridge-and-stationery-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cleaning-warehouse-hermanstad-hermanstad', 'Cleaning Warehouse Hermanstad',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '599A Moot St, Hermanstad, Pretoria, 0082', '012 940 6065', 'https://cleaningwarehouse.co.za/', NULL,
  'Cleaning Warehouse Hermanstad is a locally based cleaning business operating in and around Hermanstad, Pretoria, specialising in both residential and commercial cleaning. The team handles routine household cleaning as well as contract work for offices and other businesses in the area, aiming for consistent, dependable results on each job, including tile cleaning among its listed services.

The business is based at 599A Moot Street in Hermanstad and keeps regular weekday trading hours from Monday to Friday, plus shorter Saturday hours, closing on Sundays. It serves households and businesses across the surrounding Hermanstad area, offering a locally based alternative to larger Pretoria-wide cleaning contractors for residents who want a nearby, dedicated cleaning service.',
  'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://fixfind.co.za/cleaning-services/cleaning-warehouse-hermanstad/","https://pretoria.co.za/place/cleaning-warehouse-hermanstad"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cleaning-warehouse-hermanstad-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'house-of-furnatics-hermanstad', 'House of Furnatics',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  'no.4, Office, 477 Moot St, Hermanstad, Pretoria, 0082', '012 377 0239', 'https://www.furnatics.co.za/', NULL,
  'House of Furnatics is a furniture showroom in Hermanstad, Pretoria, offering a curated selection of furniture that includes contemporary sofas, dining sets and home decor pieces. The showroom is set up for in-store shopping, with staff on hand to help customers choose pieces to suit different tastes and budgets across the range on display.

Located at Office 4, 477 Moot Street in Hermanstad, the business offers delivery for orders placed off-site in addition to its showroom sales, and provides a wheelchair-accessible entrance and parking for visiting customers. It accepts credit card payments, serving households and office customers furnishing or refreshing living and workspaces in the surrounding Hermanstad area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/house-of-furnatics","https://www.furnatics.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'house-of-furnatics-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ads-on-the-go-hermanstad', 'Ads On The Go',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '490 Moot St, Hermanstad, Pretoria, 0082', '012 379 3714', NULL, NULL,
  'Ads On The Go is a marketing and advertising agency based in Hermanstad, Pretoria, providing tailored campaigns, digital marketing and creative advertising services to local businesses. The agency works with clients to develop messaging intended to be both clear and measurable, rather than offering generic, one-size-fits-all advertising packages to every client that walks in.

The business operates from 490 Moot Street in Hermanstad and offers wheelchair-accessible parking for visiting clients. Its hands-on approach covers campaign planning through to execution, making it an option for small and medium businesses in the area looking for practical marketing support without going through a larger, Pretoria-wide advertising agency.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/ads-on-the-go","https://www.africabizinfo.com/ZA/ads-on-the-go-012-379-3714"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ads-on-the-go-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pharma-life-pty-ltd-hermanstad', 'Pharma Life (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '386 Taljaard St, Hermanstad, Pretoria, 0082', '012 379 7382', NULL, NULL,
  'Pharma Life (Pty) Ltd is a neighbourhood pharmacy in Hermanstad, Pretoria, offering medications, health products and general wellness services to the surrounding community. The pharmacy handles prescription refills and over-the-counter remedies, with staff on hand to provide pharmaceutical guidance to customers who stop in for everyday health needs throughout the week.

The pharmacy is located at 386 Taljaard Street in Hermanstad and provides wheelchair-accessible parking for customers. It serves local households looking for a convenient, nearby option for everyday medication, health products and wellness advice, without having to travel to a larger pharmacy chain elsewhere in Pretoria for routine needs.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/pharma-life-pty-ltd","https://www.africabizinfo.com/ZA/pharma-life-pty-ltd-012-379-7382"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pharma-life-pty-ltd-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'medirite-courier-pharmacy-hermanstad', 'MediRite Courier Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '387 Taljaard St, Hermanstad, Pretoria, 0082', '012 377 9250', NULL, NULL,
  'MediRite Courier Pharmacy is a pharmacy in Hermanstad, Pretoria, offering in-store shopping alongside chronic medication support arranged through the Discovery health scheme. The pharmacy stocks a broad range of health products in addition to handling day-to-day prescription needs for customers living and working in the surrounding area of Hermanstad and nearby parts of Pretoria.

The store is located at 387 Taljaard Street in Hermanstad and accepts NFC mobile payments as well as credit and debit cards. A wheelchair-accessible entrance and parking are provided, making it a practical, nearby option for Hermanstad residents managing ongoing chronic medication alongside their regular, everyday pharmacy needs.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/medirite-courier-pharmacy","https://www.africabizinfo.com/ZA/medirite-courier-pharmacy-012-377-9250"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medirite-courier-pharmacy-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'lm-printers-hermanstad', 'LM Printers',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '866 Caledon St, Hermanstad, Pretoria, 0082', '012 379 7795', NULL, NULL,
  'LM Printers is a print shop in Hermanstad, Pretoria, producing business cards, flyers and signage for local businesses. The team offers personalised consultations to help customers plan each job, aiming for precise colour reproduction and durable finishes on all of its finished print work for every order it takes on.

The shop is based at 866 Caledon Street in Hermanstad and trades Monday to Friday from 8am to 4pm. It serves small businesses and individuals around Hermanstad needing everyday printed materials, from signage for a shopfront to business cards and flyers for a new venture or event in the local area.',
  'Mon-Fri 08:00-16:00',
  NULL, NULL,
  '["https://pretoria.co.za/place/lm-printers","https://www.cybo.com/ZA-biz/lm-printers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lm-printers-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ps27-security-services-and-solutions-hermanstad', 'Ps27 Security Services & Solutions',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '829 Napier St, Hermanstad, Pretoria, 0082', '065 826 9254', 'https://ps27-security-services-solutions.business.site', NULL,
  'Ps27 Security Services & Solutions is a security business based in Hermanstad, Pretoria, covering locksmith work, security systems, safes and vaults, and fencing. The business handles a range of physical security needs for homes and businesses in the surrounding area rather than focusing on just one specialty.

Based at 829 Napier Street in Hermanstad, the business is contactable 24 hours a day, every day of the week, reflecting the round-the-clock nature of security callouts and emergency locksmith work. It gives Hermanstad residents and businesses a local option for locksmith, security system, safe or fencing work without going through a larger, Pretoria-wide security contractor.',
  'Open 24 hours',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/ps-security-services-solutions-065-826-9254","https://www.cybo.com/ZA-biz/ps-security-services-solutions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ps27-security-services-and-solutions-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'real-security-hermanstad', 'Real Security',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '395 Taljaard St, Hermanstad, Pretoria', '083 268 8700', 'https://www.therealsecurity.co.za/', NULL,
  'Real Security is a PSiRA-registered commercial security company based in Hermanstad, serving businesses across Pretoria. Rather than offering a single standard package, the company assesses each client''s site and builds a personalised guarding plan around it, covering access and gate control, loss monitoring and risk assessment.

The company is based at 395 Taljaard Street in Hermanstad and provides uniformed, PSiRA-graded guards around the clock, along with special events guarding and 24-hour surveillance and night monitoring. It works alongside the South African Police Service, giving Pretoria businesses a guarding option built around their specific site and routine rather than a one-size-fits-all contract.',
  NULL,
  NULL, NULL,
  '["https://www.therealsecurity.co.za/","https://yellowpages-af.cybo.com/ZA-biz/real-security"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'real-security-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'big-11-hermanstad', 'Big 11',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '751 Hendriks St, Hermanstad, Pretoria, 0082', '084 436 2396', NULL, NULL,
  'Big 11 is a supermarket in Hermanstad, Pretoria, offering a broad range of groceries, household items and everyday essentials to local shoppers. The store aims for a straightforward, practical shopping experience for residents doing regular grocery runs rather than a specialty or bulk-buying format, with a wide product range on its shelves.

Located at 751 Hendriks Street in Hermanstad, the supermarket opens daily from 5:30am to 9pm and accepts credit card payments. A wheelchair-accessible entrance and parking are provided, and the extended daily opening hours make it a convenient option for Hermanstad households needing groceries early in the morning or later in the evening.',
  'Mon-Sun 05:30-21:00',
  NULL, NULL,
  '["https://pretoria.co.za/place/big-11","https://rsa.worldorgs.com/catalog/pretoria/supermarket/big-11"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-11-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ntswaki-investment-hermanstad', 'Ntswaki Investment',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '199 Bohlman St, Hermanstad, Pretoria', '067 982 9687', NULL, NULL,
  'Ntswaki Investment (Pty) Ltd is a general building and civil construction company based in Hermanstad, Pretoria. The company takes on both building and civil construction projects, with experience that also extends into property development and horticulture work alongside its core construction business and services for clients across the region.

The company operates from 199 Bohlman Street in Hermanstad, serving clients across Pretoria and the wider Gauteng region. It offers residential and commercial clients in the area a locally based contractor for building and civil construction work, rather than relying on a Pretoria-wide or national construction firm for smaller local projects and jobs.',
  NULL,
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/ntswaki-investment-in-pretoria","https://destinali.com/pretoria/masonry/ntswaki-investment-pretoria","https://www.cybo.com/ZA-biz/ntswaki-investment"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ntswaki-investment-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

