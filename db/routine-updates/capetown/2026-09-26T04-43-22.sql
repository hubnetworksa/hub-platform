INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medicare-pharmacy-retreat', 'Medicare Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  'Allpark Building, 175 Retreat Road, Retreat, Cape Town, 7945', '021 712 8689', NULL, NULL,
  'Medicare Pharmacy is a retail pharmacy in the Allpark Building on Retreat Road, Retreat.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=87314", "https://www.cylex.net.za/company/medicare-pharmacy-15488470.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medicare-pharmacy-retreat'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'retreat-motor-spares-retreat', 'Retreat Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  '93 Tenth Avenue, Cafda Village, Retreat, Cape Town, 7945', '021 712 2533', NULL, NULL,
  'Retreat Motor Spares is a motor vehicle parts and accessories store on Tenth Avenue in Cafda Village, Retreat.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/retreat-motor-spares-021-712-2533", "https://nearfinderza.com/en/business/wc/cape-town/motor-car-parts-new/retreat-motor-spares_394032+5.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'retreat-motor-spares-retreat'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'poppys-village-retreat', 'Poppys Village',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  '66 7th Avenue & Retreat Road, Retreat, Cape Town, 7945', NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-poppys-village-th-avenue-retreat-road-retreat-cape-town-western-cape/11883", "https://za.africabz.com/western-cape/pep-retreat-190829"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-poppys-village-retreat', 'PEP Poppys Village',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  (SELECT id FROM shopping_centers WHERE slug = 'poppys-village-retreat'),
  'Shop 7, Poppys Village, 66 7th Avenue, Retreat, Cape Town, 7945', '021 712 1211', NULL, NULL,
  'PEP Poppys Village is a clothing, footwear and homeware store in Poppys Village on 7th Avenue, Retreat, part of the national PEP chain.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-poppys-village-th-avenue-retreat-road-retreat-cape-town-western-cape/11883", "https://za.africabz.com/western-cape/pep-retreat-190829", "https://nearbyza.com/place/pep-store-65"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-poppys-village-retreat'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
