-- Ruyterwacht suburb research (job 1)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lavish-nails-by-tia-ruyterwacht', 'Lavish Nails by Tia',
  (SELECT id FROM suburbs WHERE slug = 'ruyterwacht'),
  '2b Vereeniging Circle, Ruyterwacht, Cape Town', '+27 61 202 0082', NULL, NULL,
  'Lavish Nails by Tia is a nail and beauty salon in Ruyterwacht.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/lavish-nails-by-tia-vereeniging-circle-cape-town-rw74zG", "https://www.beautynailhairsalons.com/ZA/Ruyterwacht/109775213801771/Lavish-Nails-by-Tia"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavish-nails-by-tia-ruyterwacht'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
