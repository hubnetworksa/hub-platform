INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-converters-polokwane-cbd-polokwane-central', 'Cash Converters Polokwane CBD',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Cnr Thabo Mbeki St & Schoeman St, Polokwane Central, 0699', '087 820 6537', NULL, NULL,
  'Cash Converters Polokwane CBD is a second-hand goods and pawnbroking store on the corner of Thabo Mbeki and Schoeman Street, Polokwane Central.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/1655", "https://nearbyza.com/place/cash-converters-polokwane-cbd-1", "http://www.observer.co.za/cash-converters-opens-in-polokwane-cbd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-converters-polokwane-cbd-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nnete-lethuba-attorneys-polokwane-central', 'Nnete Lethuba Attorneys, Conveyancers & Notaries',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Regus Business Centre, 3rd Floor, Thabakgolo Building, 58-60 Landdros Mare Street, Polokwane Central', '015 101 0630', NULL, NULL,
  'Nnete Lethuba Attorneys, Conveyancers & Notaries is a law firm offering conveyancing and notarial services in Polokwane Central.',
  NULL, NULL,
  '["https://www.facebook.com/nnetelethubaattorneys/", "https://www.procompare.co.za/providers/nnete-lethuba-attorneys-conveyancers-notaries"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nnete-lethuba-attorneys-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-polokwane-cbd-polokwane-central', 'Spar Polokwane CBD',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '47 Biccard Street, Polokwane Central, 0700', '015 291 4260', NULL, NULL,
  'Spar Polokwane CBD is a supermarket on Biccard Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/lp/polokwane/spar-polokwane", "https://za.near-place.com/spar-polokwane-cbd-47-biccard-street-polokwane-central-polokwane", "https://www.callupcontact.com/b/Supermarkets/Spar_Polokwane_Pietersburg/40824"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-polokwane-cbd-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'a1-supermarket-polokwane-central', 'A1 Supermarket',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '15 Devenish Street, Polokwane Central, 0700', '015 297 3295', NULL, NULL,
  'A1 Supermarket is a butchery, bakery and grocery supermarket on Devenish Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2597833_2", "https://www.thinklocal.co.za/biz/a1-supermarket-polokwane", "https://za.near-place.com/a1-supermarket-15-devenish-street-polokwane-central-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'a1-supermarket-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
