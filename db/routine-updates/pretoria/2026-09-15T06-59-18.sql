INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'elardus-park-shopping-centre-elardus-park', 'Elardus Park Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'elardus-park'),
  'Cnr Delmas Rd & Barnard St, Elardus Park, Pretoria', NULL, NULL,
  '["https://www.guzzle.co.za/malls/269/", "https://www.mallguide.co.za/malls/view/266/elardus-park-shopping-centre", "https://www.thinklocal.co.za/biz/elarduspark-shopping-centre-sh-pretoria"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-elarduspark-elardus-park', 'Dis-Chem Pharmacy Elarduspark',
  (SELECT id FROM suburbs WHERE slug = 'elardus-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'elardus-park-shopping-centre-elardus-park'),
  'Elardus Park Shopping Centre, 59 Barnard St, Elardus Park, Pretoria, 0047', '012 345 1110', 'https://www.dischem.co.za/elarduspark-pretoria', NULL,
  'Dis-Chem Pharmacy Elarduspark is a pharmacy and health-and-beauty retailer inside Elardus Park Shopping Centre, Pretoria.',
  NULL, NULL,
  '["https://www.dischem.co.za/elarduspark-pretoria", "https://www.infobel.com/en/southafrica/dis_chem_pharmacy_elarduspark_pretoria/pretoria/ZA101978552-0123451110/businessdetails.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-elarduspark-elardus-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'elarduspark-pet-shop-and-dog-parlor-elardus-park', 'Elarduspark Pet Shop And Dog Parlor',
  (SELECT id FROM suburbs WHERE slug = 'elardus-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'elardus-park-shopping-centre-elardus-park'),
  '013 Elardus Park Shopping Centre, Barnard St, Elardus Park, Pretoria, 0047', '012 345 3259', NULL, NULL,
  'Elarduspark Pet Shop And Dog Parlor is a pet shop and dog grooming parlour inside Elardus Park Shopping Centre, Pretoria.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/elarduspark-pet-shop-and-dog-parlor-37413", "https://www.yep.co.za/biz/store/elarduspark-pet-shop-doggy-parlour/290765"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elarduspark-pet-shop-and-dog-parlor-elardus-park'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-daily-coffee-cafe-elardus-park-elardus-park', 'The Daily Coffee Café Elardus Park',
  (SELECT id FROM suburbs WHERE slug = 'elardus-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'elardus-park-shopping-centre-elardus-park'),
  'Shop 22, Elardus Park Shopping Centre, Cnr Delmas Rd & Barnard St, Elardus Park, Pretoria', '066 232 3698', 'https://thedailycoffeecafe.co.za/franchise-location-elardus-park/', NULL,
  'The Daily Coffee Café Elardus Park is a sit-down coffee shop franchise branch inside Elardus Park Shopping Centre, Pretoria.',
  NULL, NULL,
  '["https://thedailycoffeecafe.co.za/franchise-location-elardus-park/", "https://opening-hours.co.za/04552644/The_Daily_Coffee_Cafe_Elardus_Park"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-daily-coffee-cafe-elardus-park-elardus-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
