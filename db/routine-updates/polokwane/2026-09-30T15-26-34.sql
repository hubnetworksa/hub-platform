INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'motis-furniture-wholesalers-superbia', 'Motis Furniture Wholesalers',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '26 Nikkel Street, Superbia, Polokwane, 0699', '015 292 0633', NULL, NULL,
  'Motis Furniture Wholesalers is a furniture wholesaler in Superbia, Polokwane.',
  NULL, NULL,
  '["https://www.shopshours.co.za/motis-furniture-wholesalers/polokwane/c-57f3c9f947d677c3b27a78ed", "https://www.thinklocal.co.za/biz/motis-furniture-wholesalers-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'motis-furniture-wholesalers-superbia'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
