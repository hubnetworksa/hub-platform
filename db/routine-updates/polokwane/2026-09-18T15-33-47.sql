-- Parallel agent research batch (10 agents, 3 assigned to Polokwane
-- suburbs: dalmada/broadlands/southern-gateway/eduan-park/thornhill-estate,
-- moregloed/hospark/capricorn/extension-71/extension-76, and
-- seshego/seshego-zone-1/seshego-zone-4/mankweng/lebowakgomo/futura).
-- Each business verified against 2+ independent sources with mandatory
-- phone+address, cross-checked against the existing dataset to avoid
-- duplicates. Full research notes (including discarded/unverifiable
-- leads) are in this session's conversation log, not reproduced here.

-- Thornhill Estate: 7 tenants of the already-known Thornhill Shopping
-- Centre (slug thornhill-shopping-centre-thornhill-estate), each verified
-- against the centre's own official store directory plus one further
-- independent source.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'skin-deep-thornhill-estate', 'Skin Deep',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Shop 21, Thornhill Shopping Centre, Cnr Munnik Ave & Veldspaat St, Thornhill, Polokwane, 0699', '015 296 0292', 'http://www.skindeepplk.co.za/', NULL,
  'Skin Deep is a beauty and skin-treatment salon in Thornhill Estate, offering laser skin rejuvenation, chemical peels, microdermabrasion, nails, and waxing.',
  NULL, NULL,
  '["https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "http://www.skindeepplk.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'skin-deep-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'spas-wellness'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-queen-pet-shop-thornhill-estate', 'The Queen Pet Shop (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Thornhill Shopping Centre, Cnr Veldspaat and Munnik Ave, Bendor, Polokwane', '+27 15 590 8419', 'https://queenpets.co.za', 'thornhill@queenpets.co.za',
  'The Queen Pet Shop is a pet-supply store in Thornhill Estate, part of a multi-branch chain selling pet food and accessories.',
  NULL, NULL,
  '["https://queenpets.co.za/pages/store-locator", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-queen-pet-shop-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'pet-stores'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hennies-thornhill-estate', 'Hennie''s (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Shop 39, Thornhill Shopping Centre, Veldspaat Street, Thornhill, Polokwane, 0699', '079 303 0199', 'https://therealhennies.co.za/hennies-polokwane/', 'polokwane@therealhennies.co.za',
  'Hennie''s is a sports bar and grill restaurant in Thornhill Estate, part of a South African restaurant chain, with outdoor seating and wheelchair-accessible facilities.',
  NULL, NULL,
  '["https://therealhennies.co.za/hennies-polokwane/", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'hennies-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'senhor-peri-peri-thornhill-estate', 'Senhor Peri-Peri (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Thornhill Shopping Centre, Corner Munnik Avenue and Veldspaat Street, Polokwane, 0699', '+27 15 004 2252', 'https://senhorperiperi.co.za/our-stores/', NULL,
  'Senhor Peri-Peri is a Portuguese-inspired peri-peri chicken restaurant in Thornhill Estate.',
  NULL, NULL,
  '["https://senhorperiperi.co.za/our-stores/", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'senhor-peri-peri-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wildman-hunting-outdoor-thornhill-estate', 'Wildman Hunting & Outdoor Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Shop 63, Thornhill Shopping Centre, Cnr Veldspaat & Munnik Avenue, Bendor, Polokwane, 0699', '015 000 0320', NULL, NULL,
  'Wildman Hunting & Outdoor is a firearms, hunting, and outdoor-equipment store in Thornhill Estate that also offers gunsmithing services.',
  NULL, NULL,
  '["https://www.guncommunity.co.za/listing/wildman-hunting-outdoor-polokwane/", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "https://www.facebook.com/wildmanPolokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'wildman-hunting-outdoor-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vivo-vleismark-thornhill-estate', 'Vivo Vleismark (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Thornhill Shopping Centre, Cnr Munnik Ave & Veldspaat St, Thornhill, Polokwane, 0699', '087 095 5672', NULL, NULL,
  'Vivo Vleismark is a butchery and deli in Thornhill Estate, part of a multi-branch meat-retail chain.',
  NULL, NULL,
  '["https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "https://www.facebook.com/vivovleismarkofficial/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'vivo-vleismark-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'butcheries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oasis-water-thornhill-estate', 'Oasis Water (Thornhill)',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Shop 10, Thornhill Shopping Centre, Munnik Ave, Polokwane, 0713', '+27 73 892 4944', NULL, NULL,
  'Oasis Water is a bottled and purified drinking-water retail store in Thornhill Estate, part of a national water-purification franchise.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/oasis-water-polokwane-munnik-ave-in-polokwane", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'oasis-water-thornhill-estate'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

-- Moregloed / Hospital Park

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freelance-photo-centre-moregloed', 'Freelance Photo Centre',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  'Shop 9, Palm Centre, Grobler Street, Moregloed, Polokwane, 0699', '015 291 3644', NULL, NULL,
  'Freelance Photo Centre is a photo processing and framing shop in Moregloed, Polokwane, operating out of the Palm Centre on Grobler Street.',
  NULL, NULL,
  '["https://polokwane.infoisinfo.co.za/card/freelance-photo-centre/265679", "https://www.yep.co.za/biz/store/iyp/15913698_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'freelance-photo-centre-moregloed'), (SELECT id FROM categories WHERE slug = 'photographers'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jaggertech-industrial-supplies-hospark', 'JaggerTech Industrial Supplies and Services CC',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '100 Magazyn Street, Hospital Park, Polokwane, 0700', '015 297 3626', NULL, NULL,
  'JaggerTech Industrial Supplies and Services is an industrial air-filtration products supplier in Hospital Park, Polokwane, founded in 2003.',
  NULL, NULL,
  '["https://polokwane.infoisinfo.co.za/search/industrial-equipment", "https://www.netpages.co.za/Polokwane/Jaggertech+Industrial+Supplies+And+Services+Cc-804266.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jaggertech-industrial-supplies-hospark'), (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'), 1);

-- Lebowakgomo

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dunns-lebowakgomo', 'Dunns',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Shop 212, Mapudi Phasha Complex, Lebowakgomo, 0737', '015 633 5253', NULL, NULL,
  'Dunns is a fashion and footwear retail store in the Mapudi Phasha Complex in Lebowakgomo.',
  NULL, NULL,
  '["https://www.facebook.com/DunnsLebowakgomo/", "https://www.ananzi.co.za/ads/za/dunns-stores?page=4"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'dunns-lebowakgomo'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);
