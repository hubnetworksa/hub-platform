-- Thin-page fill, Pretoria batch 9, checkpoint 1: Atteridgeville
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-apparel-atteridgeville', 'Mr Price Apparel',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'atlyn-shopping-centre-atteridgeville'),
  'Atlyn Shopping Centre, Cnr Phudufufu St & Khoza St, Atteridgeville, Pretoria, 0008', '012 373 4046', NULL, NULL,
  'Mr Price Apparel is a branch of the national Mr Price Apparel South Africa clothing chain, trading from the Atlyn Shopping Centre in Atteridgeville. The store stocks fashion for the whole family, with clearly marked sections for ladies, mens, kids and baby wear, alongside a selection of accessories and shoes. Ranges typically include casual basics and weekend wear as well as smarter pieces suited to work, school functions and special occasions, with denim, T-shirts, knitwear, dresses and skirts making up the bulk of the stock.

As part of a store that refreshes its ranges frequently, shoppers can expect new arrivals and trend-driven pieces on a regular basis, at the accessible pricing the Mr Price brand is known for. The Atteridgeville branch serves families, students and working professionals looking for affordable, current fashion without travelling outside the suburb, and its stock of everyday essentials, from socks and sleepwear to shoes and basic denim, makes it a practical stop for regular wardrobe needs as well as occasional shopping trips.',
  NULL, NULL, NULL,
  '["https://atlyn.co.za/stores/", "https://destinali.com/pretoria/fashion-clothing/mr-price-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-apparel-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'foschini-atteridgeville', 'Foschini',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'atlyn-shopping-centre-atteridgeville'),
  'Atlyn Shopping Centre, Khoza St, Atteridgeville, Pretoria, 0008', '012 373 1981', NULL, NULL,
  'Foschini is a women''s fashion store trading from the Atlyn Shopping Centre in Atteridgeville, part of the long-running Foschini clothing chain found in shopping centres across South Africa. The Atteridgeville branch stocks a curated range of women''s clothing, cosmetics and fashion accessories, aimed at shoppers looking for current styles without leaving the suburb.

Customers can shop in person, use in-store pickup, or arrange delivery for off-site orders, and the store accepts credit card payments. The premises have a wheelchair accessible entrance and parking, making the Atlyn Shopping Centre branch a convenient, easy-to-browse stop for everyday fashion and cosmetics shopping in Atteridgeville.',
  NULL, NULL, NULL,
  '["https://pretoria.co.za/place/foschini-attridgeville", "https://www.africabizinfo.com/ZA/foschini-attridgeville-012-373-1981"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foschini-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pep-stores-atteridgeville', 'PEP Stores',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'atlyn-shopping-centre-atteridgeville'),
  'Shop B6, Atlyn Shopping Centre, Cnr Phudufufu St & Khoza St, Atteridgeville, Pretoria, 0008', '012 373 7240', NULL, NULL,
  'PEP Stores operates a branch from Shop B6 in the Atlyn Shopping Centre in Atteridgeville, part of the national PEP discount retail chain found in shopping centres across South Africa. The Atteridgeville store falls within PEP''s clothing, footwear and accessories range, offering affordably priced everyday wear for men, women and children alongside basics shoppers return to regularly.

As a value-focused retailer, the store carries frequently refreshed stock and seasonal promotions, making it a practical stop for budget-conscious shoppers in Atteridgeville doing everyday clothing and accessory shopping without needing to travel to a larger centre. The branch keeps regular trading hours through the week and on weekends, fitting around typical shopping patterns in the area.',
  'Mon-Fri 08:30-17:30, Sat 08:00-13:00, Sun 09:00-13:00', NULL, NULL,
  '["https://atlyn.co.za/stores/", "https://www.tiendeo.co.za/stores/atteridgeville/pep-stores-shop-b-attlyn-shopping-centre-cnr-phudufufu-street-khoza-street-atteridgeville-tshwane-gauteng/42710", "https://www.africabizinfo.com/ZA/pep-atteridgeville-phudufufu-street-012-373-7240"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-stores-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'webbers-atteridgeville', 'Webbers',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'atlyn-shopping-centre-atteridgeville'),
  'A10, Atlyn Shopping Centre, 420 Phudufufu St, Atteridgeville, Pretoria, 0008', '012 373 4268', NULL, NULL,
  'Webbers Clothing & Footwear operates a branch at the Atlyn Shopping Centre in Atteridgeville, trading as part of the national Webbers retail chain found in shopping centres across South Africa. The store describes itself as a national menswear retailer, stocking cutting-edge fashion for men and boys, with a range that spans clothing and footwear under one roof.

