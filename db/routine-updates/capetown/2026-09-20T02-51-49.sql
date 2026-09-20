-- Beacon Valley suburb research: Liberty Promenade Shopping Centre (new, queued for job 3) + 2 tenants

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'liberty-promenade-beacon-valley', 'Liberty Promenade Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  'Cnr AZ Berman Drive & Morgenster Road, Beacon Valley, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://www.bus-ex.com/article/liberty-promenade-shopping-centre", "https://community-services.blaauwberg.net/halls-venue-hire/halls-and-venues-for-hire-cape-town/beacon-valley-centre", "https://libertypromenade.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-liberty-promenade-beacon-valley', 'Woolworths Liberty Promenade',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-beacon-valley'),
  'Cnr AZ Berman Drive & Morgenster Road, Liberty Promenade, Beacon Valley, Mitchells Plain, Cape Town, 7785', '021 377 4000', NULL, NULL,
  'Woolworths Liberty Promenade is a supermarket and department store offering groceries, clothing, beauty and homeware, in Liberty Promenade, Beacon Valley.',
  NULL, NULL,
  '["https://libertypromenade.co.za/shops/woolworths/", "https://www.tiendeo.co.za/stores/kuils-river/woolworths-the-promenade-cnr-az-berman-morgenster-rd-mitchells-plain/44424"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-liberty-promenade-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romans-pizza-liberty-promenade-beacon-valley', 'Romans Pizza Liberty Promenade',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-beacon-valley'),
  'Shop 190, Cnr AZ Berman Drive & Morgenster Road, Liberty Promenade, Beacon Valley, Mitchells Plain, Cape Town, 7785', '021 376 7447', NULL, NULL,
  'Romans Pizza Liberty Promenade is a pizza takeaway and restaurant, in Liberty Promenade, Beacon Valley.',
  NULL, NULL,
  '["https://libertypromenade.co.za/shops/romans-pizza/", "http://textmap.co.za/3/47913", "https://vymaps.com/ZA/ROMANS-PIZZA-164648/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romans-pizza-liberty-promenade-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
