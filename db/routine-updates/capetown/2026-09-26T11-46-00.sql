-- Simon's Town: 2 new businesses, both standalone
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kukoma-coffee-co-simons-town', 'Kukoma Coffee Co.',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '136 St George''s Street, Simon''s Town, Cape Town, 7995', '084 202 6539', 'https://kukomacoffee.com/', NULL,
  'Kukoma Coffee Co. is a coffee roastery and cafe on St George''s Street, sourcing and roasting African coffee, in Simon''s Town.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/kukoma", "https://kukomacoffee.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kukoma-coffee-co-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'collectables-hub-and-cafe-simons-town', 'Collectables Hub & Cafe',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Meeting Place Building, 98 St George''s Street, Simon''s Town, Cape Town, 7975', '082 088 7174', NULL, NULL,
  'Collectables Hub & Cafe is an antiques and retro-memorabilia store with an attached cafe, opposite the harbour entrance in Simon''s Town.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/collectables-hub", "https://www.tripadvisor.com/Restaurant_Review-g319718-d23888880-Reviews-Collectables_Hub_Cafe-Simon_s_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'collectables-hub-and-cafe-simons-town'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
