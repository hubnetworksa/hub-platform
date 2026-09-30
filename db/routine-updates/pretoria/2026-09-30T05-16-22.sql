INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'olympus-manor-estate-venues-olympus', 'Olympus Manor Estate Venues',
  (SELECT id FROM suburbs WHERE slug = 'olympus'),
  '47 Neptune Drive, Olympus AH, Pretoria, 0081', '012 862 3122', 'https://olympusmanor.co.za', 'info@olympusmanor.co.za',
  'Olympus Manor Estate Venues is an events and function venue in Olympus, Pretoria, set on a 2-hectare property with a banquet hall, ballroom and several outdoor garden venues. It hosts weddings, conferences and private functions for groups of 10 to 400 guests, with on-site accommodation for up to 40 people.',
  NULL, NULL,
  '["https://olympusmanor.co.za", "https://www.successfulmeetings.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/Olympus-Manor-Guesthouse-p53158778"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'olympus-manor-estate-venues-olympus'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
