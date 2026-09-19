INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-atm-foodzone-ivy-park-ivy-park', 'Nedbank ATM Foodzone Ivy Park',
  (SELECT id FROM suburbs WHERE slug = 'ivy-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'ivy-park-centre-ivy-park'),
  '34 Campbell Street, Ivy Park Centre, Ivy Park, Polokwane, 0699', '080 011 0929', NULL, NULL,
  'Nedbank ATM Foodzone Ivy Park is a standalone, 24-hour Nedbank ATM inside Ivy Park Centre, Ivy Park.',
  NULL, NULL,
  '["http://textmap.co.za/141/9429", "https://za.polomap.com/polokwane/15715", "https://www.yoys.co.za/phone_27-800110929_atm_Polokwane_ZA383196.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-atm-foodzone-ivy-park-ivy-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
