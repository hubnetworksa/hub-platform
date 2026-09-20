INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'westgate-mall-westgate', 'Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  'Cnr Jakes Gerwel Drive & Morgenster Road, Westgate, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://www.facebook.com/WestgateMallMitchellsPlain/", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/cape-town/westgate-mall-mitchells-plain-cape-town-2632", "https://westgate-mall.co.za/about-us/"]',
  'mall'
);
