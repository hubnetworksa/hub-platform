-- Jobs 1-2: polokwane-central suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kuaho-attorneys-polokwane-central', 'Kuaho Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '29 Voortrekker St, Polokwane Central, Polokwane, 0699', '015 295 8784', NULL, 'mekuaho@telkomsa.net',
  'Kuaho Attorneys is a law firm in Polokwane Central offering attorney, notary and conveyancing services.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/kuaho-attorneys", "https://www.cylex.net.za/company/kuaho-attorneys-17595572.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kuaho-attorneys-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'city-centre-pharmacy-polokwane-central', 'City Centre Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '101-103 Bok Street, Polokwane Central, Polokwane', '015 297 8242', NULL, NULL,
  'City Centre Pharmacy is a retail pharmacy on Bok Street in Polokwane Central offering dispensing and other pharmacy services.',
  NULL, NULL,
  '["https://www.primecure.co.za/provider/city-centre-pharmacy/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=353004"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'city-centre-pharmacy-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medicare-pharmacy-polokwane-central', 'Medicare Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '12d Rissik St, Polokwane Central, Polokwane, 0699', '015 297 0328', NULL, NULL,
  'Medicare Pharmacy is a retail pharmacy on Rissik Street in Polokwane Central offering dispensing and other pharmacy services.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/264784/medicare-pharmacy", "https://dima-health.com/listing/medicare-pharmacy-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medicare-pharmacy-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
