INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lords-unisex-hairstylists-bergvliet', "Lord's Unisex Hairstylists",
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  "Shop 9, Sherwood Shopping Centre, Corner Children's Way and Dreyersdal Road, Bergvliet, Cape Town, 7945",
  '021 712 8612', NULL, NULL,
  "Lord's Unisex Hairstylists is a hair salon in Sherwood Shopping Centre, Bergvliet, offering cuts, colour and treatments for men and women.",
  NULL, NULL,
  '["https://sherwoodshopping.co.za/lords-hair-salon/", "https://nearfinderza.com/en/business/lord-s-unisex-hairstylists_479134+1.html", "https://www.brabys.com/za/western-cape/cape-town/bergvliet/unisex-hairdressers/lords-unisex-hairstylists"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lords-unisex-hairstylists-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
