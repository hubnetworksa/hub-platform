INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ink-architects-the-orchards', 'Ink Architects',
  (SELECT id FROM suburbs WHERE slug = 'the-orchards'),
  'Ext 13, 16 Vlinderbos Cres, The Orchards, Akasia, 0201', '072 841 8258', 'https://inkarchitects.co.za', NULL,
  'Ink Architects is an architecture practice based in The Orchards, offering residential, commercial and industrial design services, with both onsite consultations and online appointments available.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Pretoria/Akasia/Other/Ink-Architects/store/23b1641", "https://www.goafricaonline.com/za/1296001-ink-architects", "https://pretoria.co.za/place/ink-architects"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ink-architects-the-orchards'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);
