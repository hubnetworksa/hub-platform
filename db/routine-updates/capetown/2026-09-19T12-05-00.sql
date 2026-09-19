INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kenwyn-martial-arts-centre-kenwyn', 'Kenwyn Martial Arts Centre',
  (SELECT id FROM suburbs WHERE slug = 'kenwyn'),
  '19 Civic Road, Kenwyn, Cape Town, 7780', '021 696 0902', NULL, NULL,
  'Kenwyn Martial Arts Centre is a karate and Ryukyu Kobudo dojo on Civic Road, offering martial arts instruction and self-defense training since 2001.',
  NULL, NULL,
  '["https://www.kenwynmartialartscentre.com/", "https://www.activeactivities.co.za/directory/kenwyn-martial-arts-centre-168491.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kenwyn-martial-arts-centre-kenwyn'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kasus-interiors-kenwyn', 'Kasu''s Interiors',
  (SELECT id FROM suburbs WHERE slug = 'kenwyn'),
  '42 Brockhurst Road, Kenwyn, Cape Town, 7780', '021 797 6321', NULL, NULL,
  'Kasu''s Interiors is an interior design and decor business on Brockhurst Road, offering residential interior design services.',
  NULL, NULL,
  '["http://www.kasusinteriors.co.za/Index_files/KI_About.html", "https://www.houzz.com/professionals/interior-designers-and-decorators/kasu-s-interiors-pfvwus-pf~25536283"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kasus-interiors-kenwyn'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
