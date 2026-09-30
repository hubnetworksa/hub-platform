INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-di-da-hair-studio-the-willows', 'La-Di-Da Hair Studio',
  (SELECT id FROM suburbs WHERE slug = 'the-willows'),
  '573 Rossouw St, The Willows, Pretoria, 0041', '067 282 4142', NULL, NULL,
  'La-Di-Da Hair Studio is a hair salon at The Space in The Willows, Pretoria, offering haircuts, colour treatments, balayage, scalp care, hair extensions and special-occasion styling.',
  NULL, NULL,
  '["https://www.fresha.com/lp/pt/bt/cabeleireiros/za-pretória/the-willows", "https://thespacewellness.co.za/tenants/la-di-da-hair-studio/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-di-da-hair-studio-the-willows'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'afro-boer-the-willows', 'Afro-Boer',
  (SELECT id FROM suburbs WHERE slug = 'the-willows'),
  '1 Meerlust Business Village, Cnr Meerlust & Lynnwood Rd, The Willows, Pretoria', '012 807 3099', 'https://www.afroboer.co.za/', NULL,
  'Afro-Boer is a baker''s cafe in The Willows, Pretoria, serving cakes, tarts and quiches alongside coffee, light meals and wine, with garden seating and a dedicated wine room, open daily from 07:00 to 17:30.',
  NULL, NULL,
  '["https://www.afroboer.co.za/", "https://neighbourhoodgems.eatout.co.za/restaurants/afro-boer/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'afro-boer-the-willows'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
