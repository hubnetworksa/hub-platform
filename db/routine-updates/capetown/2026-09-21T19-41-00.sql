INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'curate-bantry-bay', 'Curate',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '180 Kloof Road, Bantry Bay, Cape Town', '021 430 3200', NULL, 'curate@ellerman.co.za',
  'Curate is a fine-dining restaurant at Ellerman House in Bantry Bay, offering a tasting menu with bespoke wine pairings.',
  NULL, NULL,
  '["https://www.ellerman.co.za/experience/curate-at-ellerman", "https://insideguide.co.za/cape-town/restaurants/curate/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'curate-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
