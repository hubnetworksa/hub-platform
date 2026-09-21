-- Mankweng: 2 new businesses discovered via general suburb research (job 1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'makanye-super-market-and-cash-and-carry-mankweng', 'Makanye Super Market and Cash and Carry',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'R71 Tzaneen Road, Ga-Makanye, Mankweng, 0727', '+27 72 774 0065', NULL, NULL,
  'Makanye Super Market and Cash and Carry is a wholesale supermarket in Ga-Makanye, Mankweng, offering grocery and cash-and-carry shopping to the local community.',
  NULL, NULL,
  '["https://b2bhint.com/en/company/za/makanye-super-market-and-cash-and-carry--K2014025308", "https://www.openhours-southafrica.com/en/mankweng/makanye-cash-and-carry-wholesale"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'makanye-super-market-and-cash-and-carry-mankweng'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masethe-bh-optometrists-mankweng', 'Masethe B.H Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  'Shop No. 3, Usave Complex, Ga-Maja Village, Farm Kopermyn 258KS, Mankweng', '081 348 9403', NULL, NULL,
  'Masethe B.H Optometrists is an optometry practice in Mankweng, providing eye examinations and vision care from its Usave Complex premises.',
  NULL, NULL,
  '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/optometry/GEMS-Optometry-Network-Providers---Limpopo.pdf", "https://www.medpages.info/sf/index.php?page=person&personcode=394829"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masethe-bh-optometrists-mankweng'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
