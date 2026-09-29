INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'golden-oak-spur-lyttelton', 'Golden Oak Spur',
  (SELECT id FROM suburbs WHERE slug = 'lyttelton'),
  'Shop 21, Jean Crossing, Jean Ave, Lyttelton AH, Centurion, 0140', '012 644 1055', NULL, NULL,
  'Golden Oak Spur is a branch of the Spur Steak Ranches steakhouse chain, serving steaks, burgers and ribs from Jean Crossing on Jean Avenue in Lyttelton AH, Centurion, open daily from 8am to 10pm.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Centurion/Centurion-Cbd/Restaurant/Golden-Oak-Spur/store/2360335", "https://wanderlog.com/place/details/2903118/golden-oak-spur"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'golden-oak-spur-lyttelton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
