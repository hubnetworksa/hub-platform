INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bantry-bay-pharmacy-bantry-bay', 'Bantry Bay Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '29 Victoria Road, Bantry Bay, Cape Town, 8005', '021 439 2290', 'https://www.bantrybaypharmacy.co.za/', NULL,
  'Bantry Bay Pharmacy is a retail pharmacy with pharmacists, a skin care specialist and a resident nurse, in Bantry Bay.',
  NULL, NULL,
  '["https://www.bantrybaypharmacy.co.za/contact-us", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=147234"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bantry-bay-pharmacy-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
