INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelsig-secondary-school-tafelsig', 'Tafelsig Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  'Spine Road, Tafelsig, Mitchells Plain, Cape Town, 7798', '021 397 6031', NULL, NULL,
  'Tafelsig Secondary School is a public high school in Tafelsig, Mitchells Plain, Cape Town.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/tafelsig-secondary-school-in-cape-town", "https://skools.co.za/listings/tafelsig-secondary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelsig-secondary-school-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
