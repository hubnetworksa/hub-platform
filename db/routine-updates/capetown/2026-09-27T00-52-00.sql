INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'utopia-dining-elevated-de-waterkant', 'Utopia Dining Elevated',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '40 Chiappini Street, 15th Floor, Mirage Building, De Waterkant, Cape Town, 8001', '021 418 3065', NULL, NULL,
  'Utopia Dining Elevated is a rooftop restaurant and bar on the 15th floor of the Mirage building in De Waterkant, Cape Town.',
  NULL, NULL,
  '["https://www.therooftopguide.com/rooftop-bars-in-cape-town/utopia-dining-elevated.html", "https://dbd.directory/business-directory/utopia-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'utopia-dining-elevated-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
