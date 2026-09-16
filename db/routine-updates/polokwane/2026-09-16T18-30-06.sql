INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coco-affair-polokwane-central', 'Coco Affair',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Standard Bank Square, 49C Schoeman Street, Polokwane Central', '015 295 8857', NULL, NULL,
  'Coco Affair is a coffee shop and lunch cafe at Standard Bank Square on Schoeman Street, serving coffee, cakes and lunches in Polokwane Central.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/coco-affair/132968", "https://za.near-place.com/food-nearby-coco-affair-standard-bank-square-49c-schoeman-street-polokwane-central-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coco-affair-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mama-testimony-african-restaurant-grocery-polokwane-central', 'Mama Testimony African Restaurant & Grocery',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '106 Schoeman Street, Polokwane Central', '083 218 0717', NULL, NULL,
  'Mama Testimony African Restaurant & Grocery is a Nigerian restaurant and grocery store on Schoeman Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.facebook.com/people/Mama-Testimony-African-Restaurant-Grocery/100076670251686/", "https://www.mrd.com/delivery/restaurant/mama-testimony-african-restaurant-grocery-polokwane-central/23978"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mama-testimony-african-restaurant-grocery-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-game-centre-polokwane-central', 'Clicks Game Centre Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'game-centre-polokwane-central'),
  'C/O Market Street and Hospital Street, Game Centre, Polokwane Central', '015 297 0278', NULL, NULL,
  'Clicks Game Centre Polokwane is a pharmacy and health-and-beauty store inside Game Centre, on the corner of Market and Hospital Streets.',
  NULL, NULL,
  '["https://clicks.co.za/store/Game-Centre-Polokwane/1637", "https://www.hotfrog.co.za/company/df41ea78d84f252f6ad3d8b514537610/clicks-pharmacy-game-centre-polokwane/polokwane/personal-care-supplies"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-game-centre-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-game-centre-polokwane-central', 'Cash Crusaders Polokwane Game City',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'game-centre-polokwane-central'),
  'Shop 19, Game Complex, Hospital Street, Polokwane Central', '015 297 0133', NULL, NULL,
  'Cash Crusaders Polokwane Game City is a second-hand goods and pawnbroking store trading from Shop 19 in Game Centre.',
  NULL, NULL,
  '["https://cashcrusaders.co.za/storedetails?location=PolokwaneGameCity", "https://za.textmap.info/141/1329"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-game-centre-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
