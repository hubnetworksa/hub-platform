-- thin-pages pretoria batch 03: checkpoint 5 (Rooihuiskraal North / Industrial Suppliers & Manufacturing)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'rubberite-rooihuiskraal-north', 'RubbeRite',
  (SELECT id FROM suburbs WHERE slug = 'rooihuiskraal-north'),
  'Unit 20, Miracle Park, Cnr Lenchen & Old JHB Roads, Rooihuiskraal, Centurion, 0157', '012 327 7984', 'https://rubberite.co.za', 'centurion@rubberite.co.za',
  'RubbeRite is a rubber products supplier trading from Miracle Park, on the corner of Lenchen and Old Johannesburg Roads in Rooihuiskraal North, with two further branches elsewhere in South Africa. The company stocks a wide range of industrial and automotive rubber components, including window and wheel-arch rubbers, hoses, grommets, foam and sponge, flooring and sheeting, exhaust hangers, CV boots, bushes and tank straps.

Customers can order online for nationwide delivery or buy directly from the Rooihuiskraal North branch, which also handles trade and custom orders for workshops and manufacturers. With close to three decades in the rubber supply business, RubbeRite serves both individual customers and businesses across Rooihuiskraal North and the wider Centurion area needing rubber parts that general hardware or automotive stores do not stock.',
  'Mon-Thu 08:00-16:30, Fri 08:00-15:00, Sat 08:00-12:00, Sun Closed',
  NULL, NULL,
  '["https://rubberite.co.za/contact", "https://www.autoyas.com/ZA/Rooihuiskraal/518686268168343/RubbeRite-Pty-Ltd", "https://www.facebook.com/rubberite/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rubberite-rooihuiskraal-north'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
