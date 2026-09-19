INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pest-control-hygiene-and-cleaning-flora-park', 'Pest Control Hygiene and Cleaning',
  (SELECT id FROM suburbs WHERE slug = 'flora-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'flora-park-shopping-centre-flora-park'),
  '293 Marshall Street, Flora Park Shopping Centre, Flora Park, Polokwane, 0699', '015 296 3913', NULL, 'pestcontrolhygiene.c@gmail.com',
  'Pest Control Hygiene and Cleaning is a pest control and hygiene services company with over 25 years of experience, offering residential and commercial pest control, inside Flora Park Shopping Centre, Flora Park.',
  NULL, NULL,
  '["https://www.aiyellow.com/pestcontrolhygieneandcleaning/?lang=it", "https://pchcpolokwane.business.site/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pest-control-hygiene-and-cleaning-flora-park'),
  (SELECT id FROM categories WHERE slug = 'pest-control'),
  1
);
