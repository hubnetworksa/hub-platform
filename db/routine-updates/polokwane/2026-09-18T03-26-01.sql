INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nederduitsch-hervormde-kerk-welgelegen-welgelegen', 'Nederduitsch Hervormde Kerk Welgelegen',
  (SELECT id FROM suburbs WHERE slug = 'welgelegen'),
  '83 Grimbeek Street, Polokwane, 0700', '015 295 5464', NULL, NULL,
  'A Nederduitsch Hervormde (Dutch Reformed) congregation serving the Welgelegen community in Polokwane.',
  NULL, NULL,
  '["https://nearbyza.com/place/nederduitsch-hervormde-kerk-van-afrika-welgelegen-pietersbur", "https://www.thinklocal.co.za/biz/nederduitsch-hervormde-kerk-welgelegen-gemeente-pastorie-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nederduitsch-hervormde-kerk-welgelegen-welgelegen'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);
