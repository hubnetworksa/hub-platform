INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kimberly-clark-epping', 'Kimberly-Clark',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '31 Hewett Avenue, Epping Industria 2, Cape Town, 7460', '021 530 2100', 'https://www.kimberly-clark.com/en-za/southafrica', NULL,
  'Kimberly-Clark operates a paper products manufacturing facility on Hewett Avenue in Epping Industria.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/kimberly-clark-hewett-ave-epping-industria-2,-cape-town", "https://za.kompass.com/c/kimberly-clark-cape-town/zan299893/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kimberly-clark-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gsk-epping', 'GSK',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '39 Hawkins Avenue, Epping Industria 1, Cape Town, 7460', '021 507 6100', 'https://www.gsk.com/en-gb/locations/south-africa/', NULL,
  'GSK operates a pharmaceutical manufacturing plant on Hawkins Avenue in Epping Industria.',
  NULL, NULL,
  '["https://panjiva.com/Glaxosmithkline-SA-Pty-Ltd/2707754", "https://www.thinklocal.co.za/biz/glaxosmithkline-cape-town-1"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gsk-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'county-fair-epping', 'County Fair',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '25 Bofors Circle, Epping Industria, Cape Town, 7460', '021 505 8000', 'https://www.countyfair.co.za', NULL,
  'County Fair is a poultry and egg products merchant with a facility on Bofors Circle in Epping Industria.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/county-fair-37960", "https://www.ananzi.co.za/ads/za/western-cape/cape-town/epping-industria/poultry-products/county-fair-foods-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'county-fair-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'quality-beverages-epping', 'Quality Beverages',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '10 Benbow Avenue, Epping Industria 1, Cape Town, 7460', '021 534 8070', NULL, NULL,
  'Quality Beverages is a beverage manufacturer based on Benbow Avenue in Epping Industria.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10653045_2", "https://www.thinklocal.co.za/biz/quality-beverages-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'quality-beverages-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'indigo-brands-epping', 'Indigo Brands',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '16-20 Evans Avenue, Epping Industria 1, Cape Town, 7460', '021 507 8500', 'https://www.indigobrands.com', NULL,
  'Indigo Brands (formerly Indigo Cosmetics) is a cosmetics and fragrance manufacturer based on Evans Avenue in Epping Industria.',
  NULL, NULL,
  '["https://www.indigobrands.com/contact-us/", "https://hombaze.co.za/indigo-brands-6398750189483727158/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'indigo-brands-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
