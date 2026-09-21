-- Jobs 1-2: de-waterkant suburb checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-manhattan-de-waterkant', 'Cafe Manhattan',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '74 Waterkant Street, De Waterkant, Cape Town', '021 002 8867', NULL, NULL,
  'Cafe Manhattan is a bar and kitchen in De Waterkant, one of Cape Town''s longest-running LGBTQI+-friendly venues, open daily since 1994.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cafe-manhattan-de-waterkant/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2305572-Reviews-Cafe_Manhattan-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-manhattan-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
