INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bendor-guest-house-bendor', 'Bendor Guest House',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '78 Bendor Drive, Bendor, Polokwane', '015 296 3923', 'https://www.bendorguesthouse.co.za', NULL,
  'Bendor Guest House is a guest house in Bendor, Polokwane, offering bed-and-breakfast rooms as well as a self-catering unit, within easy reach of the central business district, airport and main routes.',
  NULL, NULL,
  '["https://governmentdirectree.com/business-directory/5203/bendor-guest-house/", "https://bnbfinder.co.za/places/bendor-guest-house/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bendor-guest-house-bendor'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trevors-haven-preschool-bendor', 'Trevor''s Haven Preschool, Creche & Aftercare',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '29 Munnik Ave, Bendor, Polokwane, 0699', '073 441 1071', NULL, NULL,
  'Trevor''s Haven Preschool, Creche & Aftercare is a preschool and creche in Bendor, Polokwane, caring for children from a few months old through pre-school age and offering aftercare services.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/trevor%27s-haven-preschool--creche---aftercare-23836248.html", "https://findmynursery.net/nurseries/trevors-haven-preschool-creche-aftercare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trevors-haven-preschool-bendor'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'proforum-limpopo-accountants-bendor', 'Proforum Limpopo Accountants',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Rhodesdrift Office Park, 25 Rhodesdrift St, Bendor, Polokwane', '015 296 0523', NULL, NULL,
  'Proforum Limpopo Accountants is an accounting and auditing firm based at Rhodesdrift Office Park in Bendor, Polokwane, offering accounting, tax and audit services.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/735030/proforum-limpopo-rekenmeesters", "https://www.yellowpages.net/phone,27-152960523,Accountant,Polokwane,ZA383312.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'proforum-limpopo-accountants-bendor'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hi-q-polokwane-ladine-bendor-park', 'Hi-Q Polokwane Ladine',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '64 Silicon Street, Bendor Park, Polokwane, 0713', '015 293 2124', NULL, NULL,
  'Hi-Q Polokwane Ladine is a tyre fitment centre in Bendor Park, Polokwane, offering tyres, shocks, batteries and brakes.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/hi-q-silicon-street/25713", "https://www.yep.co.za/biz/store/iyp/10006588_1", "https://www.facebook.com/hiqladine/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hi-q-polokwane-ladine-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'tyre-fitment-centres'),
  1
);
