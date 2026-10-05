INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pierre-krynauw-attorneys-doringkloof', 'Pierre Krynauw Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  '9 Protea St, Doringkloof, Centurion, 0157', '012 667 4155', NULL, NULL,
  'Pierre Krynauw Attorneys is a law firm based in Doringkloof, Centurion, offering legal services across family and commercial matters. The practice provides guidance and representation to clients dealing with family law disputes as well as commercial and related legal matters, aiming to achieve favourable outcomes through thorough preparation and clear communication.

The firm emphasises a professional, client-focused approach, with tailored strategies built around each client''s circumstances and transparent communication throughout a matter. Based on Protea Street in Doringkloof, the practice is accessible to clients in Centurion and the surrounding area, with wheelchair-accessible parking and toilet facilities on site. Clients can arrange a consultation to discuss family or commercial legal needs.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/pierre-krynauw-attorneys", "https://www.africabizinfo.com/ZA/pierre-krynauw-attorneys-012-667-4155"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pierre-krynauw-attorneys-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'tasty-pastry-doringkloof', 'Tasty Pastry',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Shop 72a, Doringkloof Mall, 3 Protea Street, Doringkloof, Centurion', '072 718 6009', NULL, NULL,
  'Tasty Pastry is a bakery and takeaway outlet in Doringkloof Mall, Centurion, specialising in pies and pastries. The shop offers a range of freshly baked savoury pies and sweet pastries for customers looking for a quick, affordable bite while shopping in the mall.

Operating from Shop 72a within Doringkloof Mall on Protea Street, Tasty Pastry serves mall visitors with convenient takeout service. The shop provides a wheelchair-accessible entrance and wheelchair-accessible parking, and operates on a cash-only basis, keeping transactions quick and uncomplicated for customers passing through the centre. Early customer reviews have rated the outlet highly, reflecting positive experiences with its freshly made pies and pastries.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/tasty-pastry", "https://www.cybo.com/ZA-biz/tasty-pastry_11"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tasty-pastry-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'hair-networks-pta-doringkloof', 'Hair Networks PTA',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Shop 002, Doringkloof Centre, Centurion, 0157', '082 430 6417', 'https://hairnetworkspta.co.za/', NULL,
  'Hair Networks PTA is a hair salon based in Doringkloof, Centurion, offering a wide range of hair care and styling services. The salon''s offerings span colouring and highlighting treatments, relaxing and chemical straightening, braiding and twist locks, and cuts and styles suited to a variety of hair types, along with nail and braiding services.

Operating from Shop 002 at Doringkloof Centre, the salon takes bookings through an online appointment system, allowing customers to schedule treatments in advance. With services ranging from quick colour touch-ups to multi-hour braiding and treatment packages, Hair Networks PTA caters to clients seeking both everyday maintenance and more involved hair transformations.',
  NULL,
  NULL, NULL,
  '["https://www.facebook.com/people/Hair-Networks-PTA/100046103992689/", "https://hairnetworkspta.co.za/", "https://www.beautynailhairsalons.com/ZA/Doringkloof/1616565878625639/Hair-Networks-PTA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hair-networks-pta-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-industry-hair-and-beauty-doringkloof', 'The Industry Hair & Beauty',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  '183 Leonie St, Doringkloof, Centurion, 0157', '082 432 4776', NULL, NULL,
  'The Industry Hair & Beauty is a hair and beauty salon located in Doringkloof, Centurion. The salon offers hairdressing services alongside a broader beauty menu that includes laser hair removal, eyebrow shaping, manicures and pedicures, and hair extensions, catering to clients looking for both hair and general beauty treatments in one visit.

Based on Leonie Street in Doringkloof, the salon has built a strong local reputation, with online reviews rating the service highly. The premises are wheelchair-accessible, with an accessible car park and entrance, and the salon accepts credit card payments, making it a practical option for beauty and hair appointments in the suburb.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/the-industry-hair-beauty-082-432-4776", "https://www.hairsalonspretoria.co.za/salons/the-industry-hair-and-beauty"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-industry-hair-and-beauty-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'lizmar-books-doringkloof-doringkloof', 'Lizmar Books Doringkloof',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Protea St, Doringkloof, Centurion', '068 490 4717', NULL, NULL,
  'Lizmar Books Doringkloof is a second-hand bookshop and book exchange based in Doringkloof, Centurion. The shop buys, sells and exchanges used books, with customers able to trade in titles they have already read for a refund or credit towards other books in store.

The Doringkloof branch sits on Protea Street and is one of a small number of Lizmar Books locations in the greater Centurion area. The exchange model gives readers an affordable way to build a home library, with stock turning over regularly as customers bring in and take out titles across a range of genres. The branch keeps regular trading hours from Monday to Saturday, closing on Sundays, and customer reviews consistently describe the shop''s atmosphere as relaxed and welcoming, with staff praised for their knowledge of the stock and willingness to help customers track down specific titles.',
  'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/lizmar-books-doringkloof-068-490-4717", "https://za.africabz.com/gauteng/lizmar-books-doringkloof-685678"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lizmar-books-doringkloof-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'celankobe-engineering-and-architectural-consultants-doringkloof', 'Celankobe Engineering and Architectural Consultants',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  '57 Mahonie St, Doringkloof, Centurion, 0157', '087 152 0083', 'https://celankobe.co.za', NULL,
  'Celankobe Engineering and Architectural Consultants is an engineering and architectural consultancy based in Doringkloof, Centurion. The firm provides design, feasibility studies and project planning services, working on residential projects for clients in the greater Centurion area.

