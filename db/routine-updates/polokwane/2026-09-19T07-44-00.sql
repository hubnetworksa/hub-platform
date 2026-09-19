INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ap-kerk-pietersburg-welgelegen', 'AP Kerk Pietersburg',
  (SELECT id FROM suburbs WHERE slug = 'welgelegen'),
  '89 Diemeer Street, Welgelegen, Polokwane, 0699', '015 298 8028', NULL, NULL,
  'AP Kerk Pietersburg is an Afrikaanse Protestantse Kerk (Afrikaans Protestant Church) congregation in Welgelegen.',
  NULL, NULL,
  '["https://www.openhours-southafrica.com/en/polokwane/ap-kerk-pietersburg", "https://rsa.worldorgs.com/catalog/polokwane/church/ap-kerk-pietersburg", "https://www.facebook.com/APKerkPietersburg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ap-kerk-pietersburg-welgelegen'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);
