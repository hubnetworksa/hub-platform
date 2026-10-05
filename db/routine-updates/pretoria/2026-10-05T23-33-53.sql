INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'bargain-books-kolonnade-montana-gardens', 'Bargain Books Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop U32, Kolonnade Shopping Centre, Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '012 668 1083', 'https://bargainbooks.co.za/stores/kolonnade', NULL,
  'Bargain Books Kolonnade is part of the Bargain Books chain, a South African bookseller with five stores in Pretoria alone, known for offering a wide, budget-friendly range of books rather than a single specialist genre. The Kolonnade branch stocks fiction, non-fiction and other popular titles at discounted prices, giving shoppers an affordable alternative to full-price bookstores.

The store trades from Shop U32 inside Kolonnade Shopping Centre on Sefako Makgatho Drive in Montana Park, Pretoria, within the mall''s stationery and books precinct alongside several other book retailers. Its location inside one of the area''s largest shopping centres makes it an easy stop for Montana Gardens residents doing a broader shopping trip, rather than a destination requiring a special journey.',
  NULL,
  NULL, NULL,
  '["https://bargainbooks.co.za/stores/kolonnade", "https://www.facebook.com/BargainBooksKolonnade/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bargain-books-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cum-books-kolonnade-montana-gardens', 'CUM Books Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop U66/67, Kolonnade Shopping Centre, Cnr Dr van der Merwe Street & Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '012 548 1683', 'https://cumbooks.co.za', NULL,
  'CUM Books Kolonnade is a branch of the CUM Books chain, a South African retailer specialising in Bibles, Christian literature, planners and gifts. The store carries a dedicated range of faith-based titles and related merchandise, serving shoppers seeking Christian books and devotional material rather than general fiction.

The branch trades from Shop U66/67 in Kolonnade Shopping Centre, on the corner of Dr van der Merwe Street and Sefako Makgatho Drive in Montana Park, Pretoria. Positioned within the mall''s books and stationery section, it gives residents of Montana Gardens and the surrounding area a nearby source for Christian books and gifts without needing to travel to a dedicated religious bookstore elsewhere in the city.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/cum-books-kolonnade-012-548-1683", "https://za.africabz.com/gauteng/cum-books-36675"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cum-books-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'incredible-connection-kolonnade-montana-gardens', 'Incredible Connection Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop 73, Kolonnade Shopping Centre, Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '012 548 9620', 'https://www.incredible.co.za/storelocator/store/index/id/58', NULL,
  'Incredible Connection Kolonnade is a branch of the Incredible Connection electronics chain, selling computers, tablets, and a wide range of technology accessories. The store offers in-store advice on its products as well as in-store pickup and delivery options, positioning it as a general IT and electronics retailer rather than a specialist repair shop.

The branch operates from Shop 73 in Kolonnade Shopping Centre on Sefako Makgatho Drive in Montana Park, Pretoria, within the mall''s technology precinct alongside other electronics and mobile retailers. For residents of Montana Gardens, it provides a nearby option for computer hardware, mobile accessories and related technology purchases without travelling further into Pretoria.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/incredible-connection-kolonnade", "https://www.incredible.co.za/storelocator/store/index/id/58"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'incredible-connection-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'istore-kolonnade-montana-gardens', 'iStore Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop U37A, Kolonnade Shopping Centre, Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '010 157 3224', 'https://www.istore.co.za/storelocator/storelocator/kolonnade', NULL,
  'iStore Kolonnade is a branch of iStore, South Africa''s Apple premium reseller, selling Apple computers, phones, tablets and accessories along with related in-store services. As part of a national retail network, the branch follows the group''s standard product range rather than stocking a locally curated selection.

