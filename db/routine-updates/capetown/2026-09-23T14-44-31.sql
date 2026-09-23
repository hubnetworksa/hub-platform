INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'piazza-centre-parklands', 'Piazza Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Cnr Parklands Main Rd & Link Rd, Parklands, Cape Town, 7441', NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/crazy-store-the-piazza-shopping-centre-cnr-parklands-main-link-rd-parklands-cape-town-south-africa/73357", "https://www.guzzle.co.za/malls/1109/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-piazza-centre-parklands', 'The Crazy Store Piazza Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'piazza-centre-parklands'),
  'Shop 3, 4 & 5, Piazza Centre, Cnr Parklands Main Rd & Link Rd, Parklands, Cape Town, 7441', '087 135 8833', NULL, NULL,
  'The Crazy Store Piazza Centre is a variety and gift retailer inside Piazza Centre, Parklands.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/crazy-store-the-piazza-shopping-centre-cnr-parklands-main-link-rd-parklands-cape-town-south-africa/73357", "https://www.southafricabusinessdirectory.co.za/company/1421705862316032/the-crazy-store-parklands-the-piazza/cape-town/retail-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-piazza-centre-parklands'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '306-restaurant-and-lounge-parklands', '306 Restaurant and Lounge',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Unit 2, Eclipse Park, Village Walk, Parklands, Cape Town, 7441', '068 336 8458', 'https://www.306restaurant.com/', NULL,
  '306 Restaurant and Lounge is a Nigerian-cuisine restaurant and lifestyle lounge in Parklands, offering dine-in, takeaway and delivery.',
  NULL, NULL,
  '["https://www.306restaurant.com/contact", "https://www.ubereats.com/za/store/306-restaurant-and-lounge/yQfoFaApRXWLz47li1c6iw"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '306-restaurant-and-lounge-parklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
