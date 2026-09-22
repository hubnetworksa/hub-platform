-- Jobs 1-2: Tokai suburb sweep (1 new shopping centre, 1 new business)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tokai-on-main-tokai', 'Tokai on Main',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Main Road, Tokai, Cape Town', NULL, NULL,
  '["https://www.guzzle.co.za/malls/1141/", "https://www.mallguide.co.za/malls/view/920/tokai-on-main-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-brasserie-tokai', 'The Brasserie',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Shop 1, Forest Glade House, Tokai Road, Tokai, Cape Town', '087 700 3273', 'https://brasseriect.co.za', NULL,
  'The Brasserie is a French and Italian-inspired restaurant in Tokai, at Forest Glade House on Tokai Road.',
  NULL, NULL,
  '["https://brasseriect.co.za/contact/", "https://insideguide.co.za/cape-town/specials/brasserie-lunch-club/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-brasserie-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
