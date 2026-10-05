-- Thin-page fill, Pretoria batch 9, checkpoint 3: Olympus (Heatherview stayed at 0, all 12 combos)
-- Note: a 6th candidate, "Oasis Water Pretoria | Faerie Glen (Olympus Plaza)",
-- was dropped before writing this file -- its address (108 Haymeadow
-- Crescent, Faerie Glen) is identical to the existing published business
-- oasis-water-pretoria-olympus-olympus-gardens-olympus, and one of its two
-- reported phone numbers (084 556 2554) exactly matches that existing
-- record's phone. Same branch recorded twice, not a second outlet.
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'olympus-plaza-olympus', 'Olympus Plaza',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  '108 Haymeadow Crescent, Faerie Glen, Pretoria, 0081', NULL, NULL,
  '["https://www.dischem.co.za/olympus-pharmacy", "https://pretoria.co.za/place/dis-chem-pharmacy-olympus-pretoria", "https://www.africabizinfo.com/ZA/pick-n-pay-mini-market-olympus_1a-012-991-1242"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-pharmacy-olympus-olympus', 'Dis-Chem Pharmacy Olympus',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  (SELECT id FROM shopping_centers WHERE slug = 'olympus-plaza-olympus'),
  'Shop 116, 108 Haymeadow Cres, Faerie Glen, Pretoria, 0043', '012 991 0044', NULL, 'olympusdispensary@dischem.co.za',
  'Dis-Chem Pharmacy Olympus is a branch of the South African retail pharmacy chain that has operated since 1978, combining a dispensary with a broader health, beauty and wellness offering. The store stocks pharmaceuticals, cosmetics, sport supplements and self-medication products alongside a linked dispensary, and also provides a wound-care clinic and general health clinic on site.

Located in the Olympus Plaza shopping centre on Haymeadow Crescent in the Faerie Glen area bordering Olympus, Pretoria East, the branch offers click-and-collect shopping, a hair salon and a beauty salon in addition to its pharmacy services. Customers can also arrange delivery of off-site orders through the store''s delivery service, and the dispensary can be reached separately for prescription queries by phone, SMS or WhatsApp.',
  'Mon-Fri 08:30-18:30, Sat 08:00-15:00, Sun 09:00-14:00', NULL, NULL,
  '["https://www.dischem.co.za/olympus-pharmacy", "https://pretoria.co.za/place/dis-chem-pharmacy-olympus-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-pharmacy-olympus-olympus'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-local-choice-pharmacy-olympus-olympus', 'The Local Choice Pharmacy Olympus',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  '948 Olympus Drive, Faerie Glen, Pretoria, 0081', '012 013 0500', 'thelocalchoice.co.za', 'olympus@thelocalchoice.co.za',
  'The Local Choice Pharmacy Olympus is a branch of the South African pharmacy and healthcare retail franchise, offering prescription dispensing, over-the-counter medicines and general health advice to walk-in customers. The branch positions itself as a convenient, everyday health stop for the surrounding community, with pharmacist-led advice forming part of its day-to-day service.

The store trades from Olympus Drive in the Faerie Glen area adjoining Olympus, Pretoria East, placing it within easy reach of several nearby residential estates. As with other branches in the franchise, it combines dispensary services with a retail front stocking everyday healthcare and wellness products, making it a routine stop for prescription collection and minor health needs for residents of the area.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/TheLocalChoiceOlympus/", "https://www.goafricaonline.com/za/1223225-the-local-choice-pharmacy-olympus"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-local-choice-pharmacy-olympus-olympus'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  '3-1-business-centre-olympus-village-olympus', '3@1 Business Centre Olympus Village',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  (SELECT id FROM shopping_centers WHERE slug = 'olympus-village-olympus'),
  'Shop 21, Olympus Village Shopping Centre, Cnr Olympus Drive & Achilles Road, Faerie Glen, Pretoria, 0081', '012 991 2010', '3at1olympus.co.za', 'olympus@3at1.co.za',
  '3@1 Business Centre Olympus Village is a branch of the South African print and business-services retail franchise, offering digital printing, large-format printing and photo services alongside courier, branding and corporate gifting. In-store facilities include colour and monochrome printing and copying, binding and finishing, canvas printing, and passport and ID photo printing, with artwork accepted by upload, email or in person.

The branch trades from a shop inside the Olympus Village Shopping Centre on the corner of Olympus Drive and Achilles Road in Faerie Glen, within the Olympus area of Pretoria East, and also handles domestic and international parcels through a courier partnership. It serves small businesses and home offices in the surrounding suburb, handling walk-in customers who need same-day printing, copying or courier drop-off without an appointment.',
  'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun Closed', NULL, NULL,
  '["https://3at1olympus.co.za/", "https://www.jamii.co.za/3-1-business-centre-olympus-village-olympus-ah"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '3-1-business-centre-olympus-village-olympus'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'piccoli-nursery-school-olympus', 'Piccoli Nursery School',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  '34.4 Ajax Street, Olympus, Pretoria, Gauteng, 0081', '012 999 3016', 'piccolinurseryschool.co.za', 'info@piccolinurseryschool.co.za',
  'Piccoli Nursery School, also known as Piccoli Kleuterskool, is a pre-primary school and nursery catering for toddlers and young children in a home-style setting. The school operates during weekday working hours and positions itself as a second home for young children in the area, offering early childhood care and development in both English and Afrikaans.

It is based on Ajax Street in Olympus, Pretoria East, in a location described as convenient for several surrounding estates and suburbs, including Mooikloof, Olympus Country Estate, Woodhill Estate, Broadwalk Meander, Garsfontein and Faerie Glen. The school''s weekday hours run from early morning to late afternoon, making it suited to working parents who need reliable day-time care and early learning for pre-school-aged children close to home.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/piccolinurseryschool/", "https://www.piccolinurseryschool.co.za/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'piccoli-nursery-school-olympus'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-mini-market-olympus-olympus', 'Pick n Pay Mini-Market (Olympus)',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  (SELECT id FROM shopping_centers WHERE slug = 'olympus-plaza-olympus'),
  '108 Haymeadow Cr, Olympus Plaza, Faerie Glen, Pretoria, 0081', '012 991 1242', NULL, NULL,
  'Pick n Pay Mini-Market Olympus is a small-format branch of the South African supermarket chain, stocking everyday groceries, fresh produce and household essentials in a convenience-sized store. The mini-market format is designed for quick, everyday shopping trips rather than large bulk purchases, fitting its position inside a smaller suburban shopping centre.

The store trades from Olympus Plaza on Haymeadow Crescent in the Faerie Glen area bordering Olympus, Pretoria East, sharing the centre with a pharmacy and other convenience retailers. Its location makes it a routine, walkable grocery stop for residents of the surrounding Olympus and Faerie Glen neighbourhoods who need top-up shopping without travelling to a larger supermarket.',
  NULL, NULL, NULL,
  '["https://www.africabizinfo.com/ZA/pick-n-pay-mini-market-olympus_1a-012-991-1242", "https://my-catalogue.co.za/stores/pretoria/pick-n-pay-supermarket/olympus-plaza-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-mini-market-olympus-olympus'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
