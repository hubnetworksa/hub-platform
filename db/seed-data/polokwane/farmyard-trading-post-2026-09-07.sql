-- The Farmyard Trading Post (owner request 2026-09-07). Open-air lifestyle
-- centre ~5 km east of Polokwane on Munnik Rd, cnr Munnik & School St,
-- Bendor Ext 115. Added as a shopping centre plus its verified tenants,
-- following ROUTINE.md's job-2 bar: the centre's own directory
-- (thefarmyard.co.za) as source 1 + one independent source per tenant, with
-- a phone number and the centre address for each.
--
-- Tenants NOT added here — only the centre's own directory found so far, no
-- confirming second source (leave for the routine / a later pass):
--   Seattle Coffee Company, Westpack Lifestyle, Cycleway, Nutrition Rage,
--   FNB, Nedbank, Mediserve Pharmacy, SPIF, Buzworx.

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type, description)
VALUES (
  'the-farmyard-trading-post-bendor', 'The Farmyard Trading Post',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Cnr Munnik & School St, Bendor Ext 115, Polokwane, 0700', NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.wheretostay.co.za/topic/5331-the-farmyard-trading-post-polokwane-limpopo"]',
  'mall',
  'An open-air lifestyle and retail centre about 5 km east of Polokwane on Munnik Road, on the corner of Munnik and School Streets in the Bendor area. It mixes boutique shops, specialty food, restaurants and a bakery with family attractions such as ten-pin bowling, and everyday anchors including Food Lover''s Market. Open seven days a week.'
);

-- Link the existing Doppio Zero listing to the centre (job-3 style — the
-- routine had already published it as a standalone business in Bendor).
UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor')
WHERE slug = 'doppio-zero-polokwane-bendor';

-- New verified tenants ------------------------------------------------------

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-the-farmyard-bendor', 'Food Lover''s Market The Farmyard',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, Cnr Munnik & School St, Bendor Ext 115, Polokwane, 0700',
  '015 590 5000', 'https://foodloversmarket.co.za/stores/limpopo/food-lovers-market-the-farmyard/', NULL,
  'A Food Lover''s Market fresh-produce and grocery emporium at The Farmyard Trading Post, opened in December 2022.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://foodloversmarket.co.za/stores/limpopo/food-lovers-market-the-farmyard/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'food-lovers-market-the-farmyard-bendor'),
        (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-the-farmyard-bendor', 'PostNet The Farmyard',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'Shop HG03B, The Farmyard Trading Post, Cnr Munnik & School St, Bendor Ext 115, Polokwane, 0700',
  '067 653 7825', 'https://www.postnet.co.za/stores/farmyard', NULL,
  'A PostNet outlet at The Farmyard Trading Post offering courier, printing, mailbox and related services.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.postnet.co.za/stores/farmyard/64783c3ebf33bb0e5d9221e8"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'postnet-the-farmyard-bendor'),
        (SELECT id FROM categories WHERE slug = 'printing-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-the-farmyard-bendor', 'KFC The Farmyard',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, Cnr Munnik & School St, Bendor Ext 115, Polokwane, 0700',
  '079 032 4128', NULL, NULL,
  'A KFC outlet at The Farmyard Trading Post.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.ubereats.com/za/store/kfc-polokwane-farmyard/dRP-ssBTS2y5b-HkHaP0kg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'kfc-the-farmyard-bendor'),
        (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blue-bottle-liquors-the-farmyard-bendor', 'Blue Bottle Liquors The Farmyard',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, Cnr Munnik & School St, Bendor Ext 115, Polokwane, 0700',
  '015 880 2131', NULL, NULL,
  'A Blue Bottle Liquors bottle store at The Farmyard Trading Post, stocking wines, spirits and beers.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.facebook.com/p/Farmyard-Blue-Bottle-Liquors-100085420357794/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'blue-bottle-liquors-the-farmyard-bendor'),
        (SELECT id FROM categories WHERE slug = 'liquor-stores'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'outdoor-warehouse-bendor', 'Outdoor Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, 115 Cnr Munnik & School Rd, Bendor Ext, Polokwane, 0700',
  '015 753 0350', 'https://www.outdoorwarehouse.co.za/store/polokwane-0337', NULL,
  'An Outdoor Warehouse store at The Farmyard Trading Post, selling camping, hiking and outdoor gear and clothing.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.outdoorwarehouse.co.za/store/polokwane-0337"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'outdoor-warehouse-bendor'),
        (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greener-tidings-garden-centre-bendor', 'Greener Tidings Garden Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, 2 Knottrox Ave, Bendor Ext 115, Polokwane, 0700',
  '015 296 0303', 'https://www.greenertidings.co.za/', NULL,
  'Greener Tidings Garden Centre at The Farmyard Trading Post, selling plants, garden supplies and outdoor living products.',
  NULL, NULL,
  '["https://www.thefarmyard.co.za/", "https://www.greenertidings.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'greener-tidings-garden-centre-bendor'),
        (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'), 1);