The store trades from Shop U37A in Kolonnade Shopping Centre on Sefako Makgatho Drive in Montana Park, Pretoria, inside the mall''s technology and electronics section. It gives shoppers in Montana Gardens and nearby suburbs a dedicated Apple retailer within reach, rather than having to travel into central Pretoria for official Apple products and support.',
  NULL,
  NULL, NULL,
  '["https://www.istore.co.za/storelocator/storelocator/kolonnade", "https://www.kolonnadecentre.co.za/stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'istore-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'old-mutual-kolonnade-montana-gardens', 'Old Mutual Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop 70B, Kolonnade Shopping Centre, Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '012 399 1125', NULL, NULL,
  'Old Mutual Kolonnade is a branch of Old Mutual, a long-established South African financial services group, offering banking, lending and insurance products together with financial advice to walk-in clients. The branch allows customers to discuss savings, insurance and investment products in person rather than only online or by phone.

It operates from Shop 70B in Kolonnade Shopping Centre on Sefako Makgatho Drive in Montana Park, Pretoria, within the mall''s banking and financial services precinct alongside several other banks and insurers. The branch gives residents of Montana Gardens a nearby point of contact for financial planning and everyday banking and insurance needs without having to travel into central Pretoria.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/old-mutual-pretoria-kolonnade-shopping", "https://www.kolonnadecentre.co.za/stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'old-mutual-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'planet-fitness-montana-montana-gardens', 'Planet Fitness Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Cnr Sefako Makgatho Drive & Enkeldoorn Avenue, Kolonnade Shopping Centre, Montana Park, Pretoria', '012 548 0878', 'https://www.planetfitness.co.za/gyms/montana/', 'cgm.montana@planetfitness.co.za',
  'Planet Fitness Montana is a branch of the Planet Fitness gym chain, which has operated in South Africa for over 30 years. The club offers cardio and free-weights training areas, group exercise studios including hot studio classes, an indoor running track, a steam room and a dedicated kids'' area, along with personal trainers offering specialisations from rehabilitation to weight management.

The club is located at the corner of Sefako Makgatho Drive and Enkeldoorn Avenue, inside Kolonnade Shopping Centre in Montana Park, Pretoria. It trades Monday to Thursday from 05:00 to 21:00, Friday from 05:00 to 20:00, Saturday from 07:00 to 18:00 and Sunday from 07:00 to 16:00, giving Montana Gardens residents an early-morning and evening training option within the same shopping centre they already use for errands.',
  'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat 07:00-18:00, Sun 07:00-16:00',
  NULL, NULL,
  '["https://www.planetfitness.co.za/gyms/montana/", "https://www.kolonnadecentre.co.za/stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'planet-fitness-montana-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-montana-montana-gardens', 'Virgin Active Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  'Kolonnade Retail Park, Cnr Sefako Makgatho Drive & Enkeldoorn Avenue, Montana, Pretoria', '012 493 7215', 'https://virginactive.co.za/gyms/montana', NULL,
  'Virgin Active Montana is a branch of the Virgin Active gym chain, offering a heated lap pool, functional training equipment, cycling and yoga or pilates studios, a rowing area and Wattbike indoor training bikes. The club also runs Club-V, an access-controlled space for children aged six weeks to thirteen years, alongside its general adult gym floor and group fitness classes.

The club is based at Kolonnade Retail Park, on the corner of Sefako Makgatho Drive and Enkeldoorn Avenue in Montana, Pretoria. Alongside Planet Fitness in the neighbouring Kolonnade Shopping Centre, it gives Montana Gardens residents a second full-service gym option within the same immediate precinct, with swimming and childcare facilities as points of difference.',
  NULL,
  NULL, NULL,
  '["https://virginactive.co.za/gyms/montana", "https://za.africabz.com/gauteng/virgin-active-montana-80964", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394568"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-montana-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'home-kolonnade-montana-gardens', '@Home Kolonnade',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop U57/58, Kolonnade Shopping Centre, Sefako Makgatho Drive, Montana Park, Pretoria, 0159', '012 548 8100', NULL, NULL,
  '@Home Kolonnade is a branch of the @Home homeware chain, selling furniture, decor and household goods organised around the categories of eating, sleeping, bathing and cooking. The store offers a broad general-merchandise range rather than specialising in a single product type, from furnishings to kitchenware and bathroom accessories.

