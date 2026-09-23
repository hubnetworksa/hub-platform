-- Melkbosstrand: jobs 1-2 -- 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-orca-melkbosstrand', 'Cafe Orca',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  '88 Beach Rd, Melkbosstrand, Cape Town, 7437', '021 553 4120', 'https://www.cafeorca.co.za/', NULL,
  'Cafe Orca is a family-run seafood restaurant in a beachfront cottage in Melkbosstrand.',
  NULL, NULL,
  '["https://www.cafeorca.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g667022-d2415694-Reviews-Cafe_Orca-Melkbosstrand_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-orca-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
