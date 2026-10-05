-- thin-pages pretoria batch 10, checkpoint 2: Groenkloof (6 businesses -- closes
-- beauty-hair-salons, dentists, doctors-gps to 3) and Waterkloof (8 businesses --
-- closes doctors-gps, hotels, supermarkets-groceries to 3)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'on-the-edge-living-hairdressing-groenkloof', 'On The Edge Living: Hairdressing',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  '70 Van Wouw Street, Groenkloof, Pretoria, 0181', '084 901 8888', NULL, NULL,
  'On The Edge Living: Hairdressing is a private hairdressing studio based on Van Wouw Street in Groenkloof, Pretoria. The salon operates from a dedicated, appointment-based space rather than a walk-in storefront, and combines hairdressing with elements of styling psychology and wellness coaching, positioning each session as a more considered, personal experience than a standard cut-and-colour visit.

The salon has built a strong reputation locally, reflected in dozens of client reviews and a high average rating on hair-salon directories. Its Groenkloof location places it in a quiet, established residential part of Pretoria, making it a draw for clients seeking a smaller, appointment-driven studio rather than a high-turnover chain salon.',
  '["https://www.hairsalonspretoria.co.za", "https://www.africabizinfo.com", "https://www.beautynailhairsalons.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'on-the-edge-living-hairdressing-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'spectrum-hair-salon-groenkloof', 'Spectrum Hair Salon',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'groenkloof-plaza-groenkloof'),
  'Shop 7, Groenkloof Plaza, George Storrar Drive, Groenkloof, Pretoria, 0181', '012 346 0129', NULL, NULL,
  'Spectrum Hair Salon is a hairdressing salon trading from Shop 7 in Groenkloof Plaza, also referenced at 45 George Storrar Drive, in Groenkloof, Pretoria. The salon offers a full range of haircare services and has built its client base around styling expertise across different hair types and textures, including both straight and curly hair, drawing a broad mix of local customers.

Operating from within the Groenkloof Plaza shopping centre gives the salon an accessible, suburb-centred location alongside the centre''s supermarket and other retail tenants. It has accumulated a solid base of client reviews and a strong average rating across several local hair-salon directories, reflecting an established presence in the Groenkloof community and making it a regular choice for residents who want a nearby, suburb-based salon.',
  '["https://www.hairsalonspretoria.co.za", "https://www.beautynailhairsalons.com", "https://www.facebook.com/p/Groenkloof-Spectrum-Hair-Salon"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spectrum-hair-salon-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'life-groenkloof-hospital-groenkloof', 'Life Groenkloof Hospital',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  '50 George Storrar Drive, Groenkloof, Pretoria, 0181', '+27 12 424 3600', 'https://www.lifehealthcare.co.za', NULL,
  'Life Groenkloof Hospital is a 214-bed private hospital situated on George Storrar Drive in the leafy suburb of Groenkloof, Pretoria. Part of the Life Healthcare group, the hospital is particularly recognised for its specialised orthopaedic centre and the treatment of sports injuries, alongside a broader range of general hospital services delivered by resident doctors and clinical staff.

The hospital anchors a small medical precinct in Groenkloof, with consulting suites, a pharmacy and visiting specialists operating from the same site. Its location in a quiet, established residential suburb close to the Groenkloof Plaza shopping centre makes it a long-standing reference point for healthcare in the area.',
  '["https://www.lifehealthcare.co.za", "https://za.africabz.com", "https://www.mymedicalaid.co.za", "https://www.saprivatehospitals.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'life-groenkloof-hospital-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

-- NOTE: a candidate "SmileSolutions" (dentists/groenkloof) was dropped here after validate.mjs
-- flagged its phone 012 346 3588 as already belonging to the existing "Groenkloof Dentist"
-- listing -- i.e. it is the same practice under a different trading name, not a new business.
-- dentists/groenkloof therefore stays at 2 of 3 (existing Groenkloof Dentist + The Home of
-- Biological Dentistry below), not closed, contrary to the sub-agents' initial read.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'the-home-of-biological-dentistry-groenkloof', 'The Home of Biological Dentistry',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  '101 George Storrar Drive, Groenkloof, Pretoria, 0181', '012 346 5615', NULL, NULL,
  'The Home of Biological Dentistry is a dental practice based on George Storrar Drive in Groenkloof, Pretoria. The practice describes itself as biologically minded, with its team focused on an approach to dentistry that considers the wider health implications of dental materials and treatment choices rather than purely cosmetic or restorative outcomes, treating each patient''s dental work as part of their overall health.