The branch trades from Shop U57/58 in Kolonnade Shopping Centre on Sefako Makgatho Drive in Montana Park, Pretoria, within the mall''s house-and-home retail section. For Montana Gardens residents, it provides a nearby option for home furnishing and decor purchases alongside the area''s other general retailers, without needing a trip to a stand-alone homeware store elsewhere in the city.',
  NULL,
  NULL, NULL,
  '["https://www.kolonnadecentre.co.za/stores/home", "https://www.jamii.co.za/home-kolonnade-centre-montana-park"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'home-kolonnade-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'masterparts-montana-montana-gardens', 'Masterparts (Montana)',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  '573 Breed Street, Montana, Pretoria, 0182', '012 630 0757', 'https://www.masterparts.com/branches/montana', NULL,
  'Masterparts Montana supplies motor vehicle parts and accessories for more than 2,500 vehicle models, covering popular makes including Volkswagen, BMW, Toyota, Audi, Hyundai, Mercedes-Benz and Isuzu among more than 80 brands in total. Its aftermarket parts are positioned as equivalent to dealership parts at lower prices, serving independent workshops and individual vehicle owners alike.

The branch trades from 573 Breed Street in Montana, Pretoria, open Monday to Friday from 08:00 to 17:00 and Saturday from 08:00 to 12:30, closed on Sundays. Its location places it within the Montana Gardens motor trade cluster on Breed Street, giving local workshops and motorists a nearby source for replacement parts across a wide range of vehicle makes.',
  'Mon-Fri 08:00-17:00, Sat 08:00-12:30, Sun Closed',
  NULL, NULL,
  '["https://www.cylex.net.za/company/masterparts-23883296.html", "https://www.sayellow.com/view/south-africa/masterparts-montana-in-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masterparts-montana-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'monta-nursery-montana-gardens', 'Monta Nursery',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  'Plot 25, Dr Swanepoel Road, Montana, Pretoria, 0182', '079 154 9995', NULL, NULL,
  'Monta Nursery is a plant nursery stocking a wide range of indoor and outdoor plants, including flowers, shrubs, bromeliads, ferns, succulents and impala lilies, along with pots and decorative pebbles. The nursery caters to home gardeners looking for a varied plant selection rather than a narrow specialist range.

It trades from Plot 25 on Dr Swanepoel Road in Montana, Pretoria, open Monday to Friday from 08:00 to 17:00, Saturday from 08:00 to 14:00 and Sunday from 09:00 to 13:00. Its location on Dr Swanepoel Road places it within easy reach of Montana Gardens residents looking for a local source of plants and garden supplies without travelling to a larger garden centre elsewhere in Pretoria.',
  'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun 09:00-13:00',
  NULL, NULL,
  '["https://yellowpages-af.cybo.com/ZA-biz/monta-nursery", "https://www.findglocal.com/ZA/Pretoria/279037431967992/Monta-Nursery", "https://www.facebook.com/p/Monta-Nursery-61559054860354/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monta-nursery-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-montana-montana-gardens', 'PostNet Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  'Shop 13, Montana Corner Centre, Cnr Dr Swanepoel Street & Sefako Makgatho Drive, Montana, Pretoria', '012 548 4748', 'https://postnet.co.za/stores/montana/5c69211455c8c661d10bea08', 'montana@postnet.co.za',
  'PostNet Montana is a branch of the PostNet franchise network, offering copying and printing services alongside courier and postal services for individuals and businesses. As part of a national chain, the branch follows PostNet''s standard range of print, pack-and-post and courier services rather than a locally defined offering.

