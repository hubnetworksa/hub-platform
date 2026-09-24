-- Jobs 1-2: diep-river, bergvliet, kirstenhof suburb research
-- Both tenants below are at the Tokai Junction complex on the corner of Main & Tokai
-- Roads, Kirstenhof -- the same corner/address already on file for the existing
-- kirstenhof-shopping-centre-kirstenhof row's other tenants (Cash Crusaders Tokai,
-- The Pool Team Tokai), so linked to that existing centre rather than creating a
-- duplicate "Tokai Junction" row.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-tokai-junction-kirstenhof', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  (SELECT id FROM shopping_centers WHERE slug = 'kirstenhof-shopping-centre-kirstenhof'),
  'Shop G21, Tokai Junction, Main Road, Kirstenhof, Cape Town, 7945', '087 135 8726', NULL, NULL,
  'The Crazy Store is a discount variety retailer in the Tokai Junction section of Kirstenhof Shopping Centre, Kirstenhof.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1381718103420928/the-crazy-store-tokai-junction/kirstenhof-cape-town/retail-stores", "https://za.africabz.com/western-cape/the-crazy-store-tokai-junction-113307"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-tokai-junction-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'synergy-pharmacy-kirstenhof', 'Synergy Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  (SELECT id FROM shopping_centers WHERE slug = 'kirstenhof-shopping-centre-kirstenhof'),
  'Corner of Tokai & Main Road, Tokai Junction, Kirstenhof, Cape Town', '021 715 8745', NULL, NULL,
  'Synergy Pharmacy is a pharmacy in the Tokai Junction section of Kirstenhof Shopping Centre, Kirstenhof.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/synergy-pharmacy-103115", "https://pharmasa.co.za/store-locator/synergy-pharmacy-tokai/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'synergy-pharmacy-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
