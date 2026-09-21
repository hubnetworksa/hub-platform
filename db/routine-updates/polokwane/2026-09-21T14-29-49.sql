INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'palm-health-medi-centre-moregloed', 'Palm Health Medi Centre',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  (SELECT id FROM shopping_centers WHERE slug = 'palm-centre-moregloed'),
  'Shop 23, Palm Centre, Cnr Hans van Rensburg & Grobler St, Moregloed, Polokwane, 0699',
  '015 295 7693', 'https://palmhealth.co.za', NULL,
  'Palm Health Medi Centre is a general practice inside Palm Centre, Moregloed, founded in 2013, offering medical consultations alongside occupational health services for companies and their employees.',
  NULL, NULL,
  '["https://palmhealth.co.za", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=172740"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'palm-health-medi-centre-moregloed'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);
