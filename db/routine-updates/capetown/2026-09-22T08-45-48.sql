INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'panorama-shopping-centre-panorama', 'Panorama Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '101 Hendrik Verwoerd Drive, Panorama, Cape Town, 7500', NULL, NULL,
  '["https://my-catalogue.co.za/stores/panorama/pick-n-pay/101-hendrik-verwoerd-drv", "https://www.guzzle.co.za/malls/748/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-panorama-shopping-centre-panorama', 'Pick n Pay Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  (SELECT id FROM shopping_centers WHERE slug = 'panorama-shopping-centre-panorama'),
  '101 Hendrik Verwoerd Drive, Panorama Shopping Centre, Panorama, Cape Town, 7500', '021 939 1472', NULL, NULL,
  'Pick n Pay Panorama is a supermarket inside Panorama Shopping Centre in Panorama.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pick-n-pay-hendrik-verwoerd-drv-panorama/43968", "https://nearbyza.com/place/pick-n-pay-panorama"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-panorama-shopping-centre-panorama'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panorama-physio-rehab-centre-panorama', 'Panorama Physio & Rehab Centre',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Rothschild Boulevard, Panorama, Cape Town, 7500', '021 930 1130', NULL, NULL,
  'Panorama Physio & Rehab Centre is a physiotherapy and rehabilitation practice on Rothschild Boulevard in Panorama.',
  NULL, NULL,
  '["https://dir.alltrack.org/view/175496-3-panorama-physio--rehab-centre", "https://nearbyza.com/place/panorama-physio-rehab-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panorama-physio-rehab-centre-panorama'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);
