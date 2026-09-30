INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'northgate-estate-ysterplaat', 'Northgate Estate',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  'Platinum Road & Northgate Extension, Ysterplaat, Cape Town, 7405', NULL, NULL,
  '["https://northgateestate.co.za/find-shops/", "https://www.property24.com/property-values/gold-street/northgate-business-park/milnerton/western-cape/16638"]',
  'mall'
);