Positioned among the other fashion and footwear outlets at the Atlyn Shopping Centre, the Atteridgeville branch gives local shoppers a dedicated source for men''s and boys'' clothing and shoes without needing to travel to a larger mall elsewhere in Pretoria, fitting into the centre''s broader mix of national clothing retailers.',
  NULL, NULL, NULL,
  '["https://yellowpages-af.cybo.com/ZA-biz/webbers_28a", "https://www.sayellow.com/view/south-africa/webbers-clothing-and-footwear-attlyn-mall-in-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'webbers-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ahk-motor-spares-atteridgeville', 'Ahk Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  '3 Maunde St, Corner of Maunde & Mokgoba Street, Atteridgeville, Pretoria, 0006', '012 375 1168', NULL, NULL,
  'Ahk Motor Spares is an auto parts store trading from the corner of Maunde and Mokgoba Street in the heart of Atteridgeville. The shop stocks a wide range of automotive parts and accessories, including engines, gearboxes, alternators, starters, brake pads and discs, clutch kits and body parts, along with spares covering a broad spread of vehicle brands sold in South Africa.

The store is open seven days a week and offers safe parking outside the premises for customers. If a particular part is not in stock, staff will assist with sourcing it within a reasonable time frame, a service aimed at keeping local vehicle owners, including the area''s taxi operators, back on the road with minimal downtime.',
  NULL, NULL, NULL,
  '["https://www.cylex.net.za/company/ahk-motor-spares-atteridgeville-23678140.html", "https://www.africabizinfo.com/ZA/ahk-motor-spares-atteridgeville-012-375-1168", "https://za.africabz.com/gauteng/ahk-motor-spares-atteridgeville-134856"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ahk-motor-spares-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'builders-superstore-atteridgeville-atteridgeville', 'Builders Superstore Atteridgeville',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'nkomo-village-shopping-centre-atteridgeville'),
  '68 Tlou St, Nkomo Village, Atteridgeville, Pretoria, 0008', '012 942 4400', NULL, NULL,
  'Builders Superstore Atteridgeville is a building materials and hardware store trading from the Nkomo Village shopping centre in Atteridgeville, part of the wider Builders network of DIY, paint and building material stores found across South Africa. The branch stocks core building supplies such as cement, bricks and general building materials, together with hand tools, power tools and a range of paint and painting supplies.

Beyond the basics, the store carries plumbing fittings, electrical accessories, fasteners, adhesives and sealants, as well as storage and organisation products for garages, sheds and workspaces. It serves homeowners, renters, small contractors and DIY enthusiasts across Atteridgeville and the surrounding area, giving the suburb a local option for both small repairs and larger home-improvement or building projects without travelling further into Pretoria.',
  NULL, NULL, NULL,
  '["https://www.africabizinfo.com/ZA/builders-superstore-atteridgeville-012-942-4400", "https://za.africabz.com/gauteng/builders-superstore-atteridgeville-534456", "https://destinali.com/pretoria/building-materials/builders-superstore-atteridgeville-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'builders-superstore-atteridgeville-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-atteridgeville-atteridgeville', 'Shoprite Atteridgeville',
  (SELECT id FROM suburbs WHERE slug = 'atteridgeville'),
  (SELECT id FROM shopping_centers WHERE slug = 'atlyn-shopping-centre-atteridgeville'),
  'Cnr Phudufufu St & Khoza St, Atlyn Shopping Centre, Atteridgeville, Pretoria, 0008', '012 373 1861', NULL, NULL,
  'Shoprite Atteridgeville is a supermarket branch of the national Shoprite chain, trading from the Atlyn Shopping Centre on the corner of Phudufufu and Khoza Street in Atteridgeville. The store offers a full grocery range alongside an in-house bakery and deli counter, with a focus on fresh produce, quality meats and everyday household essentials.

Shoppers can pay by credit card, debit card or NFC mobile payment, and the branch offers same-day delivery and in-store pickup for added convenience. The premises have a wheelchair accessible entrance and parking, making this Atlyn Shopping Centre branch a practical, full-range grocery stop for households across Atteridgeville.',
  NULL, NULL, NULL,
  '["https://pretoria.co.za/place/shoprite-atteridgeville-1", "https://atlyn.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-atteridgeville-atteridgeville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
