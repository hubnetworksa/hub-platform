-- Jobs 1-2: welgelegen suburb research (includes opportunistic tenant discovery
-- at neighbouring Cycad Centre, surfaced via Welgelegen search; tagged to the
-- centre's own established suburb, bendor-park, for consistency with its
-- existing tenants)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aecom-sa-welgelegen', 'AECOM SA (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'welgelegen'),
  '118 General Beyers Street, Welgelegen, Polokwane, 0699', '015 297 0024', NULL, NULL,
  'AECOM SA (Pty) Ltd is an engineering and infrastructure consultancy with an office in the Concillium Building, Welgelegen.',
  NULL, NULL,
  '["https://nearfinderza.com/business/limpopo/polokwane/aecom-sa-pty-ltd_95920+9.html", "https://www.dnb.com/business-directory/company-profiles/aecom-sa-(pty)-ltd.7c9b6edbc1447da2efc9f8ee52be578b"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aecom-sa-welgelegen'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'asian-cuisine-cycad-centre-bendor-park', 'Asian Cuisine Cycad Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'cycad-centre-bendor-park'),
  'Shop 22, 114 General Maritz Street, Cycad Centre, Bendor Park, Polokwane, 0699', '071 560 0919', NULL, NULL,
  'Asian Cuisine Cycad Centre is a restaurant serving Indian, Pakistani and Asian fusion dishes, in Cycad Centre, Bendor Park.',
  NULL, NULL,
  '["https://www.ubereats.com/za/store/asian-cuisine-cycad-centre/ymS9UyApWxC6cV5QXRGcTQ", "https://www.pricelisto.com/menu-prices/asian-cuisine-za/location/114-general-maritz-st-shop-22-cycad-centre-bendor-ext-59-polokwane-0022"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'asian-cuisine-cycad-centre-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
