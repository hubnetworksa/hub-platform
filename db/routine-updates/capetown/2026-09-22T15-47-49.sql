-- Monte Vista suburb research (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bleu-scissor-hair-salon-monte-vista', 'Bleu Scissor Hair Salon',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '105b Plattekloof Road, Monte Vista, Cape Town, 7460', '021 911 0139', NULL, NULL,
  'Bleu Scissor Hair Salon is a hairdressing and barbering salon on Plattekloof Road in Monte Vista.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/bleu-scissor-hair-salon-plattekloof-plattekloof-road-cape-town-7r6kYq", "https://bleuscissor.co.za/", "https://www.facebook.com/BleuScissor/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bleu-scissor-hair-salon-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'seeff-plattekloof-monte-vista', 'Seeff Plattekloof + Surrounds',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '105 Wagenaar Street, Monte Vista, Cape Town, 7460', '021 202 3380', NULL, NULL,
  'Seeff Plattekloof + Surrounds is an estate agency branch of the Seeff Property Group, based on Wagenaar Street in Monte Vista.',
  NULL, NULL,
  '["https://point2realestate.com.au/seeffplattekloof/", "https://www.seeff.com/branches/plattekloof/8761/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'seeff-plattekloof-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'monte-vista-pharmacy-monte-vista', 'Monte Vista Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '102 Monte Vista Boulevard, Monte Vista, Cape Town, 7460', '021 559 1451', NULL, NULL,
  'Monte Vista Pharmacy is a pharmacy on Monte Vista Boulevard in Monte Vista.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/monte-vista-pharmacy?to=place.ChIJ-TJ3zERRzB0RN6fW-iDmxaw", "https://www.yellosa.co.za/company/699538/monte-vista-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monte-vista-pharmacy-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
