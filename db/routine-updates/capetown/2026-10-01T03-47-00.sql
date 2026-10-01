INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'philippi-groente-verpakkers-philippi-horticultural', 'Philippi Groente Verpakkers',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  'Olieboom Road, Schaapkraal, Philippi Horticultural Area, Cape Town, 7941', '021 703 9541', NULL, 'reception@klspgv.co.za',
  'Philippi Groente Verpakkers is a vegetable packing company in Schaapkraal, Philippi Horticultural Area.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/schaapkraal/vegetable-farmers/philippi-groente-verpakkers", "https://www.netpages.co.za/Cape+Town/Philippi+Groente+Verpakkers-122703.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'philippi-groente-verpakkers-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'agrimark-philippi-horticultural', 'Agrimark Philippi',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  '10 Olieboom Road, Philippi, Cape Town, 7785', '021 703 1120', 'https://www.agrimark.co.za/store/agrimark-philippi', NULL,
  'Agrimark Philippi is a Kaap Agri agricultural retail store on Olieboom Road, supplying farming inputs, animal feed, and diesel delivery to the Philippi Horticultural Area.',
  NULL, NULL,
  '["https://www.agrimark.co.za/store/agrimark-philippi", "https://www.cybo.com/ZA-biz/agrimark-philippi"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'agrimark-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);
