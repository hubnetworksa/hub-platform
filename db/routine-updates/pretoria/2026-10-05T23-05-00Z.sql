-- Thin-page fill, Pretoria batch 5, checkpoint 3: Hammanskraal
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  '5-star-hardware-hammanskraal', '5 Star Hardware',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  'Sekampanang, Hammanskraal, 0400', '083 742 8771', NULL, NULL,
  '5 Star Hardware is a hardware shop based in Sekampanang, Hammanskraal, on the northern edge of Pretoria. The shop offers tools, building materials and equipment for do-it-yourself jobs as well as professional projects, with staff on hand to help customers choose the right products quickly.

The shop is open seven days a week with flexible trading hours, and accepts NFC mobile payments as well as credit and debit cards alongside cash, giving Hammanskraal residents a convenient local option for hardware purchases without needing to travel further into Pretoria. Its Sekampanang, Hammanskraal address and contact details are recorded consistently across more than one independent South African business directory.',
  'Mon-Sun 07:00-17:00', NULL, NULL,
  '["https://pretoria.co.za/place/5-star-hardware", "https://www.cybo.com/ZA-biz/star-hardware_7Q"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '5-star-hardware-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pepcell-hammanskraal', 'PEPcell',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  'Shop 15A, Jubilee Mall, Harry Gwala Avenue, Hammanskraal', '012 727 1225', NULL, NULL,
  'PEPcell is a mobile phone and accessories store trading from Shop 15A in Jubilee Mall on Harry Gwala Avenue in Hammanskraal. As a branch of the PEPcell chain, the store sells mobile phones and related accessories alongside the wider PEP group''s retail offering.

Based inside Jubilee Mall, the store serves shoppers across Hammanskraal who need a nearby outlet for phones and accessories rather than travelling into central Pretoria for the same chain''s other branches. Its Jubilee Mall, Hammanskraal address and phone number are recorded consistently across more than one independent South African business directory, which identify it as a distinct branch of the chain rather than a generic PEP store listing.',
  NULL, NULL, NULL,
  '["https://www.africabizinfo.com/ZA/pepcell_9Z-012-727-1225", "https://www.findglocal.com/ZA/Hammanskraal/100785861358975/PEP-Cell"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pepcell-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kgatoentle-printing-works-hammanskraal', 'Kgatoentle Printing Works',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  'Portion 9, C9440, Hammanskraal, 0400', '078 461 2212', NULL, NULL,
  'Kgatoentle Printing Works is a print shop based at Portion 9, C9440, in Hammanskraal, near Makgake Primary School. The business offers printing services ranging from business cards to flyers and personalised stationery, aimed at individuals and small businesses who need printed materials produced locally rather than ordered in from central Pretoria.

The shop emphasises quick turnaround and competitive pricing on its printing jobs, serving customers across Hammanskraal who need branding or personal print projects completed close to home. Its Hammanskraal address and phone number are recorded consistently on both an independent local business directory and a separate stationery-industry distributor listing, which both describe it as a small, locally based print shop rather than a franchise branch.',
  NULL, NULL, NULL,
  '["https://pretoria.co.za/place/kgatoentle-printing-works", "https://stationerysupplies.co.za/distributors/kgatoentle-printing-works/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kgatoentle-printing-works-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'big-save-hammanskraal-hammanskraal', 'Big Save Hammanskraal',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  '4 Kudebe Ext, Hammanskraal', '087 654 6782', NULL, NULL,
  'Big Save Hammanskraal is a grocery store located at 4 Kudebe Extension in Hammanskraal. The store offers a wide range of everyday groceries alongside in-house bakery and butchery sections, giving shoppers a fuller range than a convenience-style outlet.

The store offers same-day and off-site delivery alongside in-store shopping, and accepts NFC mobile payments and card payments in addition to cash, with a wheelchair-accessible entrance and parking. It has built up a large base of customer reviews for a Hammanskraal grocery store. Its Kudebe Extension, Hammanskraal address and phone number are recorded consistently on both a local business listing site and an independent South African business directory.',
  NULL, NULL, NULL,
  '["https://pretoria.co.za/place/big-save-hammanskraal", "https://www.africabizinfo.com/ZA/big-save-hammanskraal-087-654-6782"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-save-hammanskraal-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'milo-printing-hammanskraal', 'MILO Printing',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  'SV3 Sekampaneng, Temba Rural, Hammanskraal', '082 282 5882', NULL, 'miloprintingservices@gmail.com',
  'MILO Printing is a printing and branding business based in the Sekampaneng area of Temba, within greater Hammanskraal. The business offers a broad range of printed and branded products, including flags, signage, personalised cushions, tumblers, paper bags and sublimation printing, taking orders directly from customers.

Operating from Hammanskraal, MILO Printing serves customers across the area who need custom branded items produced locally rather than ordered from a supplier elsewhere in Pretoria. Its phone number is recorded consistently on its own Facebook business page and on an independent South African business directory, both of which identify it as a Hammanskraal-based printing and branding service.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/miloprintingshop/", "https://www.africabizinfo.com/ZA/milo-printing-082-282-5882"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'milo-printing-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'homex-furniture-and-lifestyle-hammanskraal', 'HomeX Furniture & Lifestyle',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  'Shop 11, Hammanskraal Shopping Centre, 407 Kudebe Douglas Rens Road, Hammanskraal', '087 012 6285', 'https://homexlifestyle.co.za', 'info@homexlifestyle.co.za',
  'HomeX Furniture & Lifestyle is a furniture and homeware store based at the Hammanskraal Shopping Centre on Kudebe Douglas Rens Road in Hammanskraal. The store sells furniture and home essentials, including kitchen suites, wardrobes, doors and household appliances, aiming to offer everyday low prices across its range.

Trading from Shop 11 of the Hammanskraal Shopping Centre, the store gives residents of Hammanskraal a local option for furnishing a home without travelling further into Pretoria for similar chain stores. Its Hammanskraal Shopping Centre address, phone number and email address are recorded consistently on both its own website and an independent South African business directory.',
  NULL, NULL, NULL,
  '["https://homexlifestyle.co.za/contact-us/", "https://www.findglocal.com/ZA/Hammanskraal/559348220606311/HomeX-Furniture-%26-Lifestyle"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'homex-furniture-and-lifestyle-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
