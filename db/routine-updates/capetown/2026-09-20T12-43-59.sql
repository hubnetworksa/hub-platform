INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'builders-warehouse-constantiaberg-retreat', 'Builders Warehouse Constantiaberg',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  'Cnr Main Road and Bark Street, Retreat, Cape Town, 7945', '021 763 1032', NULL, NULL,
  'Builders Warehouse Constantiaberg is a hardware and building materials superstore, in Retreat.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/builders-warehouse-co-main-road-and-bark-street-retreat/4888", "https://www.brabys.com/za/western-cape/retreat/retreat-industrial/building-materials/builders-warehouse-constantiaberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'builders-warehouse-constantiaberg-retreat'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
