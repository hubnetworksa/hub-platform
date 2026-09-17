-- Doctors & GPs: only 3 businesses listed for a city this size. 3 verified
-- additions. A 4th candidate, Dr Gundo INC, was researched and discarded --
-- two sources gave two different addresses (Shop 13 Library Gardens, Hans
-- van Rensburg St vs 22 De Villiers Ave, Bendor) with no reliable
-- tiebreaker, same unreliable-directory-data pattern flagged for other
-- categories earlier in this dataset.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'intercare-polokwane-central', 'Intercare Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Shop 28, The Greenery, Oost Street, Polokwane, 0699', '015 880 4000', 'https://www.intercare.co.za/facilities/intercare-polokwane', NULL,
  'Intercare Polokwane is a multi-doctor medical and dental centre in The Greenery on Oost Street, part of the national Intercare Group, offering GP consultations, dental care, and a range of specialist services under one roof.',
  NULL, NULL,
  '["https://www.intercare.co.za/facilities/intercare-polokwane", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1926239"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'intercare-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medi-24-polokwane-central', 'Medi 24',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '46 Thabo Mbeki Street, Polokwane Central, 0700', '015 291 4171', 'https://medi-24.co.za/', 'medi24@mweb.co.za',
  'Medi 24 is a general practice and medical clinic on Thabo Mbeki Street in Polokwane Central, offering GP consultations alongside dentist and optometrist services on site.',
  NULL, NULL,
  '["https://medi-24.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=201867", "https://www.thinklocal.co.za/biz/medi-24-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medi-24-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'meyer-sauermann-polokwane-central', 'Drs Meyer & Sauermann',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '30B Jorissen Street, Polokwane, 0699', '015 297 2368', NULL, NULL,
  'Drs Meyer & Sauermann is a general practice on Jorissen Street in Polokwane Central, with Dr Marti Meyer and Dr L Sauermann offering GP consultations.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=38031", "https://www.searchinafrica.com/business/5113749/south-africa/limpopo/polokwane/jorissen-st/general-practitioners/dr-ms-meyer", "https://www.africanadvice.com/1257972/General_Practitioners/Limpopo/Drs_Meyer_Ms_And_Sauermann_L/"]',
  'published', 'agent_research', 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'meyer-sauermann-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);
