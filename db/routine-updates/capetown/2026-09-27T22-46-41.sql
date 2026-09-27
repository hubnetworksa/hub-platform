INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'usave-rugby-rugby', 'Usave Rugby',
  (SELECT id FROM suburbs WHERE slug = 'rugby'),
  '403 Koeberg Road, Rugby, Cape Town, 7405', '021 503 5200', NULL, NULL,
  'Usave Rugby is a discount grocery store on Koeberg Road in Rugby.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/usave-rugby?to=place.ChIJl2H_PTtczB0RUkpQA_zBYXo", "https://www.yoys.co.za/phone_27-215035200_rugby_Cape-Town_ZA441897.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'usave-rugby-rugby'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-blinds-shutters-epping', 'Cape Blinds & Shutters',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Unit WS03, Epping Works, 4 Moorsom Avenue, Epping Industria 2, Cape Town, 7460', '082 411 8371', NULL, NULL,
  'Cape Blinds & Shutters is a supplier and installer of blinds and shutters based in Epping Industria.',
  NULL, NULL,
  '["https://capeblindsandshutters.co.za/contact-us/", "https://www.thebusinessdirectory.co.za/listings/cape-blinds-and-shutters/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-blinds-shutters-epping'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'global-parts-epping', 'Global Parts',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Unit 6 & 7, 27 Losack Avenue, Epping Industrial 2, Cape Town, 7460', '021 556 3467', NULL, NULL,
  'Global Parts is a supplier of replacement vehicle parts in Epping Industria.',
  NULL, NULL,
  '["https://www.globalparts.co.za/contact-us/", "https://www.brabys.com/za/western-cape/cape-town/epping-industria/motor-spares-accessories/global-parts"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'global-parts-epping'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'global-components-epping', 'Global Components',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Cnr Tripper Avenue & Bofors Circle, Epping Industria, Cape Town, 7460', '021 597 3600', NULL, NULL,
  'Global Components is a supplier of bus and truck spares in Epping Industria.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/bus-truck-spares/global-components", "https://www.searchinafrica.com/business/5831430/south-africa/western-cape/cape-town/epping-industria/bofors-cir/bus-truck-spares/global-components", "https://www.cybo.com/ZA-biz/global-components_2i"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'global-components-epping'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
