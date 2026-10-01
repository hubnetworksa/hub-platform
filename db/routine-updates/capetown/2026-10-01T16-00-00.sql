INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rosebank-progress-college-rosebank', 'Rosebank Progress College',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '20 Main Road, Rosebank, Cape Town, 7700', '021 686 7280', NULL, NULL,
  'Rosebank Progress College is a small independent private secondary school, formed from the merger of Rosebank House Damelin College and Progress College, in Rosebank.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/rosebank-progress-college-in-cape-town", "https://schoolsdigest.co.za/listings/rosebank-progress-college/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rosebank-progress-college-rosebank'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
