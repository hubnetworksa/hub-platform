INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'legends-barbershop-polokwane-central-polokwane-central', 'Legends Barbershop Polokwane Central',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '51 Market St, Polokwane Central, Polokwane, 0700', '078 761 1072', NULL, NULL,
  'Legends Barbershop Polokwane Central is a barbershop on Market Street in the Polokwane CBD.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/legends-barbershop-polokwane-central-market-street-polokwane-PVqEvb", "https://southafricafirm.com/limpopo/legends-barbershop-polokwane-central-52389"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'legends-barbershop-polokwane-central-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'barbershops'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'russells-polokwane-market-street-polokwane-central', 'Russells Polokwane Market Street',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Shop no 77, Market Street, Polokwane, 0700', '015 295 9296', NULL, NULL,
  'Russells Polokwane Market Street is a furniture and homeware store on Market Street in the Polokwane CBD.',
  -23.9062751, 29.4484213,
  '["https://www.russells.co.za/storelocator/store/index/id/474", "https://www.tiendeo.co.za/stores/polokwane/russells-joshua-doore-shop-no-market-street-polokwane/12973"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'russells-polokwane-market-street-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greywies-nu-clean-dry-cleaners-polokwane-central', 'Greywies Nu-Clean Dry Cleaners',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '02A Market St, Polokwane, 0700', '015 297 2381', NULL, NULL,
  'Greywies Nu-Clean Dry Cleaners is a dry cleaning service on Market Street in the Polokwane CBD.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/lp/polokwane/greywies-nu-clean-dry-cleaners", "https://polokwane.infoisinfo.co.za/search/dry-cleaner"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'greywies-nu-clean-dry-cleaners-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);
