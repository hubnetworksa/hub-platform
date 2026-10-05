INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'smile-dental-care-brooklyn', 'Smile Dental Care',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '92 Stella St, Brooklyn, Pretoria, 0181', '072 580 6122', NULL, NULL,
  'Smile Dental Care is a general dental practice offering a full range of family dentistry, from routine exams and cleanings to teeth whitening, dental implants and bridges, and clear aligner treatment. The practice also handles emergency dentistry and children''s dentistry, along with checks for bad breath and bleeding gums, and the team works to keep appointments quick and the atmosphere calm for patients who feel anxious about visiting the dentist.

The practice is based on Stella Street in Brooklyn, Pretoria, and is open on weekdays from early morning to mid-afternoon, Monday to Friday. It suits families and individuals looking for a straightforward dental practice in the Brooklyn area for both routine care and same-day concerns, without the wait times of a larger clinic.',
  NULL, NULL,
  '["https://www.leadstal.com/sb/smile-dental-care-brooklyn", "https://d7leadfinder.com/app/prospector/2564652/f077249665341b4e982a130ce255318b/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smile-dental-care-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crawdaddy-s-brooklyn', 'Crawdaddy''s',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '02 Brooklyn Piazza, Middel St, Brooklyn, Pretoria, 0145', '012 460 0889', 'https://crawdaddys.co.za', NULL,
  'Crawdaddy''s is a seafood restaurant known for fresh seafood platters alongside South African steaks, serving a casual sit-down menu through lunch and dinner. The kitchen runs a full week''s service rather than limited days, and the restaurant draws a mix of regulars and visitors who come specifically for its seafood reputation rather than a quick bite.

The Brooklyn branch trades from a spot in Brooklyn Piazza on Middel Street, an outdoor dining and lifestyle precinct in Pretoria''s Brooklyn area, open daily from 11am to 10pm. It suits anyone after a proper sit-down seafood meal or a steak in a relaxed restaurant setting rather than a takeaway order, and the piazza location makes it an easy stop before or after visiting the other venues nearby.',
  NULL, NULL,
  '["https://crawdaddys.co.za", "https://kupi.com/en-ae/explore/south-africa/pretoria/crawdaddys-brooklyn"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crawdaddy-s-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
