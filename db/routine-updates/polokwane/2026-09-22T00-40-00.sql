-- moregloed suburb sweep: 1 new business (tenant of existing Library Gardens centre, polokwane-central suburb per that centre's existing suburb assignment)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-ta-lowan-polokwane-central', 'Dr TA Lowan',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'library-gardens-polokwane-central'),
  'Room 107, 1st Floor, Library Gardens, Corner Grobler & Schoeman Street, Polokwane, 0699', '015 291 3704', NULL, NULL,
  'A specialist general surgery practice at Library Gardens, Polokwane.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/lowan-ta-dr-polokwane", "https://www.yep.co.za/biz/store/iyp/2123160_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-ta-lowan-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
