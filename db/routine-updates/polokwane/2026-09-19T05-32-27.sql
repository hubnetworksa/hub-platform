INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-gj-van-rooyen-bendor', 'Dr GJ van Rooyen',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '29 Bendor Drive, Bendor, Polokwane, 0699', '015 297 1089', NULL, NULL,
  'Dr GJ van Rooyen is a general practice offering medical consultations, in Bendor, Polokwane.',
  NULL, NULL,
  '["https://www.findmy.co.za/services/business/van-rooyen-gj-dr/29014", "https://www.africanadvice.com/1238071/General_Practitioners/Limpopo/Dr_Gj_Van_Rooyen/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-gj-van-rooyen-bendor'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);
