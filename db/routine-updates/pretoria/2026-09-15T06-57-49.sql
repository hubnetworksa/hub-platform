INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eersterust-plaza-eersterust', 'Eersterust Plaza',
  (SELECT id FROM suburbs WHERE slug = 'eersterust'),
  'Cnr Hans Coverdale & West Street, Eersterust, Pretoria', NULL, NULL,
  '["https://www.guzzle.co.za/malls/264/", "https://nearbyza.com/place/eersterust-plaza", "https://za.top10place.com/eersterust-plaza-eersterust-618941121.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stadium-pharmacy-eersterust', 'Stadium Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'eersterust'),
  '218 Job Ave, Eersterust, Pretoria, 0022', '012 806 6370', NULL, NULL,
  'Stadium Pharmacy is a pharmacy on Job Ave in Eersterust, Pretoria.',
  NULL, NULL,
  '["https://www.ananzi.co.za/ads/za/gauteng/pretoria/eersterust/pharmacies/stadium-pharmacy", "https://www.searchinafrica.com/business/3306840/south-africa/gauteng/pretoria/eersterust/job-ave/pharmacies/stadium-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stadium-pharmacy-eersterust'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bp-eersterust-motors-eersterust', 'BP Eersterust Motors',
  (SELECT id FROM suburbs WHERE slug = 'eersterust'),
  '256 Hans Coverdale Rd W, Eersterust, Pretoria', '012 806 5443', NULL, NULL,
  'BP Eersterust Motors is a BP-branded fuel station on Hans Coverdale Road West in Eersterust, Pretoria.',
  NULL, NULL,
  '["http://textmap.co.za/6/24396", "https://www.callupcontact.com/b/businessprofile2/BP_Eersterust_Motors/4476047"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bp-eersterust-motors-eersterust'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
