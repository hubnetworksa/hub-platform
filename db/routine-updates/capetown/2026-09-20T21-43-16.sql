INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-mini-market-summer-greens', 'OK Mini Market',
  (SELECT id FROM suburbs WHERE slug = 'summer-greens'),
  '13 Summer Greens Way, Summer Greens, Milnerton, Cape Town', '021 551 3259', NULL, NULL,
  'OK Mini Market is a convenience supermarket on Summer Greens Way, Summer Greens, stocking groceries, bakery and butchery items for the local community.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/ok-mini-market-summergreens-milnerton", "https://www.sayellow.com/ok-minimark-summer-greens-milnerton"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-mini-market-summer-greens'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'summer-greens-meat-market-summer-greens', 'Summer Greens Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'summer-greens'),
  'Seven Eleven Centre, Summer Green Drive, Summer Greens, Milnerton, Cape Town', '021 551 9656', NULL, NULL,
  'Summer Greens Meat Market is a butchery in the Seven Eleven Centre on Summer Green Drive, Summer Greens.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/summer-greens-meat-market", "https://www.yellowpages.co.za/business/4326670_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'summer-greens-meat-market-summer-greens'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
