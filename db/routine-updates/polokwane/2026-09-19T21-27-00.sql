INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'js-cleaning-moregloed', 'J''s Cleaning',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  'Oost Street, Moregloed, Polokwane, 0700', '+27 74 798 9394', 'https://jscleaning.co.za/', NULL,
  'J''s Cleaning is a home and office cleaning service in Moregloed, supplying its own SABS-approved cleaning chemicals and equipment.',
  NULL, NULL,
  '["https://jscleaning.co.za/contact-us/", "https://www.goafricaonline.com/za/1292569-j-s-cleaning"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'js-cleaning-moregloed'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'big-ben-lodge-moregloed', 'Big Ben Lodge',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  '86 Johnson Street, Moregloed, Polokwane, 0699', '015 291 5464', NULL, 'info@bigbenlodge.co.za',
  'Big Ben Lodge is a 4-star guesthouse in Moregloed, close to the Polokwane city centre.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Hotel_Review-g312624-d4752573-Reviews-Big_Ben_Lodge-Polokwane_Limpopo_Province.html", "https://polokwanetourism.co.za/item/big-ben-lodge/", "https://www.booking.com/hotel/za/big-ben-lodge.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-ben-lodge-moregloed'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
