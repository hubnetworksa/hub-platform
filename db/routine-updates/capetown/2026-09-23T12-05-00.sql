INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vortex-factory-shop-wetton', 'Vortex Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '140 Wetton Road, Wetton, Cape Town', '021 797 4393', NULL, NULL,
  'Vortex Factory Shop is a cleaning products factory outlet on Wetton Road, Wetton.',
  NULL, NULL,
  '["https://www.facebook.com/p/Vortex-Factory-Shop-Wetton-Branch-100091771518241/", "https://wanderlog.com/place/details/12305510/vortex-cleaning-products-factory-shop-wetton-branch"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vortex-factory-shop-wetton'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
