INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tokai-forest-guest-house-dennendal', 'Tokai Forest Guest House',
  (SELECT id FROM suburbs WHERE slug = 'dennendal'),
  '19 Dennendal East Avenue, Dennendal, Cape Town, 7945', '021 713 0670', 'https://tokaiforestguesthouse.co.za', 'bookings@tokaiforestguesthouse.co.za',
  'Tokai Forest Guest House is an 8-unit bed and breakfast at the foot of the Constantiaberg mountains, backing directly onto Tokai Forest, in Dennendal.',
  NULL, NULL,
  '["https://tokaiforestguesthouse.co.za/contact/", "https://constantiavalley.com/tokai-forest-guest-house/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tokai-forest-guest-house-dennendal'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'scratch-patch-and-mineral-world-glencairn', 'Scratch Patch & Mineral World',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  'Dido Valley Road, Glencairn, Cape Town, 7995', '021 786 2020', 'https://www.scratchpatch.co.za', NULL,
  'Scratch Patch & Mineral World is a gemstone shop and family attraction in Glencairn where visitors can dig through tumbled semi-precious stones to take home, alongside a mineral display and mini-golf course.',
  NULL, NULL,
  '["https://www.scratchpatch.co.za/contact/", "https://www.scratchpatch.co.za/mineral-world/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'scratch-patch-and-mineral-world-glencairn'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
