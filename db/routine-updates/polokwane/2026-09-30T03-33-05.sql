INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bb-used-polokwane-polokwane-central', 'BB Used Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '90 Landdros Mare Street, Polokwane Central, Polokwane, 0699', '015 297 4823', NULL, NULL,
  'BB Used Polokwane is a used-vehicle dealership on Landdros Mare Street in Polokwane Central, part of the BB Group of dealerships.',
  NULL, NULL,
  '["https://www.cars.co.za/groups/Individual-Dealers/BB-Used-Polokwane/2798/", "https://bbused.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bb-used-polokwane-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
