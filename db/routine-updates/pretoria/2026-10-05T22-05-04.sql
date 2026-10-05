-- thin-pages pretoria batch-01: checkpoint 1 (Erasmuskloof, 2 of several combos)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'peak-centre-erasmuskloof', 'PEAK Centre',
  (SELECT id FROM suburbs WHERE slug = 'erasmuskloof'),
  '501 Jochemus St, Erasmuskloof, Pretoria, 0048', '083 445 1982', 'https://peakcentre.co.za/', 'info@drmarceljooste.co.za',
  'PEAK Centre is a multidisciplinary health, wellness and performance practice based in Erasmuskloof, Pretoria, in the Wolwespruit Trail Park area next to Kloof Medi-Clinic. It brings together specialists in sport and exercise medicine, sport dietetics, performance psychology, biokinetics, and sport science, massage and recovery.

Its sport and exercise medicine service covers injury diagnosis, medical care for active individuals, lifestyle intervention programmes and race preparation. The dietetics practice offers nutritional assessments, individualised meal plans, body composition analysis and group education sessions. Counselling and performance psychology sessions address trauma, anxiety, self-esteem and adjustment difficulties alongside performance work for athletes and corporate groups. The biokinetics team provides orthopaedic rehabilitation, medical aid programmes, cardiac and stroke rehabilitation, posture correction and performance testing, while the sport science division offers sports massage, myofascial release, compression therapy and strength and conditioning coaching.

The practice positions itself as a long-term partner in health and performance rather than a once-off treatment, for competitive athletes and people simply looking to move and feel better. Equipment on site includes a body-composition scanner and handheld strength and range-of-motion testing devices to track client progress over time.',
  NULL,
  NULL, NULL,
  '["https://peakcentre.co.za/", "https://www.localgymsandfitness.com/ZA/Pretoria/747284248468269/PEAK-Centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peak-centre-erasmuskloof'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'trainingwithstef-pty-ltd-t-a-stefit-erasmuskloof', 'Trainingwithstef Pty Ltd t/a SteFIT',
  (SELECT id FROM suburbs WHERE slug = 'erasmuskloof'),
  '501 Jochemus Street, Erasmuskloof, Pretoria East', '083 280 9153', 'https://www.trainingwithstef.co.za/', 'info@trainingwithstef.co.za',
  'Trainingwithstef Pty Ltd, trading as SteFIT, is a HYROX training club and personal-training business based in Erasmuskloof, Pretoria East, in a cul-de-sac off Jochemus Street next to Kloof Medi-Clinic. Training takes place largely outdoors at the adjoining Wolwespruit Trail Park, with on-site HYROX equipment including sleds, wall balls, ski ergs, rowers and kettlebells.

Sessions range from a single trial session through to ongoing HYROX Training Club membership, hybrid training, HYROX race simulations, one-on-one personal training, weightlifting and nutrition coaching. The business works with beginners through to competitive HYROX athletes, and caters to all ages, with showers available on site. Programming is built around functional, performance-based training rather than a conventional gym floor, with an emphasis on structured coaching, race preparation and measurable progress.

The club has built a track record with long-standing clients training there since 2018, drawing on its semi-outdoor Erasmuskloof location and views over the trail park as part of its appeal. It positions itself as a dedicated, affiliated HYROX gym for Pretoria East, alongside broader strength and conditioning and personal training services for people outside competitive HYROX.',
  NULL,
  NULL, NULL,
  '["https://www.trainingwithstef.co.za/contact", "https://za.africabz.com/gauteng/trainingwithstef-pty-ltd-t-676056"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trainingwithstef-pty-ltd-t-a-stefit-erasmuskloof'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
