INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-bank-seshego', 'Absa Bank Seshego',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '52 Kwena Moloto Street, Seshego', '0860 008 600', NULL, NULL,
  'Absa Bank Seshego is a bank branch on Kwena Moloto Street offering everyday banking and ATM services, in Seshego.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/seshego/absa-bank-kwena-moloto-street-seshego-b/56308", "https://vymaps.com/ZA/Absa-bank-211608/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-bank-seshego'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'seshego-medical-depot-seshego', 'Seshego Medical Depot',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '30 Main Road, Seshego', '015 223 9000', NULL, NULL,
  'Seshego Medical Depot is a pharmaceutical distribution and wholesale depot supplying medical stock in Seshego.',
  NULL, NULL,
  '["https://2pos.co.za/94/3830", "https://za.readymap.info/188/7660", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=259593"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'seshego-medical-depot-seshego'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
