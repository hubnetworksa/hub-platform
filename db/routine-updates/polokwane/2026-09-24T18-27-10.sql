INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-atm-bok-excelsior-polokwane-central', 'Nedbank ATM Bok & Excelsior',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Cnr Bok & Excelsior Street, Polokwane, 0699', '080 011 0929', NULL, NULL,
  'A standalone Nedbank ATM on the corner of Bok and Excelsior Street, Polokwane Central.',
  NULL, NULL,
  '["https://nedbank.banklocationmaps.co.za/en/atm/957275-nedbank-atm-cnr-bok-and-excelsior-street", "https://www.waze.com/live-map/directions/za/lp/polokwane/nedbank-atm-city-centre-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-atm-bok-excelsior-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tyremart-polokwane-cbd-polokwane-central', 'Tyremart Polokwane CBD',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '57 President Paul Kruger Street, Polokwane, 0699', '015 291 2333', 'https://www.tyremart.co.za/polokwane-cbd/', NULL,
  'Tyremart Polokwane CBD is a tyre fitment centre in the Polokwane city centre, also offering batteries, brakes, shocks and wheel alignment services.',
  NULL, NULL,
  '["https://www.tyremart.co.za/polokwane-cbd/", "https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/polokwane/za0002401585"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tyremart-polokwane-cbd-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'tyre-fitment-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'turbo-tyres-point-s-polokwane-central', 'Turbo Tyres - Point S',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '63 President Paul Kruger Street, Polokwane, 0699', '015 291 4841', 'https://www.tyrespolokwane.com/', NULL,
  'Turbo Tyres is a Point S-branded tyre fitment centre in the Polokwane city centre.',
  NULL, NULL,
  '["https://www.point-s.co.za/store-locator/limpopo/point-s-polokwane", "https://www.yep.co.za/biz/store/turbo-tyres-point-s/656447"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'turbo-tyres-point-s-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'tyre-fitment-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tiger-wheel-tyre-polokwane-cbd-polokwane-central', 'Tiger Wheel & Tyre Polokwane CBD',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Cnr President Paul Kruger & Grobler Street, Polokwane, 0699', '015 295 4348', 'https://stores.twt.co.za/details/polokwane-cbd', NULL,
  'Tiger Wheel & Tyre Polokwane CBD is a tyre and wheel fitment centre in the Polokwane city centre.',
  NULL, NULL,
  '["https://stores.twt.co.za/details/polokwane-cbd", "https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/polokwane/za0002400427"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tiger-wheel-tyre-polokwane-cbd-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'tyre-fitment-centres'),
  1
);
