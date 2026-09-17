INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bargain-books-mall-of-the-north-bendor', 'Bargain Books Mall of the North',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'),
  'Shop L9, Mall of the North, Cnr R81 & N1, Bendor, Polokwane, 0700', '015 265 1440', 'https://bargainbooks.co.za/locations/', 'mallofthenorth@bargainbooks.co.za',
  'Bargain Books Mall of the North sells discounted books, stationery and electronic gadgets from a store inside Mall of the North, Bendor.',
  NULL, NULL,
  '["https://mallofthenorth.co.za/shop/bargain-books/", "https://www.sayellow.com/view/south-africa/bargain-books-mall-of-the-north-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bargain-books-mall-of-the-north-bendor'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'signature-cosmetics-mall-of-the-north-bendor', 'Signature Cosmetics Mall of the North',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-of-the-north-bendor'),
  'Shop L66a, Mall of the North, Cnr R81 & N1, Bendor, Polokwane, 0700', '015 265 1271', 'https://signaturecosmetics.co.za', 'mallofthenorth@signaturecosmetics.co.za',
  'Signature Cosmetics Mall of the North sells cosmetics and fragrances from a store inside Mall of the North, Bendor.',
  NULL, NULL,
  '["https://mallofthenorth.co.za/shop/signature-cosmetics/", "https://www.brabys.com/za/limpopo/polokwane/bendor/cosmetic-retailers/signature-cosmetics"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'signature-cosmetics-mall-of-the-north-bendor'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
