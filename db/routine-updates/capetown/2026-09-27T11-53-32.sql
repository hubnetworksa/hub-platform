-- Job 1/2: kirstenhof suburb research -- 2 new standalone businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'orka-paddles-kirstenhof', 'ORKA Paddles',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  '391 Main Road, Kirstenhof, Cape Town, 7965', '021 701 7913', NULL, NULL,
  'ORKA Paddles is a specialist surfski and kayak paddling shop on Main Road, Kirstenhof, also serving as a Thule fitment centre.',
  NULL, NULL,
  '["https://www.orkapaddles.com/contact/", "https://readymap.co.za/4/53368"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'orka-paddles-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kirstenhof-car-sales-kirstenhof', 'Kirstenhof Car Sales',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  '367 Main Road, corner Aberfeldy Road, Kirstenhof, Cape Town', '083 459 5749', NULL, NULL,
  'Kirstenhof Car Sales is a used car dealership on the corner of Main and Aberfeldy Roads, Kirstenhof.',
  NULL, NULL,
  '["https://za.onsono.com/kirstenhof-car-sales-cape-town/", "https://www.xpose.co.za/listings/kirstenhof-car-sales-kirstenhof/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kirstenhof-car-sales-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
