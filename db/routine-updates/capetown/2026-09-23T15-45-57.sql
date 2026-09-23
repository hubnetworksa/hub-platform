INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'summer-greens-meat-market-summer-greens', 'Summer Greens Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'summer-greens'),
  'Seven Eleven Centre, Summer Greens Drive, Summer Greens, Milnerton, Cape Town, 7441', '021 551 9656', NULL, NULL,
  'Summer Greens Meat Market is a butchery in the Seven Eleven Centre on Summer Greens Drive.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/summer-greens-meat-market", "http://www.netpages.co.za/Milnerton/Summer+Greens+Meat+Market-155011.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'summer-greens-meat-market-summer-greens'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
