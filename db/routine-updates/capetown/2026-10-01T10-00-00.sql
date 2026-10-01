INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bellagio-de-waterkant', 'Bellagio',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '74 Prestwich St, De Waterkant, Cape Town', '021 879 1999', NULL, NULL,
  'Bellagio is a Mediterranean restaurant with a shaded terrace, in De Waterkant.',
  NULL, NULL,
  '["https://www.dineplan.com/restaurants/bellagio-cape-town", "https://triptap.com/places/za/western-cape/cape-town/bellagio-mediterranean-restaurant-t037e6e3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bellagio-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cattle-baron-de-waterkant-de-waterkant', 'Cattle Baron De Waterkant',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  'Mirage Building, corner Chiappini and Strand Street, De Waterkant, Cape Town', '021 418 0230', 'https://www.cattlebaron.co.za/cattle-baron-de-waterkant/', NULL,
  'Cattle Baron De Waterkant is a steakhouse grill room and bar in the Mirage Building, in De Waterkant.',
  NULL, NULL,
  '["https://www.cattlebaron.co.za/cattle-baron-de-waterkant/", "https://www.dining-out.co.za/md/Cattle-Baron-Grill-Room-Bar-De-Waterkant/8868"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cattle-baron-de-waterkant-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
