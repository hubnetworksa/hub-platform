INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'xolile-guestrooms-langa', 'Xolile Guestrooms',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  '1 Xolile House, Washington Street, Langa, Cape Town, 7455', '076 526 4314', NULL, NULL,
  'Xolile Guestrooms is a guest house and self-catering accommodation in Langa, offering rooms for visitors to the township.',
  NULL, NULL,
  '["https://bnbfinder.co.za/places/xolile-guestrooms/", "https://b2bhint.com/en/company/za/xolile-guest-house-and-self-catering--B2010116727"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'xolile-guestrooms-langa'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
