INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'abacas-electrical-solution-tafelsig', 'Abacas Electrical Solution',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  '207 Kilimanjaro Street, Tafelsig, Mitchells Plain, Cape Town, 7789', '021 391 6336', 'https://abacassolution.co.za/', NULL,
  'Abacas Electrical Solution is an electrical and plumbing services contractor operating from Kilimanjaro Street, in Tafelsig.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/abacas-electrical-solution-cc/254323", "https://www.cylex.net.za/company/abacas-solutions-23667362.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'abacas-electrical-solution-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'electricians'),
  1
);
