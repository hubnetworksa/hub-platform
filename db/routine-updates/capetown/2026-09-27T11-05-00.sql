INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tai-chi-restaurant-tokai', 'Tai Chi Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Shop 7, Forest Glade House, Tokai Road, Tokai, Cape Town, 7945', '+27 21 712 7372', NULL, NULL,
  'Tai Chi Restaurant is an Asian fusion restaurant in Forest Glade House, Tokai, serving sushi and Chinese cuisine.',
  NULL, NULL,
  '["https://cape-town-south-africa.bizfax.co.za/tai-chi-restaurant.html", "https://www.dining-out.co.za/md/Tai-Chi-Restaurant/9299"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tai-chi-restaurant-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
