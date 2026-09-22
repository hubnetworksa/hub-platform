-- Jobs 1-2: suburb research -- heathfield, kenwyn, southfield (2 new businesses; no shopping centres found)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stylistics-hair-studio-heathfield', 'Stylistics Hair Studio',
  (SELECT id FROM suburbs WHERE slug = 'heathfield'),
  '48 Dover Road, Heathfield, Cape Town, 7945', '082 227 3306', 'https://stylisticshairstudio.co.za/', NULL,
  'Stylistics Hair Studio is a hair salon and hairdressing training centre in Heathfield, Cape Town.',
  NULL, NULL,
  '["https://www.fresha.com/a/stylistics-hair-studio-cape-town-48-dover-road-x21rrdrz", "https://stylisticshairstudio.co.za/", "https://www.facebook.com/p/Stylistics-Hair-Studio-Heathfield-100063771051016/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stylistics-hair-studio-heathfield'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southfield-it-and-internet-cafe-southfield', 'Southfield IT and Internet Cafe',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '136 Victoria Road, Southfield, Cape Town, 7880', '081 756 6728', NULL, NULL,
  'Southfield IT and Internet Cafe is an IT services and internet cafe in Southfield, Cape Town.',
  NULL, NULL,
  '["https://2pos.co.za/2/3678", "https://za.polomap.com/cape-town/9195"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southfield-it-and-internet-cafe-southfield'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
