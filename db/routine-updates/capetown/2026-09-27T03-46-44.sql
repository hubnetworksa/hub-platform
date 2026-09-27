-- Jobs 1-2: mouille-point suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mouille-point-village-mouille-point', 'Mouille Point Village',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'Westridge, 93 Beach Road, Mouille Point, Cape Town, 8001', '+27 64 802 4747', NULL, NULL,
  'Mouille Point Village is a self-catering apartment complex on Beach Road in Mouille Point, within walking distance of the V&A Waterfront.',
  NULL, NULL,
  '["https://mouillepoint.com/contact/", "https://www.booking.com/hotel/za/mouille-point-village.en-gb.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mouille-point-village-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '8-hair-mouille-point', '8.hair',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'Rothesay Place, Mouille Point, Cape Town, 8005', '021 434 2470', NULL, NULL,
  '8.hair is an upmarket hair salon in Mouille Point.',
  NULL, NULL,
  '["https://www.hairnews.co.za/single-post/2019/10/07/salon-decor-tour-8hair-mouille-point-cape-town", "https://www.beautynailhairsalons.com/ZA/Cape-Town/129671873770146/8.hair"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '8-hair-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'callo-hair-designs-mouille-point', 'Callo Hair Designs',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '3B New Cumberland, Bay Road, Mouille Point, Cape Town, 8005', '021 439 3839', NULL, NULL,
  'Callo Hair Designs is a unisex hairdressing salon on Bay Road in Mouille Point.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2661003_2", "https://www.brabys.com/za/western-cape/cape-town/mouille-point/unisex-hairdressers/callo-hair-designs"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'callo-hair-designs-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
