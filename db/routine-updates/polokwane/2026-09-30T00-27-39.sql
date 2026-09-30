INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-mankweng-university-road-mankweng', 'KFC Mankweng (University Road)',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  '1 University Rd, Mankweng, 0727', '087 940 1163', NULL, NULL,
  'KFC Mankweng (University Road) is a fast-food takeaway outlet on University Road, Mankweng, a separate branch from the KFC inside Paledi Mall.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g12880261-d24168866-Reviews-KFC_Mankweng_2-Mankweng_Limpopo_Province.html", "https://wanderlog.com/place/details/11136985/kfc-mankweng-university-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-mankweng-university-road-mankweng'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
