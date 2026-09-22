-- Jobs 1-2: Bergvliet suburb sweep
-- New shopping centre: Harry Goemans Centre, 151 Main Road (already referenced in
-- existing Mullers Dental Studio's address text, but that row is left untouched --
-- retroactively linking an existing business is out of scope for jobs 1-2)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'harry-goemans-centre-bergvliet', 'Harry Goemans Centre',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '151 Main Road, Bergvliet, Cape Town, 7945', NULL, NULL,
  '["https://www.buco.co.za/bergvliet", "https://za.africabz.com/western-cape/buco-bergvliet-181642"]',
  'centre'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buco-bergvliet', 'BUCO Bergvliet',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'harry-goemans-centre-bergvliet'),
  'Shop 11, Harry Goemans Centre, 151 Main Road, Bergvliet, Cape Town, 7945', '021 712 4400', 'https://www.buco.co.za/bergvliet', NULL,
  'BUCO Bergvliet is a hardware and building supplies branch of the BUCO chain at Harry Goemans Centre, stocking tools, hardware, electrical and plumbing supplies.',
  NULL, NULL,
  '["https://www.buco.co.za/bergvliet", "https://za.africabz.com/western-cape/buco-bergvliet-181642"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'buco-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

-- Sherwood Shopping Centre tenant (existing centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'swimmattix-swim-school-bergvliet', 'Swimmattix Swim School',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Shop 3, Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '021 827 9768', 'http://www.swimmattix.com', 'info@swimmattix.com',
  'Swimmattix Swim School is an internationally accredited swim school at Sherwood Centre offering baby classes, learn-to-swim lessons, group and adult lessons, and aqua aerobics.',
  NULL, NULL,
  '["https://sherwoodshopping.co.za/swimmattix-swim-school/", "http://www.swimmattix.com/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'swimmattix-swim-school-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
