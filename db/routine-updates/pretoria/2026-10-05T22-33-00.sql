INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'carbon-cleaning-innovation-monument-park', 'Carbon Cleaning Innovation',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  '28 Solomon Mahlangu Drive, Monument Park, Pretoria', '012 004 8015', 'https://ccinnovation.co.za/', NULL,
  'Carbon Cleaning Innovation is a HaynesPro-certified vehicle workshop based in Monument Park, Pretoria, offering general servicing alongside specialist carbon and emissions work. The workshop handles engine diagnostics, brake and suspension repairs, cooling system work, and gearbox and transmission repairs, working through a fault methodically before replacing parts.

Its specialist side covers carbon cleaning using walnut blasting to clear deposits from intake valves and ports, HHO decarbonising for petrol and diesel engines without an engine strip-down, and diesel particulate filter cleaning and removal for vehicles where a clogged filter is affecting performance. The workshop also offers ECU programming for engine calibration, DSG gearbox repairs for harsh gear changes and clutch judder, air-conditioning servicing including regassing and leak detection, and injector cleaning with each injector tested individually. Carbon Cleaning Innovation is located at 28 Solomon Mahlangu Drive in Monument Park.',
  NULL,
  NULL, NULL,
  '["https://ccinnovation.co.za/","https://yellowpages-af.cybo.com/ZA-biz/carbon-cleaning-innovation"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carbon-cleaning-innovation-monument-park'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'monumed-monument-park', 'Monumed',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  'Monument Park Shopping Centre, 73 Skilpad Street, Monument Park, Pretoria, 0180', '012 346 5935', 'http://www.monumed.co.za/', NULL,
  'Monumed is a general medical practice based in the Monument Park Shopping Centre on Skilpad Street in Monument Park, Pretoria. It is a family-run practice offering general health care to patients of all ages, with both a male and a female doctor seeing patients so people can choose whichever they are most comfortable discussing their health concerns with.

Alongside routine general practice consultations, the practice assists with training, conditioning, nutrition and injury-related concerns, drawing on experience in sports medicine, and offers a range of non-surgical aesthetic treatments aimed at reducing fine lines and wrinkles. It also runs periodic patient information sessions on topics such as menopause, bone density, testosterone and vitamin D. Monumed is open Monday to Thursday from 08:00 to 17:00, Friday from 08:00 to 16:00, and Saturday mornings from 08:00 to 12:00.',
  'Mon-Thu 08:00-17:00, Fri 08:00-16:00, Sat 08:00-12:00, Sun Closed',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=372160","https://www.findhealthclinics.org/ZA/Pretoria/1898821310401101/Monumed","https://monumentparkshoppingcenter.co.za/monumed-medical-doctors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monumed-monument-park'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'dr-peter-benninghoff-monument-park', 'Dr. Peter Benninghoff',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  '51 Impala Road, Monument Park, Pretoria, 0181', '012 460 7268', NULL, NULL,
  'Dr. Peter Benninghoff is a general practice offering medical consultations from premises at 51 Impala Road in Monument Park, Pretoria. The practice is listed among the general practitioners serving the Monument Park area and provides primary health care consultations to patients from the surrounding suburb and the greater Pretoria area.

Operating as a standalone general practice rather than part of a larger medical centre, it handles everyday consultations and check-ups for local patients. It is one of a small number of general practitioners based directly in Monument Park, giving residents a general medical consultation option within the suburb itself rather than having to travel to a larger practice or hospital elsewhere in Pretoria.',
  NULL,
  NULL, NULL,
  '["https://www.cylex.net.za/pretoria/monument-park/doctor.html","https://za.africabz.com/gauteng/dr-peter-benninghoff-418583","https://www.medpages.info/sf/index.php?page=organisation&orgcode=36571"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-peter-benninghoff-monument-park'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'sasol-dastek-monument-park', 'Sasol Dastek',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  'Veldpou Street, Monument Park, Pretoria', '012 347 1110', 'https://www.sasol.co.za', NULL,
  'Sasol Dastek is a 24-hour fuel station on Veldpou Street in Monument Park, Pretoria, operating under the Sasol brand and trading as the Dastek branch of the network. Alongside fuel and diesel, the station functions as a multi-service stop, combining a convenience store, a bakery and a coffee shop on the same forecourt.

Open around the clock every day of the week, the station serves both passing traffic and the surrounding Monument Park area at any hour of the day or night. Its forecourt offers standard fuel and diesel supply alongside the attached convenience store, giving customers in Monument Park a single stop for fuel, a bakery item or coffee, and everyday convenience shopping without needing to travel further into Pretoria.',
  'Open 24 hours',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/sasol-dastek-653980","https://www.africabizinfo.com/ZA/sasol-dastek-012-347-1110"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sasol-dastek-monument-park'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'animal-antics-monument-park', 'Animal Antics',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  'Shop 41, Monument Park Shopping Centre, 79 Skilpad Road, Monument Park, Pretoria', '012 435 8843', 'https://www.animalanticsvetshop.co.za', 'animalantics.vetshop@gmail.com',
  'Animal Antics is a pet supply retailer trading from Shop 41 in the Monument Park Shopping Centre on Skilpad Road, Monument Park, Pretoria. The shop sells pet-related products and supplies to the local community, operating as part of the shopping centre''s retail line-up alongside tenants such as a pharmacy and other service outlets.

The shop keeps extended trading hours across the week, opening Monday to Friday, Saturday afternoons and Sunday mornings, which makes it a convenient stop for pet owners combining a visit with other shopping at the centre. It is one of the specialist retailers at Monument Park Shopping Centre, which also includes a pharmacy, a water retailer and several personal-care and food outlets.',
  'Mon-Fri 08:30-18:00, Sat 08:30-15:00, Sun 09:00-13:00',
  NULL, NULL,
  '["https://monumentparkshoppingcenter.co.za/animal-antics/","https://www.africabizinfo.com/ZA/animal-antics_1c-012-435-8843","https://www.findglocal.com/ZA/Pretoria/1749627945295045/Animal-Antics"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'animal-antics-monument-park'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'green-it-solutions-monument-park', 'Green IT Solutions',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  '532 Volstruis Street, Monument Park, Pretoria, 0181', '083 535 6474', NULL, 'greenitsolutions@mweb.co.za',
  'Green IT Solutions is a computer services provider based at 532 Volstruis Street in Monument Park, Pretoria. The business handles computer repairs and maintenance along with the sale of computer hardware and software to home and business customers in the Monument Park area and the wider Pretoria region.

Beyond repairs and sales, Green IT Solutions installs hardware and sets up home and office networking, helping customers get new equipment connected and working together properly. It also assists with internet solutions, covering the connectivity side of a home or office setup alongside the hardware itself. The business operates from its Monument Park premises during normal weekday business hours, giving local residents and small businesses a computer repair and support option within the suburb itself.',
  NULL,
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/1485579751700224/Green-It-Solutions","https://www.facebook.com/greenitservices/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'green-it-solutions-monument-park'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

