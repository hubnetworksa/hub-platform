INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'serumula-optometrists-lebowakgomo', 'Serumula Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'phasha-shopping-centre-lebowakgomo'),
  'Shop 23, Phasha Shopping Centre, Cnr R518 & R579, Lebowakgomo, 0737', '015 633 7291', NULL, NULL,
  'Serumula Optometrists is an optometry practice inside Phasha Shopping Centre, offering eye tests and optical products in Lebowakgomo.',
  NULL, NULL,
  '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/optometry/GEMS-Optometry-Network-Providers---Limpopo.pdf", "https://www.wooltruhealthcarefund.co.za/static-assets/siteFiles/whf_network_optometrist_list_limpopo_dec2025.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'serumula-optometrists-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalapeng-mall-lebo-pharmacy-lebowakgomo', 'Kalapeng Mall@Lebo Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 25, Mall@Lebo, Zone F, Lebowakgomo, 0737', '015 633 5396', NULL, 'spar@blackiq.co.za',
  'Kalapeng Mall@Lebo Pharmacy is a pharmacy branch inside Mall@Lebo, offering dispensing and everyday health products in Lebowakgomo.',
  NULL, NULL,
  '["https://x.com/KalapengP/status/1303398008306925568", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=326455"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalapeng-mall-lebo-pharmacy-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
