-- Round-6 batch. Every business entry verified against 2+ independent,
-- branch-appropriate sources with mandatory phone+address. Covers The
-- Greenery tenants plus a Mall of the North discard-recovery pass with a
-- fresh search budget.

-- The Greenery (polokwane-central)

UPDATE businesses SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'the-greenery-polokwane-central') WHERE slug = 'intercare-polokwane-central';

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-bean-the-greenery-polokwane-central', 'Mugg & Bean The Greenery',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-greenery-polokwane-central'),
  'Shop 5, The Greenery, Oost Street, Polokwane, 0700', '015 880 0671', NULL, NULL,
  'Mugg & Bean The Greenery is a South African cafe-style restaurant serving all-day breakfast, lunch and freshly brewed coffee, trading from The Greenery shopping centre.',
  NULL, NULL,
  '["https://locations.muggandbean.co.za/restaurants-TheGreenery-MuggBeanPolokwaneGreenery", "https://propertywheel.co.za/2023/10/polokwanes-11-000m2-the-greenery-shopping-centre-opens-its-doors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mugg-bean-the-greenery-polokwane-central'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-the-greenery-polokwane-central', 'Debonairs Pizza The Greenery',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-greenery-polokwane-central'),
  'Shop 3, The Greenery, 54 Oost Street, Polokwane, 0700', '015 140 0017', NULL, NULL,
  'Debonairs Pizza The Greenery is a South African pizza takeaway and delivery chain outlet, trading from The Greenery shopping centre.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-ThjeGreenery-DebonairsPizzaPolokwaneGreenery", "https://propertywheel.co.za/2023/10/polokwanes-11-000m2-the-greenery-shopping-centre-opens-its-doors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'debonairs-pizza-the-greenery-polokwane-central'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-the-greenery-polokwane-central', 'RocoMamas The Greenery',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-greenery-polokwane-central'),
  'Shop 4, The Greenery, Grobler Street, Polokwane Ext 4, Polokwane, 0700', '015 265 7111', NULL, NULL,
  'RocoMamas The Greenery is a South African casual-dining chain outlet serving smash burgers, chicken wings and ribs, trading from The Greenery shopping centre.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/limpopo/rocomamas-polokwane", "https://propertywheel.co.za/2023/10/polokwanes-11-000m2-the-greenery-shopping-centre-opens-its-doors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rocomamas-the-greenery-polokwane-central'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