The store trades from Shop 13 in Montana Corner Centre, on the corner of Dr Swanepoel Street and Sefako Makgatho Drive in Montana, Pretoria. It is open Monday to Friday from 08:00 to 18:00 and Saturday from 08:30 to 13:30, closed on Sundays and public holidays, giving Montana Gardens residents a nearby option for printing, copying and sending parcels.',
  'Mon-Fri 08:00-18:00, Sat 08:30-13:30, Sun Closed',
  NULL, NULL,
  '["https://postnet.co.za/stores/montana/5c69211455c8c661d10bea08", "https://za.africabz.com/gauteng/postnet-montana-43446", "https://www.africabizinfo.com/ZA/postnet-montana-012-548-4748"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-montana-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'gifted-leadership-academy-montana-gardens', 'Gifted Leadership Academy',
  (SELECT id FROM suburbs WHERE slug = 'montana-gardens'),
  '356 John Holland Street, Montana Gardens, Pretoria', '071 364 7901', NULL, NULL,
  'Gifted Leadership Academy is a learning support centre that helps children with reading and spelling challenges, using a Phono-Graphix reading programme built around phonemic awareness, decoding, vocabulary, fluency and comprehension. Its programmes include reading therapy and life-coaching style sessions intended to build both literacy skills and learner confidence, including a dedicated Grade R reading programme.

The academy is based on John Holland Street in Montana Gardens, Pretoria. It gives local families a nearby option for structured reading support outside of mainstream school programmes, working with learners individually to strengthen foundational reading skills rather than offering a full alternative schooling curriculum.',
  NULL,
  NULL, NULL,
  '["https://www.schoolandcollegelistings.com/ZA/Pretoria-Sp/101763582092820/Gifted-Leadership-Academy", "https://www.facebook.com/100068053800726/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gifted-leadership-academy-montana-gardens'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'barclay-square-pharmacy-barclay-square', 'Barclay Square Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'barclay-square'),
  (SELECT id FROM shopping_centers WHERE slug = 'barclay-square-shopping-centre-barclay-square'),
  'Shop 17, Barclay Square, 293 Rissik Street, Sunnyside, Pretoria, 0002', '072 298 7234', 'https://barclayspharmacy.co.za/', 'pharmacist@barclayspharmacy.co.za',
  'Barclay Square Pharmacy is a community pharmacy and part of the Kalapeng Pharmacies group, offering prescription dispensing, health screenings for blood pressure, glucose and cholesterol, and a primary healthcare clinic operating within the pharmacy. It also stocks GLS skincare products and offers weight-loss management support, and processes claims for all major medical aid schemes as a preferred DSP network supplier.

The pharmacy trades from Shop 17, Barclay Square, 293 Rissik Street, Sunnyside, Pretoria, open Monday to Friday from 08:00 to 18:00, Saturday from 08:00 to 14:00 and Sunday from 08:00 to 16:00. Based inside the Barclay Square shopping centre, it serves the surrounding Sunnyside community with everyday healthcare and medicine needs alongside its in-house clinic services.',
  'Mon-Fri 08:00-18:00, Sat 08:00-14:00, Sun 08:00-16:00',
  NULL, NULL,
  '["https://barclayspharmacy.co.za/", "https://www.cylex.net.za/company/barclay-square-pharmacy-cc-17431873.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barclay-square-pharmacy-barclay-square'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'crossmed-barclay-square', 'Crossmed',
  (SELECT id FROM suburbs WHERE slug = 'barclay-square'),
  (SELECT id FROM shopping_centers WHERE slug = 'barclay-square-shopping-centre-barclay-square'),
  'Shop G17A, Barclay Square, 296 Justice Mahomed Street, Sunnyside, Pretoria', '068 878 7664', 'https://www.crossmed.africa', NULL,
  'Crossmed is a private medical centre operating as a travel clinic, providing travel-related health services such as vaccinations and pre-travel medical consultations alongside general private healthcare consultations. It operates as part of a small group of Crossmed clinics based in South Africa, rather than as a single independent practice.

