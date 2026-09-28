INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vds-roadhouse-colorado', 'VDS Roadhouse',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  '4 Kentucky Avenue, Colorado Park, Mitchells Plain, 7785', '068 510 2003', NULL, NULL,
  'VDS Roadhouse is a roadhouse-style takeaway serving burgers, hot dogs, wraps and Cape Town-style sarmies, in Colorado, Mitchells Plain.',
  NULL, NULL,
  '["https://www.mrd.com/delivery/restaurant/vds-roadhouse-colorado-park/32358", "http://www.vdsroadhouse.co.za/contact.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vds-roadhouse-colorado'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lw-traders-colorado', 'L&W Traders',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  (SELECT id FROM shopping_centers WHERE slug = 'colorado-city-centre-colorado'),
  'Colorado City Centre, Ceasars Drive, Colorado Park, Mitchells Plain, 7785', '084 666 0461', NULL, NULL,
  'L&W Traders is a general retail store in Colorado City Centre, Colorado Park, Mitchells Plain.',
  NULL, NULL,
  '["https://www.tiktok.com/@lw.traders", "https://www.facebook.com/vonnie.kemp.1/posts/visit-lw-traders-in-colorado-next-to-kfc-by-colorado-centre-mitchells-plain-wall/30969961835935883/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lw-traders-colorado'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
