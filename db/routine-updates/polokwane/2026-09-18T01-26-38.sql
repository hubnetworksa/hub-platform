-- Bendor suburb checkpoint (job 1): 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shell-bendor-service-station-bendor', 'Shell Bendor Service Station',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '343 De Wet Drive, Bendor, Polokwane, 0699', '015 296 4869', NULL, NULL,
  'Shell Bendor Service Station is a fuel station on De Wet Drive in Bendor, offering a convenience shop and a car wash alongside forecourt fuel service.',
  NULL, NULL,
  '["https://find.shell.com/za/fuel/10042716-bendor-service-station/en_ZA", "https://www.yep.co.za/biz/store/shell-bendor-services-station/334458"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shell-bendor-service-station-bendor'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
