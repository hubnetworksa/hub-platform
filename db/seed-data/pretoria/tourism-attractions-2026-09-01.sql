-- Generated for the "Tourism Information" page's Heritage Sites/Museums
-- sections (see src/pages/pretoria-tourism-information.astro). Every fact
-- traces to a real source (official site, Wikipedia, or a real-estate/
-- tourism reference), same bar as the rest of this project. Burgers Park,
-- Church Square and the Ditsong Museum of Military History (actually in
-- Johannesburg, not Pretoria) were deliberately left out — no genuine
-- phone number exists for the first two, and the third is out of scope.

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'union-buildings-arcadia', 'Union Buildings',
  (SELECT id FROM suburbs WHERE slug = 'arcadia'),
  'Government Avenue, Arcadia, Pretoria, 0002', '012 300 5200',
  'The Union Buildings is South Africa''s seat of government, on Meintjieskop in Arcadia. Designed by Sir Herbert Baker and completed in 1913, the sandstone building is set among terraced gardens overlooking the city; the grounds are open to the public daily, though the buildings themselves are not.',
  '["https://www.thepresidency.gov.za/contact", "https://www.sa-venues.com/attractionsga/union-buildings.htm"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'union-buildings-arcadia'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'voortrekker-monument-groenkloof', 'Voortrekker Monument',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  'Eeufees Road, Groenkloof, Pretoria, 0187', '012 326 6770',
  'Inaugurated in 1949 and designed by architect Gerard Moerdijk, the Voortrekker Monument commemorates the Voortrekker pioneers and holds the world''s longest historical marble frieze. One of Gauteng''s most-visited heritage sites, it is open daily from 08:00 to 17:30.',
  '["https://vtm.org.za/en/contact-us/", "https://www.wheretostay.co.za/topic/652-voortrekker-monument-heritage-site-in-pretoria"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'voortrekker-monument-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'kruger-house-museum-pretoria-central', 'Kruger House Museum',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  '60 WF Nkomo (Church) Street West, Pretoria Central, 0002', '012 492 5731',
  'The Kruger House Museum, also known as the Ditsong Kruger Museum, is housed in President Paul Kruger''s original residence, built in 1884 and his home until he went into exile in 1900. It is open daily from 07:30 to 16:00.',
  '["https://www.sa-venues.com/attractionsga/kruger-house.htm", "https://www.visittshwane.co.za/ditsong-kruger-museum/"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kruger-house-museum-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'freedom-park-salvokop', 'Freedom Park',
  (SELECT id FROM suburbs WHERE slug = 'salvokop'),
  'Koch Street & 7th Avenue, Salvokop, Pretoria, 0002', '012 336 4000',
  'Freedom Park is a 52-hectare heritage site and //hapo Museum on Salvokop, opened in December 2007, commemorating South Africans who died in the Anglo-Boer War, both World Wars and the struggle against apartheid.',
  '["https://www.freedompark.co.za/contact-2/", "https://en.wikipedia.org/wiki/Freedom_Park_(South_Africa)"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freedom-park-salvokop'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'mariammen-temple-marabastad', 'Mariammen Temple',
  (SELECT id FROM suburbs WHERE slug = 'marabastad'),
  '323 6th Street, Asiatic Bazaar, Marabastad, Pretoria, 0183', '012 358 1430',
  'The Mariammen Temple, built in 1905, is the oldest Hindu temple in Pretoria, in the historic Asiatic Bazaar area of Marabastad.',
  '["https://en.wikipedia.org/wiki/Mariamman_Temple,_Pretoria", "https://sahistory.org.za/place/mariammen-temple-pretoria"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mariammen-temple-marabastad'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'ditsong-national-museum-of-natural-history-pretoria-central', 'Ditsong National Museum of Natural History',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  '432 Paul Kruger Street, Pretoria Central, 0001', '012 492 1358',
  'The Ditsong National Museum of Natural History holds fauna, flora, palaeontology and geology collections, including early hominid fossils, in Pretoria Central.',
  '["https://ditsong.org.za/en/our-museums/museum-of-natural-history/", "https://en.wikipedia.org/wiki/Ditsong_National_Museum_of_Natural_History"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ditsong-national-museum-of-natural-history-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'ditsong-national-museum-of-cultural-history-pretoria-central', 'Ditsong National Museum of Cultural History',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  '149 Visagie Street, Pretoria Central, 0001', '012 492 5788',
  'Housed in the old South African Mint building behind Pretoria City Hall, the Ditsong National Museum of Cultural History covers cultural history, anthropology and archaeology.',
  '["https://en.wikipedia.org/wiki/Ditsong_National_Museum_of_Cultural_History", "https://ditsong.org.za/en/our-museums/museum-of-cultural-history/"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ditsong-national-museum-of-cultural-history-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'pionier-open-air-museum-silverton', 'Pionier Open-air Museum',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  'Keuning Drive, Silverton, Pretoria, 0127', '012 812 8006',
  'The Pionier Open-air Museum in Silverton is a living museum reflecting the lifestyle of early pioneer farmers, with free parking for visitors.',
  '["https://ditsong.org.za/en/pioneer-museum/", "https://www.sa-venues.com/attractionsga/pioneer-museum-silverton.htm"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pionier-open-air-museum-silverton'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'sammy-marks-museum-donkerhoek', 'Sammy Marks Museum',
  (SELECT id FROM suburbs WHERE slug = 'donkerhoek'),
  'Zwartkoppies Hall, Donkerhoek, Pretoria', '012 755 9541',
  'The Sammy Marks Museum preserves the restored Victorian-era homestead of 19th-century industrialist Sammy Marks at Zwartkoppies, on Pretoria''s eastern outskirts.',
  '["https://ditsong.org.za/en/our-museums/sammy-marks-museum/", "https://sahistory.org.za/place/sammy-marks-residence-zwartkoppies-pretoria"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sammy-marks-museum-donkerhoek'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'tswaing-meteorite-crater-soshanguve', 'Tswaing Meteorite Crater',
  (SELECT id FROM suburbs WHERE slug = 'soshanguve'),
  'M35 Soutpan Road, Soshanguve, 0164', '073 661 5014',
  'Tswaing Meteorite Crater is a roughly 220,000-year-old meteorite impact site about 40km north of Pretoria, with hiking trails and an on-site interpretive centre.',
  '["https://ditsong.org.za/en/tswaing-meteorite/", "https://www.sa-venues.com/attractionsga/tswaing-meteorite-crater.htm"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tswaing-meteorite-crater-soshanguve'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
