INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-best-laser-skin-vredehoek', 'The Best Laser & Skin',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '25 Derry Street, Vredehoek, Cape Town, 8001', '021 465 2963', NULL, NULL,
  'The Best Laser & Skin is a laser and skin-care clinic on Derry Street in Vredehoek, offering facials, laser treatments and other spa services.',
  NULL, NULL,
  '["https://www.fresha.com/a/the-best-laser-skin-cape-town-25-derry-street-c1683yxs", "https://za.africabz.com/western-cape/the-best-laser-skin-83144"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-best-laser-skin-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