-- Mall of the North (bendor) -- discard-recovery pass, 27 tenants

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('cell-c-bendor', 'Cell C', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L66, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1459', NULL, NULL, 'Cell C is a mobile network operator and cellphone retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/cell-c-shop-l-mall-of-the-north-corner-r-and-n-bypass-bendor/9061", "https://www.facebook.com/CellCMalloftheNorthPolokwane/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'cell-c-bendor'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('debonairs-pizza-bendor', 'Debonairs Pizza', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U76, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1473', NULL, NULL, 'Debonairs Pizza is a pizza takeaway and delivery restaurant, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://location.debonairspizza.co.za/mall-of-the-north", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d10325580-Reviews-Debonairs_Pizza-Polokwane_Limpopo_Province.html"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'debonairs-pizza-bendor'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('fnb-bendor', 'FNB Mall of the North', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L44, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '087 345 5340', NULL, NULL, 'FNB is a retail bank branch, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://mycityinfo.co.za/places/south-africa/limpopo/polokwane/finance/fnb-mall-of-the-north/", "https://www.fnb.co.za/downloads/savingInvestments/Polokwane.PDF"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'fnb-bendor'), (SELECT id FROM categories WHERE slug = 'banks-atms'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('hi-fi-corp-bendor', 'Hi-Fi Corp', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L32, Mall of the North, Cnr R81 & N1 Bypass, Bendor Ext 99, Polokwane, 0699', '010 133 0421', NULL, NULL, 'Hi-Fi Corp is an appliance and consumer electronics retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.hificorp.co.za/storelocator/store/index/id/1297", "https://reviewonline.co.za/522740/mall-of-the-north-welcomes-hifi-corporation/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'hi-fi-corp-bendor'), (SELECT id FROM categories WHERE slug = 'electronics-appliances'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('istore-bendor', 'iStore', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U28, Mall of the North, Cnr R81 & N1 Bypass, Bendor Ext 99, Polokwane, 0699', '087 057 5500', NULL, NULL, 'iStore is an authorised Apple products and accessories retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.istore.co.za/storelocator/istore_mall_of_the_north", "https://www.cybo.com/ZA-biz/istore-mall-of-the-north"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'istore-bendor'), (SELECT id FROM categories WHERE slug = 'electronics-appliances'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('standard-bank-bendor', 'Standard Bank Mall of the North', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L1, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '012 310 5600', NULL, NULL, 'Standard Bank is a retail bank branch, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://bankcodesfinder.com/south-africa-bank-branch-codes/standard_bank_of_s_a_ltd/mall_of_the_north", "https://southafricafirm.com/limpopo/standard-bank-mall-of-the-north-21455"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'standard-bank-bendor'), (SELECT id FROM categories WHERE slug = 'banks-atms'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('ster-kinekor-bendor', 'Ster-Kinekor Mall of the North', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U103, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '0861 668 437', NULL, NULL, 'Ster-Kinekor operates a multi-screen cinema complex, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.vibescout.com/za/cinemas/sterkinekor/mall-of-the-north", "https://mydorpie.com/Cinemas/Limpopo/Polokwane/Ster-Kinekor/Mall-of-the-North-Movies"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'ster-kinekor-bendor'), (SELECT id FROM categories WHERE slug = 'events-function-venues'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('mugg-and-bean-bendor', 'Mugg & Bean', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U44, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1384', NULL, NULL, 'Mugg & Bean is a cafe-style restaurant known for coffee and breakfast/lunch dining, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://locations.muggandbean.co.za/restaurants-MalloftheNorth-MuggBeanMallofTheNorth", "https://www.tripadvisor.co.za/Restaurant_Review-g312624-d17796337-Reviews-Mugg_Bean_Mall_of_The_North-Polokwane_Limpopo_Province.html"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'mugg-and-bean-bendor'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('old-mutual-bendor', 'Old Mutual Mall of the North', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L40, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '013 658 9138', NULL, NULL, 'Old Mutual offers banking, lending and insurance services, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://mycityinfo.co.za/places/south-africa/limpopo/polokwane/finance/old-mutual-bank-mall-of-the-north/", "https://www.facebook.com/OldMutualPolokwaneMallOfTheNorth/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'old-mutual-bendor'), (SELECT id FROM categories WHERE slug = 'financial-investment-services'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('torga-optical-bendor', 'Torga Optical', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L76, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1100', NULL, NULL, 'Torga Optical is an optometry and eyewear retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://torgaoptical.co.za/mall-of-the-north"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'torga-optical-bendor'), (SELECT id FROM categories WHERE slug = 'opticians'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('the-crazy-store-bendor', 'The Crazy Store', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U69, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '087 135 8878', NULL, NULL, 'The Crazy Store is a discount variety and gift retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://evendo.com/locations/south-africa/polokwane/shop/the-crazy-store-mall-of-the-north", "https://www.biznizdirectory.co.za/crazy-store-mall-north-gift-store-retailers-retail-trade-in-polokwane-limpopo-70409.html"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'the-crazy-store-bendor'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('lovisa-bendor', 'Lovisa', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U63, Mall of the North, Cnr R81 & N1 Bypass, Bendor Park, Polokwane, 0699', '010 880 2088', NULL, NULL, 'Lovisa is a fashion jewellery and accessories retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.ivote.co.za/view/south-africa/lovisa-mall-of-the-north-in-polokwane", "https://www.facebook.com/mallofthenorth/photos/the-beautiful-new-look-lovisa-store-in-shoppolokwane-mallofthenorth-is-official-/1474937712572501/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'lovisa-bendor'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('pep-bendor', 'PEP', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L52, Mall of the North, Cnr R81 & N1 National Road, Bendor, Polokwane, 0699', '015 265 1379', NULL, NULL, 'PEP is an affordable clothing, footwear and homeware retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.shopshours.co.za/pep-stores/polokwane/c-57f3ca0347d677c3b27aacca", "https://my-catalogue.co.za/stores/polokwane/pep-stores/mall-of-the-north-cnr-r81-n1-national-road"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'pep-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('legit-bendor', 'Legit', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L59, Mall of the North, Cnr R81 and School Road, Bendor, Polokwane, 0699', '015 880 0250', NULL, NULL, 'Legit is a women''s and men''s fashion retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.sayellow.com/view/south-africa/legit-mall-of-the-north-in-polokwane"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'legit-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('fila-bendor', 'FILA', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U3, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '010 006 2720', NULL, NULL, 'FILA is a sportswear and footwear retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.facebook.com/Fila.RSA/posts/321942940547339/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'fila-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('steve-madden-bendor', 'Steve Madden', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U77, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '087 163 1581', NULL, NULL, 'Steve Madden is a footwear and accessories retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.facebook.com/mallofthenorth/posts/871282278369366/", "https://stevemadden.co.za/apps/store-locator"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'steve-madden-bendor'), (SELECT id FROM categories WHERE slug = 'shoe-stores'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('travelex-bendor', 'Travelex', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L78, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 265 1393', NULL, NULL, 'Travelex is a foreign currency exchange bureau, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://rsa.worldorgs.com/catalog/polokwane/currency-exchange-service/travelex-mall-of-the-north"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'travelex-bendor'), (SELECT id FROM categories WHERE slug = 'financial-investment-services'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('miladys-bendor', 'Miladys', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U18, Mall of the North, Cnr R81 & N1, Bendor Ext 99, Polokwane, 0699', '087 750 1802', NULL, NULL, 'Miladys is a women''s fashion clothing retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.miladys.com/miladys-mall-of-the-north-polokwane-40418", "https://www.yep.co.za/biz/store/miladys/285732"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'miladys-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('g-star-raw-bendor', 'G-Star RAW', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U79, Mall of the North, Cnr R81 & N1 Bypass, Bendor Ext 99, Polokwane, 0699', '015 287 3944', NULL, NULL, 'G-Star RAW is a denim and streetwear fashion retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.g-star.com/en_sg/stores/za/g-star-raw---mall-of-the-north", "https://bash.com/store/g-star-raw-mall-of-the-north-polokwane-limpopo-0699/029298"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'g-star-raw-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('mobifix-bendor', 'mobiFix', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L17, Mall of the North, Bendor, Polokwane, 0700', '072 944 4414', NULL, NULL, 'mobiFix is a cellphone repair and accessories retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.mobifixsa.com/stores/polokwane/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'mobifix-bendor'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('kingsley-heath-bendor', 'Kingsley Heath', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U46a, Mall of the North, Cnr R81 & N1 Bypass, Bendor Ext 99, Polokwane, 0699', '087 820 0554', NULL, NULL, 'Kingsley Heath is a premium men''s fashion retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://kingsleyheath.co.za/pages/store-locator"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'kingsley-heath-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('foto-first-bendor', 'Foto First', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L70, Mall of the North, Cnr R81 and N1, Bendor Ext 99, Polokwane, 0699', '015 265 1350', NULL, NULL, 'Foto First is a photographic printing and imaging retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://fotofirst.co.za/store-locator/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'foto-first-bendor'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('carrol-boyes-bendor', 'Carrol Boyes', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U85, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 414 0054', NULL, NULL, 'Carrol Boyes is a functional art and homeware retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.tiktok.com/@carrolboyesofficial/video/7411148043514432773"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'carrol-boyes-bendor'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('daniel-hechter-bendor', 'Daniel Hechter', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U12c, Mall of the North, Bendor, Polokwane, 0699', '081 171 0162', NULL, NULL, 'Daniel Hechter is an affordable-luxury fashion retailer for men and women, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.localstore.co.za/stores/57784/daniel-hechter/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'daniel-hechter-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('eagle-clothing-bendor', 'Eagle Clothing', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop L45, Mall of the North, Cnr R81 & N1 Bypass, Bendor Ext 99, Polokwane, 0699', '051 555 0126', NULL, NULL, 'Eagle Clothing is a plus-size fashion retailer for men and women, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.eagleclothing.co.za/pages/stores-listing", "https://www.facebook.com/EagleClothingSA/photos/2695224860613158/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'eagle-clothing-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('freedom-of-movement-bendor', 'Freedom of Movement', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U96, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '051 004 0166', NULL, NULL, 'Freedom of Movement is a South African streetwear fashion retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.freedomofmovement.co.za/pages/fom-mall-of-the-north"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'freedom-of-movement-bendor'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('side-step-bendor', 'Side Step', (SELECT id FROM suburbs WHERE slug = 'bendor'), (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'), 'Shop U78a, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '010 006 3087', NULL, NULL, 'Side Step is a fashion footwear retailer, trading from Mall of the North.', NULL, NULL, '["https://mallofthenorth.co.za/stores/", "https://www.side-step.co.za/mall-of-the-north-side-step"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'side-step-bendor'), (SELECT id FROM categories WHERE slug = 'shoe-stores'), 1);
