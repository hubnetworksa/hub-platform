INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'de-waterkant-place-de-waterkant', 'De Waterkant Place',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '35 Dixon Street, De Waterkant, Cape Town', '082 780 4885', 'https://dewaterkantplace.co.za', 'info@dewaterkantplace.co.za',
  'De Waterkant Place is a boutique guesthouse on Dixon Street in De Waterkant.',
  NULL, NULL,
  '["https://dewaterkantplace.co.za/contact/", "https://wanderlog.com/place/details/10403264/de-waterkant-place"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'de-waterkant-place-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'urban-men-de-waterkant', 'Urban Men',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '7 Jarvis Street, De Waterkant, Cape Town', '021 820 4343', 'https://www.urbanmen.co.za', NULL,
  'Urban Men is a barber shop and men''s grooming salon on Jarvis Street in De Waterkant.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/urban-men-19718", "https://ourvanitylist.com/listing/urban-men/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'urban-men-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'origin-coffee-roasting-de-waterkant', 'Origin Coffee Roasting',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '28 Hudson Street, De Waterkant, Cape Town', '021 421 1000', 'https://originroasting.co.za', 'info@originroasting.co.za',
  'Origin Coffee Roasting is a coffee roastery and cafe on Hudson Street in De Waterkant.',
  NULL, NULL,
  '["https://originroasting.co.za/pages/contact", "https://www.eatout.co.za/venue/origin-coffee-roasting/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'origin-coffee-roasting-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
