INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'epping-property-thornton', 'Epping Property',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Unit 43, Viking Business Place, 29 Thor Circle, Thornton, Cape Town, 7460', '021 531 0026', 'https://www.eppingproperty.co.za', NULL,
  'Epping Property is a commercial property agency letting warehouse, office and business-park units in the Epping and Thornton industrial area, operating from Viking Business Place on Thor Circle.',
  NULL, NULL,
  '["https://www.eppingproperty.co.za/contact-us/", "https://www.findglocal.com/ZA/29-Thor-Circle%2C-Thornton/426191120743908/Epping-Property"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'epping-property-thornton'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-thornton', 'KFC Thornton',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Corner Thornton Way and Odin Drive, Thornton, Cape Town, 7485', '087 148 4430', NULL, NULL,
  'KFC Thornton is a fried-chicken fast-food restaurant on the corner of Thornton Way and Odin Drive, Thornton.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/kfc-thornton-23806418.html", "https://www.tiendeo.co.za/stores/cape-town/kfc-cnr-viking-way-odin-drive-thornton/75157"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-thornton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'viking-place-convenience-centre-thornton', 'Viking Place Convenience Centre',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Odin Drive, Thornton, Cape Town, 7485', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/viking-place-convenience-centre.html", "https://www.yep.co.za/biz/store/driver-excellence/665906"]',
  'mall'
);
