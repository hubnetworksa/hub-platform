-- thin-pages pretoria batch 11, checkpoint 2: Zwavelpoort (10 businesses)
-- (group2 of parallel verification: accommodation (partial), clinics-healthcare,
-- convenience-stores (partial), events-function-venues, general-retail,
-- schools-education, wedding-services)

-- Accommodation, Zwavelpoort (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'zwavelpoort-guesthouse-zwavelpoort', 'Zwavelpoort Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 260 Zwavelpoort St, Pretoria, 0081', '082 374 4676', 'https://zwavelpoortguesthouse.co.za', NULL,
  'Zwavelpoort Guesthouse is a self-catering guesthouse at Plot 260 Zwavelpoort St in Zwavelpoort, east of Pretoria. The property offers two rooms sharing one large living room, a terrace with braai facilities, a fully equipped kitchen and a private garden for guests to relax in.

Guests have access to a swimming pool, air-conditioned rooms, a bonfire pit and DSTV, along with free Wi-Fi, free parking and breakfast included in the stay. The guesthouse welcomes both pets and children, making it suited to families and guests travelling with animals who want a quiet, self-catering retreat tucked away in the east of Pretoria.',
  NULL,
  NULL, NULL,
  '["https://zwavelpoortguesthouse.co.za/", "https://pretoria.co.za/place/zwavelpoort-guesthouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zwavelpoort-guesthouse-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

-- Convenience Stores, Zwavelpoort (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'savemor-star-trading-zwavelpoort', 'Savemor Star Trading',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Shop A1, Eastridge Building & Design Centre, Graham Rd, Zwavelpoort, Pretoria', '012 817 2119', 'https://www.spar.co.za/Home/Store-View/Savemor-Star-Trading-Savemor-Gauteng', NULL,
  'Savemor Star Trading, trading as SPAR SaveMor Bronberg, is a full-service SPAR supermarket at Shop A1 in the Eastridge Building & Design Centre on Graham Road in Zwavelpoort. The store stocks fresh meat, vegetables and a general discount grocery range, serving as the everyday convenience store for the Zwavelpoort area.

Reviews describe it as a smaller, local store with a loyal following, noting it has received recognition as an award-winning branch over the years it has traded in the area. Savemor Star Trading is open seven days a week, giving residents of Zwavelpoort a nearby stop for everyday groceries and essentials without needing to travel further into Pretoria for a full grocery shop.',
  'Mon-Sat 07:00-19:00, Sun 07:00-15:30',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/star-trading-235898", "https://nearfinderza.com/en/business/gp/pretoria/supermarkets/savemor-star-trading_602225+4.html", "https://my-catalogue.co.za/stores/zwavelpoort/spar/eastridge-building-design-centre-graham-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'savemor-star-trading-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

-- Clinics & Healthcare, Zwavelpoort (closes combo: 1/1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'unjani-clinic-zwavelpoort-zwavelpoort', 'Unjani Clinic Zwavelpoort',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 214, Kungwini Welfare Organisation, Graham Road, Zwavelpoort, Pretoria, 0036', '061 262 1550', 'http://www.unjaniclinic.co.za', NULL,
  'Unjani Clinic Zwavelpoort is a primary healthcare clinic at Plot 214 on Graham Road in Zwavelpoort, part of the Unjani Clinic franchise network and operating from the Kungwini Welfare Organisation premises. The clinic positions itself as offering quality, affordable private healthcare to the local community it serves.

The clinic operates on an appointment basis and includes a private nursing room for consultations, and has also offered seasonal services such as flu vaccinations and vitamin injections to patients. Unjani Clinic Zwavelpoort is open Monday to Saturday, giving residents of Zwavelpoort and the surrounding area access to local primary healthcare without travelling further into Pretoria.',
  'Mon-Fri 08:00-17:00, Sat 09:00-13:00',
  NULL, NULL,
  '["https://pretoria.co.za/place/unjani-clinic-zwavelpoort", "https://www.findhealthclinics.org/ZA/Pretoria/198986463307987/unjani-clinic-zwavelpoort"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'unjani-clinic-zwavelpoort-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

-- Events & Function Venues, Zwavelpoort (closes combo: 1/1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'riverside-bush-boma-zwavelpoort', 'Riverside Bush Boma',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Zwavelpoort St, Pretoria', '072 074 9809', NULL, 'bushboma@gmail.com',
  'Riverside Bush Boma is a bush-boma-style function venue on Zwavelpoort St in Pretoria, with a stage for live entertainment, a braai area and a private lapa for both indoor and outdoor use. The venue can accommodate between 20 and 150 guests at a time.

The venue has hosted birthdays, weddings, family gatherings and student functions, and offers tented overnight camping with proper bathrooms, furniture and bedding for guests wanting to stay over. Riverside Bush Boma has built up a local following over several years of reviews, serving as a function and event venue for groups across the greater Zwavelpoort and Pretoria area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/riverside-bush-boma", "https://www.africabizinfo.com/ZA/riverside-bush-boma-072-074-9809", "https://za.africabz.com/gauteng/riverside-bush-boma-167443"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'riverside-bush-boma-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

-- General Retail, Zwavelpoort (closes combo: 2/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'farm-barn-zwavelpoort', 'Farm Barn',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 1 Graham Road, Zwavelpoort, Pretoria, 0081', '012 817 2108', 'http://www.thefarmbarn.co.za', NULL,
  'Farm Barn is a farm products and animal feed distributor at Plot 1 Graham Road in Zwavelpoort, describing itself as the leading supplier of its kind in the east of Pretoria. The store stocks feed for horses, dogs, cats, poultry and other farm animals, along with tack, leather care gear, veterinary health essentials and farm tools.

Farm Barn also runs an on-site coffee shop serving coffee, biltong and farm goods, and has built a reputation within the local equine community over a number of years. The store serves customers across Zwavelpoort and the wider Pretoria East area looking for animal feed, farm supplies or equestrian products.',
  'Mon-Fri 08:00-17:30, Sat 08:00-13:00',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/432243793834238/Farm-Barn", "https://a-better-place.com/SA/the-farm-barn-i318693/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'farm-barn-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'blyfontein-kwekery-nursery-farm-zwavelpoort', 'Blyfontein Kwekery / Nursery Farm',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 398, Grahame Road, Zwavelpoort, Pretoria, 0036', '082 600 7776', NULL, 'pine@kleinfontein.net',
  'Blyfontein Kwekery, also known as Blyfontein Nursery Farm, is a plant nursery and garden centre on Grahame Road in Zwavelpoort, the main road running through the suburb. The business is listed in local directories under the Garden Centre category and the Plant Nurseries & Garden Centres keyword grouping.

Blyfontein Kwekery can be reached by phone or email for enquiries about its plant and garden stock, and keeps regular trading hours from Monday to Saturday, closing on Sundays. The nursery serves gardeners and residents across Zwavelpoort and the surrounding Pretoria East area looking for plants, seedlings and other garden centre supplies.',
  'Mon-Fri 08:00-16:00, Sat 08:00-17:00, Sun Closed',
  NULL, NULL,
  '["https://firmania.co.za/pretoria/blyfontein-kwekery-nursery-farm-219111", "https://www.cylex.net.za/company/blyfontein-kwekery---nursery-farm-23878708.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blyfontein-kwekery-nursery-farm-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

-- Schools & Education, Zwavelpoort (closes combo: 2/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'laerskool-presda-zwavelpoort', 'Laerskool Presda',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 91 Saints St, Zwavelpoort, Pretoria East', '012 996 1629', 'https://www.presdaps.co.za', 'admin@presdaps.co.za',
  'Laerskool Presda is an independent, fee-paying Afrikaans-medium primary school at Plot 91 Saints St in Zwavelpoort, Pretoria East. The school falls under the City of Tshwane Metropolitan Municipality and uses a postal address in nearby Garsfontein for its correspondence.

According to a 2023 survey, the school had a total population of 75 learners served by a dedicated team of 8 educators, giving it a student-teacher ratio of 9:1. Laerskool Presda can be contacted by phone or email for admissions and other enquiries, and serves families across Zwavelpoort and the wider Pretoria East area looking for an independent primary school for their children.',
  NULL,
  NULL, NULL,
  '["https://www.presdaps.co.za/contact-us.html", "https://schoolsdigest.co.za/listings/laerskool-presda/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'laerskool-presda-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'montessori-academy-and-college-zwavelpoort', 'Montessori Academy and College',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 84, Eastview Street, Zwavelpoort, Pretoria, 0036', '012 996 3312', 'https://www.montessori.za.com', 'admin@montessori.za.com',
  'Montessori Academy and College is an independent combined school at Plot 84, Eastview Street in Zwavelpoort, Pretoria, using the Montessori method from preschool through to further grades. The school is listed as a college, Montessori school and preschool in local business directories.

According to a 2023 survey, the school had a total population of 97 learners served by a dedicated team of 20 educators, giving it a student-teacher ratio of 5:1. Montessori Academy and College can be contacted by phone or email for admissions enquiries, and serves families across Zwavelpoort and the wider Pretoria area looking for a Montessori-method school.',
  'Mon-Thu 07:30-15:00, Fri 07:30-13:00',
  NULL, NULL,
  '["https://www.montessori.za.com/contact", "https://schoolsdigest.co.za/listings/montessori-academy-and-college/", "https://www.yellowpages.net.za/phone-27-129963312-college-Pretoria-ZA288304.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'montessori-academy-and-college-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

-- Wedding Services, Zwavelpoort (closes combo: 2/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'riverside-castle-zwavelpoort', 'Riverside Castle',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 204, Graham Road (extension of Lynnwood Road), Zwavelpoort, Pretoria East', '012 809 2676', 'https://www.riversidecastle.co.za', 'info@riversidecastle.co.za',
  'Riverside Castle is a castle-themed wedding and event venue at Plot 204 on Graham Road, an extension of Lynnwood Road, in Zwavelpoort, Pretoria East, where the Highveld meets the Bushveld between the Bronberg and Zwavelpoort Spruit. The venue includes a chapel, a medieval reception hall and additional venues and event facilities.

Riverside Castle hosts weddings, conferences and other events, with buffet catering available and full wedding-day coordination offered as part of its service to clients. The venue serves couples and event organisers across Zwavelpoort and the wider Pretoria East area looking for a themed, indoor-outdoor function venue for their celebration.',
  'Mon-Fri 09:00-17:00, Sat 09:00-12:00',
  NULL, NULL,
  '["https://www.riversidecastle.co.za/contact-us", "https://za.africabz.com/gauteng/riverside-castle-13793"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'riverside-castle-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'god-s-gift-events-zwavelpoort', 'God''s Gift Events',
  (SELECT id FROM suburbs WHERE slug = 'zwavelpoort'),
  'Plot 402 Graham Road, Zwavelpoort, Pretoria, 0081', '082 773 9033', 'https://www.godsgiftevents.com', 'godsgiftevents@gmail.com',
  'God''s Gift Events, also operating as The Picnic Spot ZA, is a forest wedding and event venue at Plot 402 Graham Road in Zwavelpoort, Pretoria, set beneath towering bluegum trees. The venue is also categorised as an outdoor equestrian facility and picnic ground by local directories.

The venue offers forest weddings, gourmet picnics, soiree celebrations, high teas and kitchen teas, along with elopement packages and fully inclusive wedding packages for couples planning a celebration at the property. God''s Gift Events serves couples and groups across Zwavelpoort and the wider Pretoria area looking for an outdoor, forest-set venue for weddings and other celebrations throughout the year.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/gods-gift-events-082-773-9033", "https://za.africabz.com/gauteng/gods-gift-events-inc-the-picnic-spot-403497", "https://www.godsgiftevents.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'god-s-gift-events-zwavelpoort'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);
