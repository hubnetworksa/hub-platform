-- District Six suburb research: 2 new businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harringtons-cocktail-lounge-district-six', 'Harringtons Cocktail Lounge',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '61B Harrington Street, District Six, Cape Town', '078 916 7903', NULL, NULL,
  'Harringtons Cocktail Lounge is an upstairs cocktail lounge and bar on Harrington Street serving global tapas alongside its cocktail menu, in the heart of the East City nightlife strip.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/harringtons-cocktail-lounge-231210", "https://www.harringtonstreet.co.za/harringtons"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harringtons-cocktail-lounge-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'seebamboes-district-six', 'Seebamboes',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '99 Harrington Street, District Six, Cape Town, 7925', '066 387 0264', NULL, NULL,
  'Seebamboes is an intimate 16-seat surf-and-turf tasting-menu restaurant on the mezzanine level above Galjoen on Harrington Street.',
  NULL, NULL,
  '["https://www.seebamboescpt.co.za/pages/about-seebamboes", "https://www.dineplan.com/restaurants/seebamboes"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'seebamboes-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
