-- Kensington suburb research (jobs 1-2): new shopping centre + 3 tenants
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kensington-shopping-centre-kensington', 'Kensington Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  '27 12th Avenue, Kensington, Cape Town, 7405', NULL, NULL,
  '["https://www.property24.com/to-rent/kensington/cape-town/western-cape/8010/115498190", "https://www.privateproperty.co.za/commercial-rentals/western-cape/cape-town/goodwood/goodwood/kensington/shop-1-kensington-centre/27-12th-avenue/RR4310061"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rossiers-pharmacy-kensington', 'Rossiers Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  (SELECT id FROM shopping_centers WHERE slug = 'kensington-shopping-centre-kensington'),
  'Shop 14, Kensington Shopping Centre, 12th Avenue, Kensington, Cape Town, 7405', '021 593 8406', NULL, NULL,
  'Rossiers Pharmacy is a pharmacy trading from Kensington Shopping Centre on 12th Avenue, Kensington.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=86785", "https://www.thinklocal.co.za/biz/rossiers-pharmacy-kensington", "https://www.brabys.com/za/western-cape/cape-town/kensington/pharmacies/rossiers-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rossiers-pharmacy-kensington'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-on-12th-avenue-kensington', 'SPAR on 12th Avenue',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  (SELECT id FROM shopping_centers WHERE slug = 'kensington-shopping-centre-kensington'),
  'Shop 18, 27 12th Avenue, Kensington, Cape Town, 7405', '021 203 1786', NULL, NULL,
  'SPAR on 12th Avenue is a Halaal supermarket trading from Kensington Shopping Centre on 12th Avenue, Kensington.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/spar-kensington-61426", "https://za.polomap.com/cape-town/85235", "https://www.spar.co.za/Home/Store-View/SPAR-on-12th-Avenue-Western-Cape"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-on-12th-avenue-kensington'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-kensington-kensington', 'PEP Kensington',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  (SELECT id FROM shopping_centers WHERE slug = 'kensington-shopping-centre-kensington'),
  'Shop 1, Kensington Shopping Centre, 12th Avenue, Kensington, Cape Town, 7405', '021 593 8261', NULL, NULL,
  'PEP Kensington is a branch of the PEP discount clothing and homeware chain, trading from Kensington Shopping Centre on 12th Avenue, Kensington.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-kensington-shopping-centre-avenue-kensington-cape-town-western-cape/21526", "https://my-catalogue.co.za/stores/cape-town/pep-stores/kensington-shopping-centre-12-avenue"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-kensington-kensington'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
