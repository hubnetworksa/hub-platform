-- Jobs 1-2: Observatory suburb research

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'riverlands-mall-observatory', 'Riverlands Mall',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '51 Gogosoa St, Observatory, Cape Town', NULL, NULL,
  '["https://www.capetownetc.com/property/a-lifestyle-revolution-riverlands-mall-brings-holistic-living-to-observatory/", "https://www.facebook.com/riverlandsmall/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-riverlands-mall-observatory', 'Clicks Riverlands Mall',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverlands-mall-observatory'),
  'Shop G52, Riverlands Mall, 51 Gogosoa St, Observatory, Cape Town', '021 488 8480', 'https://clicks.co.za/store/Riverlands-Mall---River-Club/2316', NULL,
  'Clicks Riverlands Mall is a pharmacy and health, beauty and personal care store inside Riverlands Mall in Observatory.',
  NULL, NULL,
  '["https://clicks.co.za/store/Riverlands-Mall---River-Club/2316", "https://south-africa.searchinafrica.com/business/6183752/south-africa/western-cape/cape-town/observatory/gogosoa-st/pharmacies/clicks-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-riverlands-mall-observatory'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barksole-riverlands-mall-observatory', 'Barksole Riverlands Mall',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverlands-mall-observatory'),
  'Shop G34 Entrance, Riverlands Mall, 51 Gogosoa St, Observatory, Cape Town', '084 959 2303', 'https://barksole.co.za/store-locator/barksole-riverlands-mall/', NULL,
  'Barksole Riverlands Mall is a pet supplies and grooming store inside Riverlands Mall in Observatory.',
  NULL, NULL,
  '["https://barksole.co.za/store-locator/barksole-riverlands-mall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barksole-riverlands-mall-observatory'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-salon-riverlands-observatory', 'Sorbet Salon Riverlands',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverlands-mall-observatory'),
  'Shop G48, Riverlands Mall, 51 Gogosoa St, Observatory, Cape Town', '021 518 3208', 'https://stores.salonssorbet.co.za/western-cape/cape-town/shop-g48-riverlands-mall', NULL,
  'Sorbet Salon Riverlands is a beauty salon inside Riverlands Mall in Observatory, offering manicures, pedicures, massages, threading, tinting and waxing.',
  NULL, NULL,
  '["https://stores.salonssorbet.co.za/western-cape/cape-town/shop-g48-riverlands-mall", "https://www.cylex.net.za/company/sorbet-salon-23865965.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-salon-riverlands-observatory'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cocoa-cha-chi-observatory', 'Cocoa Cha Chi',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  'Shop 20, Lower Main Road, Observatory, Cape Town', '021 448 3637', 'https://www.cocoa.co.za/', NULL,
  'Cocoa Cha Chi is a cafe and pizzeria on Lower Main Road in Observatory, serving breakfast and coffee alongside pizza.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/cocoa-cha-chi-18477", "https://www.eatout.co.za/venue/cocoa-cha-chi/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cocoa-cha-chi-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mimis-observatory', 'Mimi''s',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '78 Lower Main Road, Observatory, Cape Town', '021 447 6747', NULL, NULL,
  'Mimi''s is a cafe on Lower Main Road in Observatory serving breakfast and lunch with organic and health-food options.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Mimi-The-Delicious-Food-Company/4807", "https://www.southafricablog.com/cape-town/mimis-deli-observatory-cape-town-cafe-review"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mimis-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