Located in the same George Storrar Drive medical corridor as several other Groenkloof healthcare providers, the practice has built a strong online following and a high average review rating across multiple directories. It serves patients looking specifically for a biologically focused alternative to conventional general dentistry in the Groenkloof area, consistently appearing under the suburb''s dental listings.',
  '["https://www.dentists10.com", "https://www.findglocal.com", "https://www.africabizinfo.com", "https://www.facebook.com/BiologicalDentistrySouthAfrica"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-home-of-biological-dentistry-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'dr-jacques-viljoen-groenkloof', 'Dr Jacques Viljoen',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  '2nd Floor, Admin Building, Life Groenkloof Hospital, 50 George Storrar Drive, Groenkloof, Pretoria, 0181', '012 346 5253', NULL, NULL,
  'This practice is an ear, nose and throat (ENT) specialist consulting room based on the second floor of the admin building at Life Groenkloof Hospital, 50 George Storrar Drive, Groenkloof, Pretoria. Operating from within the hospital complex, the practice treats a full range of ENT conditions and has access to the hospital''s theatres and diagnostic facilities for patients who need surgical or specialist investigation.

Being located inside Life Groenkloof Hospital gives the practice a central position within Groenkloof''s main medical precinct, close to the hospital''s pharmacy, other specialist suites and the Groenkloof Plaza shopping centre across the road. It is listed consistently across several South African medical and business directories under the Groenkloof healthcare category.',
  '["https://www.lifehealthcare.co.za", "https://www.zah.co.za", "https://www.cylex.net.za", "https://www.africabizinfo.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-jacques-viljoen-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

-- NOTE: a candidate "MedCentre Waterkloof" (clinics-healthcare/waterkloof) was dropped here.
-- It shares the exact same address (265 Main Street, Waterkloof) AND phone number
-- (065 559 5412 / +27 65 559 5412) as "Medify" below -- both sub-agents flagged this as a
-- shared front-desk line in a multi-tenant medical building. validate.mjs enforces one phone
-- per business across the whole city, so only one of the two could be published; Medify was
-- kept because it closes doctors-gps/waterkloof to 3, while clinics-healthcare/waterkloof
-- stays short (0 of 2) rather than risk two listings that may be indistinguishable by phone.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'dr-nelson-fernandes-waterkloof', 'Dr Nelson Fernandes',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  'Unit 6, Forum Building, 374 Milner Street, Waterkloof, Pretoria, 0181', '012 460 6206', 'https://www.prosthodontist.net.za', NULL,
  'This practice is a prosthodontics and cosmetic dentistry practice based in Unit 6 of the Forum Building on Milner Street in Waterkloof, Pretoria. The practice specialises in restorative and rehabilitative dental care, focusing on the preservation, rebuilding and replacement of teeth through carefully planned treatment, alongside cosmetic services such as in-chair and take-home teeth whitening.

Operating from the Waterkloof Forum Building, the practice offers a private, purpose-designed dental environment rather than a general walk-in surgery. It has built a strong review record online, with a high average rating from a solid base of patient reviews, and is consistently listed across medical and business directories under the Waterkloof suburb.',
  '["https://www.prosthodontist.net.za", "https://www.africabz.com", "https://www.goafricaonline.com", "https://www.africabizinfo.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-nelson-fernandes-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'reflexion-medi-spa-waterkloof', 'Reflexion Medi Spa',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '294 Milner Street, Waterkloof, Pretoria, 0181', '012 460 4958', NULL, NULL,
  'Reflexion Medi Spa is a general medical and aesthetic practice based on Milner Street in Waterkloof, Pretoria. The practice is registered as a general medical practice and integrates general healthcare with aesthetic medicine, describing its approach as bringing together art, aesthetics and medical science for patients seeking both everyday medical care and cosmetic treatments.

Based in a dedicated consulting space in Waterkloof, the practice has built a loyal local following, reflected in its social media presence and consistent listings across South African medical directories under the general practitioner category. Its Milner Street address places it within walking distance of several other medical practices in the same part of Waterkloof.',
  '["https://www.dnalysis.co.za", "https://www.instagram.com/drheidisiebert", "https://www.facebook.com/DrHeidiSiebert", "https://medpages.info"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'reflexion-medi-spa-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'medify-waterkloof', 'Medify',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '265 Main Street, Waterkloof, Pretoria', '+27 65 559 5412', 'https://www.themedify.com', NULL,
  'Medify is a general medical practice based at 265 Main Street in Waterkloof, Pretoria, operating from the same multi-disciplinary medical building as several other independent healthcare providers. The practice focuses on medical weight management, peptide medicine, facial aesthetics, IV therapy and general consultations, combining everyday general practice care with a specific interest in aesthetic and weight-management medicine.

