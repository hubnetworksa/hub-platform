INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'attorneys-west-rossouw-noordhoek', 'Attorneys West & Rossouw',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  '33 Longboat Street, Sunnydale, Noordhoek, Cape Town, 7985', '021 785 2277', NULL, NULL,
  'Attorneys West & Rossouw is a law firm headquartered in the Noordhoek Valley, offering legal advice and commercial legal services.',
  NULL, NULL,
  '["https://www.southafricanlawyer.co.za/law-firm/attorneys-west-rossouw/noordhoek/", "https://attorneyswr.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'attorneys-west-rossouw-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
