INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ottos-cafe-crawford', 'Otto''s Cafe',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '1 Rokeby Road, Crawford, Cape Town, 7770', '078 473 4989', NULL, NULL,
  'Otto''s Cafe is a halal-certified café and coffee shop, in Crawford.',
  NULL, NULL,
  '["https://triptap.com/places/za/western-cape/cape-town/ottos-cafe-t025b000", "https://www.instagram.com/ottos_cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ottos-cafe-crawford'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
