INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bay-leaf-restaurant-laudium', 'Bay Leaf Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '259 Tangerine Street, Laudium', '012 771 4141', 'https://bayleaflaudium.co.za', NULL,
  'Bay Leaf Restaurant is a halaal-certified North Indian restaurant and takeaway in Laudium.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/bay-leaf-restaurant-tangerine-st-259-laudium,-centurion", "https://www.eatout.co.za/venue/bay-leaf-indian-restaurant-laudium/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bay-leaf-restaurant-laudium'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
