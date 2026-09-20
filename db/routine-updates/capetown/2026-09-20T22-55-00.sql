-- Cape Town routine: Summer Greens suburb research (2 new businesses)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-minimark-summer-greens-summer-greens', 'OK Minimark Summer Greens',
  (SELECT id FROM suburbs WHERE slug = 'summer-greens'),
  '13 Summer Greens Way, Summer Greens', '021 551 3259', NULL, NULL,
  'OK Minimark Summer Greens is a small-format convenience supermarket serving the Summer Greens neighbourhood.',
  NULL, NULL,
  '["https://www.sayellow.com/ok-minimark-summer-greens-milnerton", "https://www.thinklocal.co.za/biz/ok-mini-market-summergreens-milnerton"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-minimark-summer-greens-summer-greens'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'diamonds-discount-liquor-summer-greens', 'Diamond''s Discount Liquor',
  (SELECT id FROM suburbs WHERE slug = 'summer-greens'),
  'OK Centre, Summer Greens Drive, Summer Greens', '021 552 1248', NULL, NULL,
  'Diamond''s Discount Liquor is a liquor store offering retail and wholesale liquor and soft drinks in Summer Greens.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/summer-greens/bottle-stores-off-sales-retail/diamonds-discount-liquor", "https://www.tiendeo.co.za/stores/Summer-Greens/diamond-discount-liquor-centre/12800"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'diamonds-discount-liquor-summer-greens'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
