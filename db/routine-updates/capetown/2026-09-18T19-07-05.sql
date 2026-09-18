-- Round-7 partial batch (run stopped early by owner request before the
-- remaining agents finished; this covers the two agents that completed
-- naturally -- Golden Acre and Victoria Wharf follow-up passes -- before
-- the rest were halted). Every entry verified against 2+ independent,
-- branch-matched sources with mandatory phone+address.

-- Golden Acre (cape-town-cbd)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mtn-golden-acre-cape-town-cbd', 'MTN',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 61A, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '083 869 1467', NULL, NULL,
  'MTN is a mobile network operator store offering SIMs, contracts, devices and data deals, trading from Golden Acre.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://stores.mtn.co.za/mobilephonesanddata-CapeTown-Foreshore"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mtn-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-golden-acre-cape-town-cbd', 'Steers',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 90, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 200 5845', NULL, NULL,
  'Steers is a flame-grilled burger, chicken and ribs takeaway restaurant, trading from Golden Acre.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://locations.steers.co.za/restaurants-GoldenAcreShoppingCentre-SteersGoldenAcre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'steers-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-golden-acre-cape-town-cbd', 'Debonairs Pizza',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop C91, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 201 1204', NULL, NULL,
  'Debonairs Pizza is a pizza takeaway and delivery restaurant, trading from Golden Acre.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://location.debonairspizza.co.za/golden-acre-express"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'debonairs-pizza-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'american-swiss-golden-acre-cape-town-cbd', 'American Swiss',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 56, Lower Concourse Level, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 421 1776', NULL, NULL,
  'American Swiss is a jewellery and watch retailer, trading from Golden Acre.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.americanswiss.co.za/home/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'american-swiss-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sterns-golden-acre-cape-town-cbd', 'Sterns',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 30, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 421 7734', NULL, NULL,
  'Sterns is a jewellery retailer specialising in diamonds, gold jewellery and watches, trading from Golden Acre.',
  NULL, NULL,
  '["https://golden-acre.co.za/stores/", "https://www.sayellow.com/view/south-africa/sterns-jewellers-golden-acre-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sterns-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'queens-hair-beauty-golden-acre-cape-town-cbd', 'Queen''s Hair Beauty',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'),
  'Shop 46, Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '081 524 7638', NULL, NULL,
  'Queen''s Hair Beauty is a hair and beauty salon specialising in wigs, weaves and lace front installs, trading from Golden Acre.',
  NULL, NULL,
  '["https://queenshairandbeauty.com/", "https://www.facebook.com/Queenshair517/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'queens-hair-beauty-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

-- Victoria Wharf (va-waterfront)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-va-waterfront', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 6138, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 415 3411', NULL, NULL,
  'Woolworths is a major South African retailer offering clothing, food and homeware, trading from Victoria Wharf Shopping Centre.',
  NULL, NULL,
  '["https://www.smeg.com/za/stores/woolworths-vanda-waterfront-city-centre-store.html", "https://www.waterfront.co.za/stores/woolworths"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'woolworths-va-waterfront'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lacoste-va-waterfront', 'Lacoste',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 6205, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 421 8836', NULL, NULL,
  'Lacoste is a French fashion brand known for its polo shirts, footwear and accessories, trading from Victoria Wharf Shopping Centre.',
  NULL, NULL,
  '["https://www.waterfront.co.za/stores/lacoste/", "https://www.lacoste.com/us/stores/southafrica/capetown/capetown-1911"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'lacoste-va-waterfront'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'out-of-africa-va-waterfront', 'Out of Africa',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 125, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 418 5505', NULL, NULL,
  'Out of Africa is a curio and gift shop offering African-themed home decor, ceramics, textiles and accessories, trading from Victoria Wharf Shopping Centre.',
  NULL, NULL,
  '["https://www.waterfront.co.za/stores/out-of-africa", "https://wanderlog.com/place/details/12075650/out-of-africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'out-of-africa-va-waterfront'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sunglass-hut-va-waterfront', 'Sunglass Hut',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'),
  'Shop 7206, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 418 8534', NULL, NULL,
  'Sunglass Hut is a sunglasses and eyewear retailer, trading from Victoria Wharf Shopping Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/sunglass-hut-victoria-wharf/21991", "https://www.cybo.com/ZA-biz/sunglass-hut_156O"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sunglass-hut-va-waterfront'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);
