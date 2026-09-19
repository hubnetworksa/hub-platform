INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hillpet-construction-management-ladanna', 'Hillpet Construction Management',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '46 Pietersburg Street, Ladanna, Polokwane', '076 400 9097', NULL, NULL,
  'Hillpet Construction Management is a building construction and maintenance company, including plumbing services, operating from Pietersburg Street in Ladanna.',
  NULL, NULL,
  '["https://www.netpages.co.za/Polokwane/Hillpet+Construction+Management-788146.html", "https://www.shopshours.co.za/building-maintenance/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hillpet-construction-management-ladanna'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);
