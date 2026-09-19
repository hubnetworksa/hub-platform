INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-scrapyards-futura', 'Polokwane Scrapyards',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '37 Corundum Street, Futura, Polokwane, 0700', '015 293 0172', NULL, NULL,
  'Polokwane Scrapyards is a scrapyard dealing in used motor vehicle parts, exhaust systems and accessories, in Futura, Polokwane.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/polokwane-scrapyards-polokwane", "https://www.yep.co.za/biz/store/polokwane-scrapyards/180778"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'polokwane-scrapyards-futura'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
