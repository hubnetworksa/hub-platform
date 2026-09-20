INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medleb-private-hospital-lebowakgomo', 'Medleb Private Hospital', (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Jane Furse Road, Lebowakgomo, 0737', '015 030 0106', NULL, 'unitmanager@medleb.co.za',
  'Medleb Private Hospital is a private acute rehabilitation hospital in Lebowakgomo, with an orthopaedic surgery department and a maternity ward.',
  NULL, NULL,
  '["https://rfmcf.co.za/search-medical-provider/hospital/hospital/medleb-private-hospital/186/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=395660"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medleb-private-hospital-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
