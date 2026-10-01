INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coronation-bazaar-walmer-estate', 'Coronation Bazaar',
  (SELECT id FROM suburbs WHERE slug = 'walmer-estate'),
  '60 Coronation Road, Walmer Estate, Cape Town', '021 447 2996', NULL, NULL,
  'Coronation Bazaar is a long-running family-run general store at the corner of Coronation and Melbourne Roads, stocking everything from groceries and sweets to hardware, plumbing and electrical supplies, in Walmer Estate.',
  NULL, NULL,
  '["https://voicemap.me/tour/cape-town/changing-neighbourhoods-walmer-estate-and-upper-woodstock/sites/coronation-bazaar", "https://wego.here.com/south-africa/cape-town/24-7-convenience-store/coronation-bazaar--710k3vng-3a0ac4c14483467f9f314c010a4a3ce1?lang=en-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coronation-bazaar-walmer-estate'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);
