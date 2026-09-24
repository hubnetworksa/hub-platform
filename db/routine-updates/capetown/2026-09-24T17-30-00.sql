-- Job 1: Plumstead general suburb research -- 1 verified standalone business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-plumstead-plumstead', 'Clicks Plumstead',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '171 Main Road, Plumstead, Cape Town, 7800', '021 761 2257', 'https://clicks.co.za/store/Plumstead/1663', NULL,
  'Clicks Plumstead is a pharmacy and health, beauty and homeware retailer on Main Road, Plumstead.',
  NULL, NULL,
  '["https://clicks.co.za/store/Plumstead/1663", "https://za.africabz.com/western-cape/clicks-pharmacy-7382"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'clicks-plumstead-plumstead'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);