The Barclay Square branch trades from Shop G17A, Barclay Square, 296 Justice Mahomed Street, Sunnyside, Pretoria. Its location inside the shopping centre makes it a convenient stop for Sunnyside residents and travellers needing travel vaccinations, health certificates or related medical consultations, without having to seek out a specialist travel clinic elsewhere in the city.',
  NULL,
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/crossmed-pretoria", "https://za.africabz.com/gauteng/crossmed-568932", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=389944"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crossmed-barclay-square'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'noko-med-centre-barclay-square', 'Noko Med Centre',
  (SELECT id FROM suburbs WHERE slug = 'barclay-square'),
  (SELECT id FROM shopping_centers WHERE slug = 'barclay-square-shopping-centre-barclay-square'),
  'Shop G16, Barclay Square Shopping Centre, Cnr Rissik & Celliers Street, Sunnyside, Pretoria, 0002', '082 254 2334', NULL, NULL,
  'Noko Med Centre is a general medical practice offering everyday GP consultations to patients in the surrounding community. As a general practice, it is positioned for routine healthcare needs rather than operating as a specialised clinic, serving the Sunnyside area from within one of its established shopping centres.

The practice is based at Shop G16, Barclay Square Shopping Centre, on the corner of Rissik and Celliers Streets in Sunnyside, Pretoria. Its location inside Barclay Square gives Sunnyside residents and nearby office workers a general practitioner within walking distance of everyday shopping, rather than needing to travel to a stand-alone medical practice elsewhere in the city.',
  NULL,
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=417961", "https://www.africabizinfo.com/ZA/noko-med-center_2X-082-254-2334"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noko-med-centre-barclay-square'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'dr-m-bhikha-barclay-square', 'Dr M Bhikha',
  (SELECT id FROM suburbs WHERE slug = 'barclay-square'),
  (SELECT id FROM shopping_centers WHERE slug = 'barclay-square-shopping-centre-barclay-square'),
  'Suite 16, Ground Floor, Barclay Square, 293 Rissik Street, Sunnyside, Pretoria, 0002', '012 341 0142', NULL, NULL,
  'Dr M Bhikha is a general practitioner''s rooms offering everyday GP consultations, health check-ups and referrals to patients in the surrounding area. As a general practice, it handles routine healthcare needs rather than specialised treatment, serving patients from within the Barclay Square precinct in Sunnyside, Pretoria.

The practice is based at Suite 16, Ground Floor, Barclay Square, 293 Rissik Street, Sunnyside, Pretoria, 0002, and is classified under medical and dental practice activities. Its location inside the shopping centre gives Sunnyside residents a general practitioner within reach of their daily shopping and errands, rather than needing to travel elsewhere in Pretoria for routine medical consultations and ongoing care.',
  NULL,
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=person&personcode=87918", "https://www.africabizinfo.com/ZA/bhikha-m-012-341-0142"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-m-bhikha-barclay-square'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'tianu-s-place-kitchen-and-lounge-barclay-square', 'Tianu''s Place Kitchen & Lounge',
  (SELECT id FROM suburbs WHERE slug = 'barclay-square'),
  (SELECT id FROM shopping_centers WHERE slug = 'barclay-square-shopping-centre-barclay-square'),
  'Barclay Square Shopping Centre, 296 Justice Mahomed Street, Sunnyside, Pretoria, 0002', '082 345 7102', NULL, NULL,
  'Tianu''s Place Kitchen & Lounge is a bar-forward restaurant and lounge offering a breakfast-to-dinner menu of small plates alongside cocktails, spirits, beer and wine. The venue serves halal food options and operates as a casual, reservations-friendly space with an on-site bar, suited to both quick small-plate meals and a longer lounge visit.

It trades from Barclay Square Shopping Centre, 296 Justice Mahomed Street, Sunnyside, Pretoria, and offers dine-in, takeaway and delivery, along with free Wi-Fi and wheelchair-accessible parking and entrances. Positioned inside the Barclay Square precinct, it gives visitors to the centre a casual dining and drinks option alongside the mall''s other food and retail outlets.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/tianus-place-kitchen-amp-lounge", "https://yellowpages-af.cybo.com/ZA-biz/tianus-place-kitchen-lounge", "https://restaurantguru.com/Tianus-Place-Kitchen-and-Lounge-Pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tianu-s-place-kitchen-and-lounge-barclay-square'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
