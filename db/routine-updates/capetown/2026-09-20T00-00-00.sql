INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-gugulethu-square-gugulethu', 'Clicks Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Gugulethu Square, Cnr NY1 & NY6, Gugulethu, Cape Town, 7750', '021 638 4087', NULL, NULL,
  'Clicks Gugulethu Square is a pharmacy and health, beauty and homeware retailer in Gugulethu Square, Gugulethu.',
  NULL, NULL,
  '["https://clicks.co.za/store/Gugulethu-Square/1583", "https://www.tiendeo.co.za/stores/cape-town/clicks-gugulethu-square-co-ny-and-ny/27829"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mzolis-place-gugulethu', 'Mzoli''s Place',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  '150 NY111, off Klipfontein Road, Gugulethu, Cape Town', '021 419 0130', NULL, NULL,
  'Mzoli''s Place is a well-known butchery and braai restaurant in Gugulethu, where customers buy meat to have grilled on-site.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/mzoli-directions", "https://www.lekkeslaap.co.za/attractions/mzolis-place"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mzolis-place-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
