INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'livecopper-brooklyn', 'Livecopper',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  'Unit 1, 10 Gold Street, Northgate Estate, Brooklyn, Cape Town, 7405', '021 200 5859', 'https://www.livecopper.co.za/', NULL,
  'Livecopper is a lighting, electrical and plumbing supply retailer in Northgate Estate, Brooklyn.',
  NULL, NULL,
  '["https://www.livecopper.co.za/pages/contact-us", "https://www.facebook.com/livecopper.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'livecopper-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'italtile-cape-brooklyn', 'Italtile Cape',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  'Northgate Estate, Gold Street, Brooklyn, Cape Town, 7405', '021 510 7766', 'https://www.italtile.co.za/', NULL,
  'Italtile Cape is a tile, sanitaryware and bathroom fittings retailer in Northgate Estate, Brooklyn.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/italtile-cape-town-49339", "https://northgateestate.co.za/italtile/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'italtile-cape-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);