The practice has built a strong review record, with a high average rating drawn from several hundred verified patient reviews. Its Waterkloof location, in a purpose-built medical facility on Main Street, gives patients access to on-site consultation rooms with set weekday and Saturday-morning hours.',
  'Mon-Fri 08:00-17:00, Sat 08:00-12:00, Sun Closed',
  '["https://www.themedify.com", "https://www.drluhard.com", "https://www.fresha.com", "https://medpages.info"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medify-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'rococo-fashion-boutique-waterkloof', 'Rococo Fashion Boutique',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  'Shop 9, Waterkloof Corner Centre, Waterkloof, Pretoria, 0181', '012 435 8782', 'https://www.rococo.co.za', NULL,
  'Rococo Fashion Boutique is a fashion boutique trading from Shop 9 in the Waterkloof Corner Centre in Waterkloof, Pretoria. The boutique caters to women''s fashion and stocks a range of established clothing and accessory brands, alongside its own in-house design and manufacture of evening and bridal gowns for customers wanting a more occasion-specific wardrobe.

Operating from within the Waterkloof Corner Centre gives the boutique a convenient, suburb-centred location alongside the centre''s other retail tenants. It has built a long-standing presence in Waterkloof as a specialist fashion destination, distinguishing itself from general clothing retailers through its focus on more formal and occasion-specific womenswear, and is listed consistently across several local business directories.',
  '["https://www.findglocal.com", "https://www.cybo.com", "https://www.worldplaces.me"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rococo-fashion-boutique-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'royal-albert-suites-waterkloof', 'Royal Albert Suites',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '433 Albert Street, Waterkloof, Pretoria, 0181', '012 346 1989', 'https://www.rassuites.co.za', NULL,
  'Royal Albert Suites is a guesthouse offering furnished, self-catering accommodation at 433 Albert Street in Waterkloof, Pretoria. The property is geared toward both business and leisure travellers as well as longer-term guests such as students and young professionals, with suites that are partially self-catering and designed for extended stays rather than a single overnight visit.

Its Waterkloof location places it within easy reach of the city''s universities and Pretoria''s business district, while still offering a quiet, residential setting away from the busier parts of the city. The property has built a strong guest rating from a substantial base of reviews, reflecting its position as an established mid-range accommodation option in the suburb.',
  '["https://www.rassuites.co.za", "https://www.africabizinfo.com", "https://www.facebook.com/Royalalbertsuites"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royal-albert-suites-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'kloofyard-guesthouse-waterkloof', 'Kloofyard Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '345 Julius Jeppe Street, Waterkloof, Pretoria', '064 479 7199', 'https://www.kloofyard.co.za', NULL,
  'Kloofyard Guesthouse is a guesthouse located on Julius Jeppe Street in Waterkloof, Pretoria, offering accommodation with a year-round outdoor swimming pool and garden setting. The property is positioned in a safe, quiet residential part of Waterkloof, with tree-lined streets and easy access to nearby restaurants, shopping centres and nature reserves.

Guests have highlighted the attentiveness of on-site staff and the overall condition of the rooms and facilities in their reviews. Its Waterkloof address puts it within a short drive of Pretoria''s Country Club and the Waterkloof Shopping Centre, making it a convenient base for both leisure visitors and those attending to business in the surrounding suburbs.',
  '["https://www.booking.com", "https://www.com-gauteng.com", "https://www.planetofhotels.com", "https://www.trip.com"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kloofyard-guesthouse-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'happy-mamma-s-waterkloof', 'Happy Mamma''s',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '12 Dam Road, Waterkloof, Pretoria, 0145', '065 667 9473', NULL, NULL,
  'Happy Mamma''s is a neighbourhood grocery store based on Dam Road in Waterkloof, Pretoria, stocking fresh produce, pantry staples and deli specialties for everyday household shopping. The store positions itself as a smaller, community-focused alternative to larger supermarket chains, with an emphasis on friendly, personal service for regular, everyday shoppers in the surrounding streets.

Alongside in-store shopping, Happy Mamma''s offers home delivery of groceries, advertising discounts across several hundred different products ranging from baby items to cleaning supplies. The store is open from 8am to 8pm, Monday to Saturday, giving Waterkloof residents an extended-hours option for everyday grocery needs close to home without a trip to a larger supermarket.',
  'Mon-Sat 08:00-20:00, Sun Closed',
  '["https://pretoria.co.za", "https://www.africabizinfo.com", "https://www.facebook.com/happymammasgroceries"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'happy-mamma-s-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
