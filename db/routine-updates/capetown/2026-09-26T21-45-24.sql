INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tannin-cape-town-cbd', 'Tannin',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '86 Bree Street, Cape Town, 8001', '010 825 6086', NULL, NULL,
  'Tannin is a wine bar and restaurant on Bree Street offering an extensive selection of wines by the glass, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.dineplan.com/restaurant/tannin", "https://whatsonincapetown.com/tannin-wine-bar-in-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tannin-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'culture-wine-bar-cape-town-cbd', 'Culture Wine Bar',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '103 Bree Street, Cape Town, 8001', '021 216 0035', NULL, NULL,
  'Culture Wine Bar is a wine bar on Bree Street offering wines by the glass and weekly live music, in Cape Town CBD.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/culture-wine-bar/", "https://www.eatout.co.za/venue/culture-wine-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'culture-wine-bar-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
