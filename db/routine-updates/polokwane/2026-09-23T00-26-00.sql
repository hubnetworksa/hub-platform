INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shell-sediba-service-station-moregloed', 'Shell Sediba Service Station',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  '82 Webster & Grobler Street, Moregloed, Polokwane, 0700', '084 778 8118', 'https://shellsediba.co.za', NULL,
  'Shell Sediba Service Station is a Shell-branded fuel station in Moregloed with an attached SPAR Express convenience store and a car wash.',
  NULL, NULL,
  '["https://find.shell.com/za/fuel/10042980-sediba-service-station/en_ZA", "https://shellsediba.co.za/contact-us.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shell-sediba-service-station-moregloed'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
