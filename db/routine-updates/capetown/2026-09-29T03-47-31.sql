INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carole-nevin-designs-marina-da-gama', 'Carole Nevin Designs',
  (SELECT id FROM suburbs WHERE slug = 'marina-da-gama'),
  '30 Eastlake Drive, Marina Da Gama, Muizenberg, Cape Town, 7945', '021 788 1077', NULL, NULL,
  'Carole Nevin Designs is a homeware and decor factory shop and showroom in Marina Da Gama, known for locally made decorative pieces such as African water carriers.',
  NULL, NULL,
  '["https://cape-town-south-africa.bizfax.co.za/carole-nevin-designs-factory.html", "https://carolenevin.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carole-nevin-designs-marina-da-gama'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
