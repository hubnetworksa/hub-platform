-- Clubview Corner Shopping Centre (shopping_centers.id=281) tenant data
-- pulled directly from https://clubviewcornershoppingcentre.co.za/ --
-- the mall's own official tenant list, per the rule that a business is
-- only "part of" a shopping center if the center's own site says so, not
-- GPS proximity. Encounter Christian Church (not a directory business)
-- and the FNB ATM (a banking amenity, not a standalone tenant) are on
-- the mall's list but intentionally not added here.

-- Unlink 3 businesses that were linked to Clubview Corner (likely by the
-- old proximity-based script) but do not appear on the mall's own tenant
-- list at all -- no evidence they actually belong here.
UPDATE businesses SET shopping_center_id = NULL WHERE id = 5734; -- BUC Fitness
UPDATE businesses SET shopping_center_id = NULL WHERE id = 5735; -- Boureche Barber Shop
UPDATE businesses SET shopping_center_id = NULL WHERE id = 3177; -- The Courier Guy Clubview Corner Locker (address references "The Mica Store", not on this mall's list)

-- Fix phone numbers on the 2 existing confirmed tenants using the mall's
-- own listing (both had the wrong number on file).
UPDATE businesses SET phone = '079 841 1014' WHERE id = 3121; -- SPAR Clubview (had TOPS's number)
UPDATE businesses SET phone = '071 573 3429' WHERE id = 3169; -- Alkaline Ionized H₂0

-- Link the existing Autostyle Motorsport record (already correctly
-- addressed to this mall) and correct its phone to match the mall's site.
UPDATE businesses SET shopping_center_id = 281, phone = '079 721 7189' WHERE id = 3158;

-- New confirmed tenants, not previously in the directory.
INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'tops-at-spar-clubview', 'TOPS at SPAR',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 654 2616',
  'TOPS at SPAR is a liquor store at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'tops-at-spar-clubview'), (SELECT id FROM categories WHERE slug = 'liquor-stores'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'burger-bistro-clubview', 'Burger Bistro',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '082 579 5423',
  'Burger Bistro is a restaurant at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'burger-bistro-clubview'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'krispra-trading-clubview', 'Krispra Trading',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 654 0984',
  'Krispra Trading serves Indian cuisine at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'krispra-trading-clubview'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'pizza-perfect-clubview', 'Pizza Perfect',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 654 1228',
  'Pizza Perfect is a pizzeria at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'pizza-perfect-clubview'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'ming-wu-chinese-restaurant-clubview', 'Ming Wu Chinese Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 654 2644',
  'Ming Wu Chinese Restaurant is at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'ming-wu-chinese-restaurant-clubview'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'clean-and-classic-clubview', 'Clean and Classic',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '082 770 3820',
  'Clean and Classic is a cleaning service at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'clean-and-classic-clubview'), (SELECT id FROM categories WHERE slug = 'cleaning-services'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'post-link-clubview', 'Post Link',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 942 8686',
  'Post Link is a postal and courier agency at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'post-link-clubview'), (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, description, source_urls, status, origin)
VALUES (
  'pudo-lockers-clubview', 'Pudo Lockers',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014',
  'Pudo Lockers is a parcel locker point at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'pudo-lockers-clubview'), (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, description, source_urls, status, origin)
VALUES (
  'salon-at-clubview-clubview', 'Salon at Clubview',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014',
  'Salon at Clubview is a hair and beauty salon at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'salon-at-clubview-clubview'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'the-queen-petshop-clubview', 'The Queen Petshop',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '012 942 9394',
  'The Queen Petshop is a pet store at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'the-queen-petshop-clubview'), (SELECT id FROM categories WHERE slug = 'pet-stores'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'pharmacy-at-spar-clubview', 'Pharmacy at SPAR',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '083 786 0536',
  'Pharmacy at SPAR is a pharmacy at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'pharmacy-at-spar-clubview'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, description, source_urls, status, origin)
VALUES (
  'ihm-cell-sound-clubview', 'IHM Cell & Sound',
  (SELECT id FROM suburbs WHERE slug = 'clubview'), 281,
  'Clubview Corner, cnr Lyttelton Rd & Harvard Ave, Clubview, Centurion, 0014', '084 674 5132',
  'IHM Cell & Sound sells cellphones and accessories at Clubview Corner Shopping Centre in Clubview, Centurion.',
  '["https://clubviewcornershoppingcentre.co.za/"]', 'published', 'agent_research'
);
INSERT INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'ihm-cell-sound-clubview'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);
