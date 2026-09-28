INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eyecatchers-mall-of-the-north-bendor', 'Eyecatchers Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'),
  'Shop U8a, Mall of the North, Cnr R81 & N1 Bypass, Bendor, Polokwane, 0699', '015 880 1890', 'https://mallofthenorth.co.za/shop/eye-catchers/', NULL,
  'Eyecatchers Optometrists is an eye-care practice inside Mall of the North, part of a nationwide network offering eye exams, spectacles and contact lenses.',
  NULL, NULL,
  '["https://mallofthenorth.co.za/shop/eye-catchers/", "https://nearmedoctors.com/business/eyecatchers-polokwane-best-ophthalmologist-in-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eyecatchers-mall-of-the-north-bendor'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
