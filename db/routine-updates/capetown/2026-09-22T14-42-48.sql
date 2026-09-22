INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sa-metal-group-epping', 'SA Metal Group',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '14 Christian Avenue, Epping 2, Cape Town, 7460', '021 590 3900', NULL, NULL,
  'SA Metal Group is a large metal recycling company in Epping, processing ferrous and non-ferrous scrap metal for local and export markets.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sa-metal-group-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'afrox-epping', 'Afrox',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '1 Jellicoe Avenue, Epping Industria, Cape Town, 7460', '021 530 1000', NULL, NULL,
  'Afrox is an industrial gas and welding products supplier with a branch in Epping Industria, part of the Linde Group.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'afrox-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-town-market-epping', 'Cape Town Market',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '110 Gunners Circle, Epping, Cape Town, 7460', '021 531 2191', NULL, NULL,
  'Cape Town Market is a commission-based fresh produce market in Epping, trading fruit and vegetables to the Western Cape wholesale and retail trade.',
  NULL, NULL,
  '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-town-market-epping'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'distell-epping', 'Distell',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '120 Bofors Circle, Epping Industria, Cape Town, 7460', '021 530 2200', NULL, NULL,
  'Distell is a large beverage manufacturer with a production and distribution facility, Green Park, in Epping Industria.',
  NULL, NULL,
  '["https://za.kompass.com/c/distell-cape-town/zan567928/", "https://www.callupcontact.com/b/business/Distell_Ltd/144688"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'distell-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
