INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jet-delft-mall-delft', 'Jet', (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 3, Cnr Hindle Rd and Delft Main Rd, Delft Mall, Delft, Cape Town, 7100', '021 954 9100', NULL, NULL,
  'Jet is a discount clothing, footwear and accessories retailer, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/jet-cnr-hindle-rd-mall-delft-main-rd-delft-cape-town-south-africa/61045", "https://bash.com/store/jet-delft-cnr-hindle-and-delft-main-road-western-cape-7100/451820"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jet-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'convenient-motor-spares-delft', 'Convenient Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  '303 Delft Main Rd, Delft, Cape Town, 7102', '021 954 4494', NULL, NULL,
  'Convenient Motor Spares is a motor spares and car parts store on Delft Main Road, Delft.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/5737248_2", "https://www.waze.com/live-map/directions/convenient-motor-spares-delft-main-rd-303-delft,-cape-town", "https://nearfinderza.com/business/western-cape/cape-town/burglar-proofing/convenient-motor-spares_280971+2.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'convenient-motor-spares-delft'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
