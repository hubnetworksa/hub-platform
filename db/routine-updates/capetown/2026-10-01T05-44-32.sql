INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'engen-strandfontein-strandfontein', 'Engen Strandfontein Service Station',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Cnr Spine Road & Trafalgar Drive, Strandfontein Village, Cape Town, 7798', '021 393 0256', NULL, NULL,
  'Engen Strandfontein Service Station is a fuel station in Strandfontein, on the corner of Spine Road and Trafalgar Drive.',
  NULL, NULL,
  '["https://www.fueldirectory.co.za/listing-contact.php?listings_id=5969", "https://www.dnb.com/business-directory/company-profiles.engen_strandfontein_(pty)_ltd.aca5d5553bea65a7441093048a1511fa.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'engen-strandfontein-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-minimark-strandfontein', 'OK MiniMark',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Blackberry Mall, Shop No 1, Cnr Dennegeur & Church, Strandfontein, Cape Town, 7798', '021 393 6637', NULL, NULL,
  'OK MiniMark is a convenience store in Strandfontein, on the corner of Dennegeur and Church.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ok-minimark-319543", "https://www.guzzle.co.za/ok-minimark/strandfontein/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-minimark-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);
