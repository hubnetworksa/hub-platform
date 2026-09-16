-- Appliance Repairs: 2 verified businesses. Category was noisy with
-- generic SEO lead-gen pages (electricvines.co.za, wcapetourism.co.za --
-- templated "Appliance Repairs Polokwane" copy reused across many
-- different city names, no real distinct business behind them) and
-- several real-sounding candidates (Capricorn Appliance Repairs, Eagle
-- Appliances, SPEED Appliances Repairs, Refrigeration and Gas Services)
-- that only had one source for their contact details -- discarded rather
-- than published on a single source.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aircare-flora-park', 'AirCare',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  '152 Erasmus Street, Flora Park, 0699', '015 296 2632', NULL, NULL,
  'An appliance repair service on Erasmus Street in Flora Park, servicing refrigeration and air conditioning.',
  NULL, NULL,
  '["https://appliancerepair.co.za/places/aircare/", "https://www.africanadvice.com/1271945/Air_Conditioning_And_Refrigeration/Limpopo/Aircare"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aircare-flora-park'),
  (SELECT id FROM categories WHERE slug = 'appliance-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fridge-repairs-polokwane-central', 'Fridge Repairs',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '68 Market Street, Polokwane Central, 0700', '015 295 2163', NULL, NULL,
  'A refrigeration appliance repair service on Market Street in Polokwane Central.',
  NULL, NULL,
  '["https://appliancerepair.co.za/places/fridge-repairs-2/", "https://www.waze.com/live-map/directions/za/lp/polokwane/fridge-repairs"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fridge-repairs-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'appliance-repairs'),
  1
);
