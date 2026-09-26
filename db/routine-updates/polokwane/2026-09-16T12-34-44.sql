-- Churches & Religious Organisations, round 2: 5 more verified businesses
-- (owner-requested, 2026-09-16 -- "there are many more churches in
-- Polokwane"). Same rule as round 1: polokwane.info used only as a lead
-- list, every phone/address confirmed against 2+ current independent
-- sources before publishing.
--
-- Also caught a suburb mix-up along the way: one directory placed Christ
-- Baptist Church in "Fauna Park", but its own site says "Flora Park", and
-- 16 other Marshall Street addresses already in this dataset are all
-- Flora Park -- went with the corroborated suburb.
--
-- Discarded after research: Westenburg Seventh-Day Adventist Church (real
-- address found, but no current source would confirm a phone number
-- matching or updating polokwane.info's) and Jehovah's Witnesses Kingdom
-- Hall (jw.org's location finder isn't fetchable by this routine).

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'christ-baptist-church-flora-park', 'Christ Baptist Church',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  '375 Marshall Street, Flora Park, 0699', '015 296 9920', NULL, NULL,
  'A Baptist church on Marshall Street in Flora Park.',
  NULL, NULL,
  '["https://christbaptist.co.za/", "https://za.polomap.com/polokwane/9970"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'christ-baptist-church-flora-park'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mt-horeb-presbyterian-church-polokwane-central', 'Mt Horeb Presbyterian Church',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '74 Kirsten Street, Polokwane', '015 295 4405', NULL, NULL,
  'A Presbyterian church on Kirsten Street in Polokwane Central.',
  NULL, NULL,
  '["https://unitingpresbyterian.org/congregations/findcongregations/organization/Polokwane%20Presbyterian%20Church/", "http://www.polokwane.info/churches.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mt-horeb-presbyterian-church-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'new-apostolic-church-eduan-park', 'New Apostolic Church',
  (SELECT id FROM suburbs WHERE slug = 'eduan-park'),
  '206 Potgieter Avenue, Eduan Park, 0700', '015 295 8586', NULL, NULL,
  'A New Apostolic church on Potgieter Avenue in Eduan Park.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/lp/polokwane/new-apostolic-church-polokwane", "http://www.polokwane.info/churches.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'new-apostolic-church-eduan-park'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masjid-ul-firdaus-nirvana', 'Masjid-ul-Firdaus',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '266 Orient Drive, Nirvana, 0699', '082 818 4340', NULL, NULL,
  'A mosque serving the local Muslim community from Orient Drive in Nirvana.',
  NULL, NULL,
  '["https://samosques.co.za/item/polokwane-mosque/", "https://evendo.com/locations/south-africa/polokwane/landmark/masjid-ul-firdaus"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masjid-ul-firdaus-nirvana'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'peoples-church-moregloed', 'Peoples Church',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  '80 Oost Street, Moregloed, 0699', '015 295 5311', NULL, NULL,
  'An Assemblies of God church on Oost Street in Moregloed.',
  NULL, NULL,
  '["https://www.peopleschurchplk.org", "https://aoggroup.org.za/church/peoples-church/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peoples-church-moregloed'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);
