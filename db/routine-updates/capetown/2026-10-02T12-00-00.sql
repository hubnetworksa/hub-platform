INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'connie-s-pawn-shop-brooklyn', 'Connie''s Pawn Shop',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '249 Koeberg Road, Brooklyn, Cape Town, 7405', '021 510 2739', NULL, NULL,
  'Connie''s Pawn Shop is a pawnbroker offering pawn loans against items such as jewellery and electronics, in Brooklyn.',
  NULL, NULL,
  '["https://sabusinesslistings.co.za/listings/connies-pawn-shop/", "https://cape-town-south-africa.bizfax.co.za/connies-pawn-shop.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'connie-s-pawn-shop-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