Based on Mahonie Street in Doringkloof, the consultancy combines engineering and architectural input on a single project, from initial planning through to design development. Its services extend to accessibility-focused solutions, helping clients adapt or plan buildings with accessibility requirements in mind. The practice keeps standard weekday office hours, is closed over weekends, and provides wheelchair-accessible parking at its Mahonie Street premises. Client reviews have rated the firm highly, reflecting positive experiences with its design and planning work.',
  'Mon-Fri 08:00-17:00, Sat-Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/celankobe-engineering-and-architectural-087-152-0083", "https://pretoria.co.za/place/celankobe-engineering-and-architectural-consultants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'celankobe-engineering-and-architectural-consultants-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'fabulous-party-shop-doringkloof', 'Fabulous Party Shop',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Shop 31, Doringkloof Mall, Botha Avenue, Centurion', '060 939 0618', 'https://fabulousparty.co.za/', NULL,
  'Fabulous Party Shop is a party supply store in Doringkloof Mall, Centurion, stocking decorations and supplies for birthdays, baby showers, corporate events and other celebrations. The 600 square metre store holds more than 500 party themes, along with balloons, cakes, costumes, party packs and themed decor for a wide range of occasions.

Customers can walk into the Botha Avenue store without booking ahead to browse the full range in person, since the shop operates as a physical, in-store retailer rather than an online business. The store supplies both individual shoppers planning a one-off celebration and anyone needing bulk party supplies for larger events.',
  NULL,
  NULL, NULL,
  '["https://fabulousparty.co.za/", "https://www.facebook.com/FABUPARTY/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fabulous-party-shop-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'doringkloof-pharmacy-doringkloof', 'Doringkloof Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  'Pick ''n Pay Centre, Doringkloof, Centurion', '012 667 1981', 'https://www.linkpharmacy.co.za', NULL,
  'Doringkloof Pharmacy is a retail pharmacy operating under the Link Pharmacy group, based at the Pick ''n Pay Centre in the Doringkloof area of Centurion. The pharmacy dispenses prescription medicines and stocks over-the-counter health, wellness and personal care products for the surrounding community.

As part of a shopping centre that also houses a Pick ''n Pay supermarket, Doringkloof Pharmacy gives local shoppers the option to combine a grocery trip with picking up medication or health products. The pharmacy keeps extended weekday and Saturday trading hours, closing only on Sundays, giving residents flexibility around when they can collect prescriptions. A dedicated fax line is also listed alongside its phone number, allowing prescriptions to be sent through from referring doctors.',
  'Mon-Fri 08:30-18:00, Sat 08:00-14:00, Sun Closed',
  NULL, NULL,
  '["https://www.cylex.net.za/company/doringkloof-pharmacy-17617143.html", "https://www.africabizinfo.com/ZA/doringkloof-pharmacy-apteek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'doringkloof-pharmacy-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-supermarket-doringkloof-doringkloof', 'Pick n Pay Supermarket Doringkloof',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  '1102 Protea Rd, Doringkloof, Pretoria', '087 750 2296', NULL, NULL,
  'Pick n Pay Supermarket Doringkloof is a branch of the Pick n Pay grocery chain, located within the Doringkloof Shopping Centre on Protea Road in Centurion. The store stocks the standard Pick n Pay grocery range, including fresh produce, packaged goods and household items, serving shoppers in the Doringkloof area.

As one of the anchor stores in the Doringkloof Shopping Centre, the supermarket draws regular foot traffic from residents doing their weekly grocery shop alongside visits to the centre''s other retailers. Weekly specials and catalogue promotions run through the store in line with the wider Pick n Pay chain''s pricing calendar.',
  NULL,
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/pretoria/pick-n-pay-protea-rd-doringkloof/44120", "https://local.infobel.co.za/ZA102938800/pick_n_pay_doringkloof-doringkloof.html", "https://www.mydestination.co.za/business/view/en_US/20509.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-supermarket-doringkloof-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'exclusive-meats-doringkloof', 'Exclusive Meats',
  (SELECT id FROM suburbs WHERE slug = 'doringkloof'),
  '156 Jakaranda Street, Doringkloof, 0157', '060 526 5285', NULL, NULL,
  'Exclusive Meats is a butchery based in Doringkloof, Centurion, supplying fresh meat products to local households. The shop operates from Jakaranda Street in the suburb, giving nearby residents a dedicated butcher as an alternative to buying meat at a larger supermarket.

The business also works as a meat wholesaler and caterer, and offers professional game processing during hunting season, turning a customer''s harvest into clean-cut portions as well as seasoned biltong and droewors. As a small, locally based butcher, it focuses on serving the immediate Doringkloof community rather than operating as part of a larger retail chain, with its Jakaranda Street location placing it within easy reach of other grocery and retail businesses in the suburb.',
  NULL,
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Doringkloof/720657-20", "https://www.facebook.com/p/Exclusive-meats-61576370675205/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'exclusive-meats-doringkloof'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-portrait-studio-lynnwood', 'The Portrait Studio',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood'),
  '141 Lynnwood Rd, Pretoria', '012 753 3116', 'https://www.theportraitstudio.co.za', NULL,
  'The Portrait Studio is a photography and printing business based on Lynnwood Road in Pretoria, next to the Karoo Cafe. Alongside portrait photography, the studio offers a printing service that produces photo prints and canvas prints in a range of standard sizes, allowing customers to turn digital images into physical prints and wall art.

The studio''s premises include a reception and seating area, a large infinity-curve photography studio, and a dedicated makeup and dressing room for clients preparing for a shoot. The business is open six days a week, giving Lynnwood-area customers a nearby option for both photography sessions and photo or canvas printing.',
  'Mon-Sat 09:00-17:00',
  NULL, NULL,
  '["https://www.theportraitstudio.co.za/contact-us/", "https://www.facebook.com/ThePortraitStudioSA/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-portrait-studio-lynnwood'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
