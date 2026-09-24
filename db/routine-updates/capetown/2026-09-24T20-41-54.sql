INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-bellville', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '130 Voortrekker Road, Bellville, 7530', '021 948 5717', NULL, NULL,
  'Clicks is a pharmacy and health and beauty retailer on Voortrekker Road, in Bellville.',
  NULL, NULL,
  '["https://clicks.co.za/store/Bellville/109", "https://za.africabz.com/western-cape/clicks-pharmacy-41361"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-bellville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nu-sight-optometrists-bellville', 'Nu-Sight Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'No. 3 Shoprite Centre, Voortrekker Road, Bellville, 7530', '021 948 5210', NULL, NULL,
  'Nu-Sight Optometrists is an optical practice on Voortrekker Road, in Bellville, providing spectacles and contact lenses.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/238243/nu-sight", "https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/optometry/GEMS-Optometry-Network-Providers---Western-Cape.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nu-sight-optometrists-bellville'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-holland-bakery-bellville', 'The Holland Bakery',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Corner of Durban Road & Voortrekker Road, Bellville, 7530', '021 948 3800', NULL, NULL,
  'The Holland Bakery is a Dutch-style bakery on the corner of Durban and Voortrekker Roads, in Bellville, serving traditional Dutch baked goods.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/ShowUserReviews-g312656-d17734290-r689264023-The_Holland_Bakery-Bellville_Western_Cape.html", "https://www.yep.co.za/biz/store/iyp/6552747_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-holland-bakery-bellville'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-tyger-valley-bellville', 'Pick n Pay',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'tyger-valley-shopping-centre-bellville'),
  'Tyger Valley Shopping Centre, Bill Bezuidenhout Avenue, Bellville, 7530', '021 914 1550', NULL, NULL,
  'Pick n Pay is a supermarket in Tyger Valley Shopping Centre, Bellville.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Pick-N-Pay-Tygervalley-Shopping-Centre-T6485162/", "https://www.yep.co.za/biz/store/iyp/17258575_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-tyger-valley-bellville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
