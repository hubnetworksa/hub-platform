INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-wynberg-wynberg', 'Spec-Savers Wynberg',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  'Shop 15, Maynard Mall, Cnr Main & Wetton Road, Wynberg, Cape Town, 7824', '021 762 8550', NULL, NULL,
  'Spec-Savers Wynberg is an optometry practice offering eye tests and eyewear, in Maynard Mall, Wynberg.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/wynberg", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=358018"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-wynberg-wynberg'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
