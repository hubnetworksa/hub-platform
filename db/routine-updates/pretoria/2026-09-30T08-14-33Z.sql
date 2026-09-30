INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'planet-fitness-queenswood-queenswood', 'Planet Fitness Queenswood',
  (SELECT id FROM suburbs WHERE slug = 'queenswood'),
  'Cnr Stead Ave & Whittle Ln, Queenswood, Pretoria', '012 030 0547', 'https://www.planetfitness.co.za/gyms/queenswood/', NULL,
  'Planet Fitness Queenswood is a gym on the corner of Stead Avenue and Whittle Lane in Queenswood, with a cardio deck, free weights area, functional training area and free Wi-Fi and parking for members.',
  NULL, NULL,
  '["https://www.planetfitness.co.za/gyms/queenswood/", "https://www.hellopeter.com/planet-fitness/reviews/planet-fitness-queenswood-a4c622d416aef1f0a93da025f6f52c467a5d773c-5373756"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'planet-fitness-queenswood-queenswood'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
