-- Lansdowne suburb research: 3 new standalone businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'urban-health-pharmacy-lansdowne', 'Urban Health Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '406 Imam Haron Road, Lansdowne, Cape Town, 7780', '021 696 1532', NULL, NULL,
  'Urban Health Pharmacy is a pharmacy, in Lansdowne.',
  NULL, NULL,
  '["https://wecarepharmacy.co.za/urban-health-pharmacy-lansdowne/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=84896", "https://za.africabz.com/western-cape/urban-health-pharmacy-lansdowne-323735"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'urban-health-pharmacy-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vitacare-pharmacy-lansdowne', 'Vitacare Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  'Office No. 650, Aslam Centre, 650 Lansdowne Rd, Lansdowne, Cape Town, 7780', '021 703 5619', NULL, NULL,
  'Vitacare Pharmacy is a pharmacy, in Lansdowne.',
  NULL, NULL,
  '["https://homeappliancerepairs.co.za/5855718136047698612/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=87772", "https://www.searchinafrica.com/business/3688909/south-africa/western-cape/cape-town/lansdowne/lansdowne-rd/pharmacies/vitacare-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vitacare-pharmacy-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'house-of-lipstick-lansdowne', 'House of Lipstick',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '199 Haywood Road, Lansdowne, Cape Town', '+27 82 715 6489', 'https://houseoflipstick.co.za', NULL,
  'House of Lipstick is a cosmetics, perfume and accessories retailer, in Lansdowne.',
  NULL, NULL,
  '["https://www.facebook.com/p/House-of-Lipstick-100089651123092/", "https://houseoflipstick1.com/", "https://oncosmetics.com/company/house-of-lipstick/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'house-of-lipstick-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
