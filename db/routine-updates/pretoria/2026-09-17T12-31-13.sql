INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'advance-cash-carry-hermanstad-hermanstad', 'Advance Cash & Carry Hermanstad',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  'Cnr Moot Street & Es''kia Mphahlele Drive, Roseville Park, Hermanstad, Pretoria', '012 379 6050', NULL, NULL,
  'Advance Cash & Carry Hermanstad is a bulk cash-and-carry grocery store in Hermanstad, Pretoria.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/pretoria/advance-cash-and-carry/cnr-moot-st-es-kia-mphahlele-drive-roseville-park-hermanstad", "https://promotheus.co.za/pretoria/advance-cash-and-carry/cnr-moot-st-es-kia-mphahlele-drive-roseville-park-hermanstad"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'advance-cash-carry-hermanstad-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wannenburgs-hermanstad-branch-hermanstad', 'Wannenburg''s Hermanstad Branch',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '471 Moot Street, Hermanstad, Pretoria', '012 379 9016', 'https://wannenburgs.co.za', 'sparesmoot@wannenburgs.co.za',
  'Wannenburg''s Hermanstad Branch is a 4x4 and bakkie spares dealer in Hermanstad, Pretoria.',
  NULL, NULL,
  '["https://wannenburgs.co.za/hermanstad-contact.html", "https://www.cylex.net.za/company/wannenburg-spares-17711003.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wannenburgs-hermanstad-branch-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dezis-pets-hermanstad', 'Dezi''s Pets',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '470 Van Der Hoff Road, Hermanstad, Pretoria, 0082', '012 377 0249', 'https://www.dezispets.com', NULL,
  'Dezi''s Pets is a pet shop in Hermanstad, Pretoria, selling pet products and supplies.',
  NULL, NULL,
  '["https://aconopet.com/shop/listing/dezis-petshop-pet-shop-in-pretoria-south-africa/", "https://za.polomap.com/pretoria/43130"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dezis-pets-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cream-star-ice-cream-hermanstad', 'Cream Star Ice Cream',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '290 Slegtkamp St, Hermanstad, Pretoria, 0082', '+27 12 379 4661', NULL, NULL,
  'Cream Star Ice Cream is an ice cream manufacturer and wholesaler in Hermanstad, Pretoria, supplying ice cream, ice pops and related products to restaurants and caterers.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/478020/cream-star-ice-cream", "https://rsa.worldorgs.com/catalog/pretoria/ice-cream-shop/cream-star-ice-cream-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cream-star-ice-cream-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'unique-dairy-products-hermanstad', 'Unique Dairy Products',
  (SELECT id FROM suburbs WHERE slug = 'hermanstad'),
  '290 Slegtkamp St, Hermanstad, Pretoria, 0082', '(012) 379-0872', 'https://uniquedairy.co.za', 'info@uniquedairy.co.za',
  'Unique Dairy Products is a dairy products manufacturer and supplier in Hermanstad, Pretoria.',
  NULL, NULL,
  '["https://uniquedairy.co.za/contacts/", "https://za.africabz.com/gauteng/unique-dairy-products-127375"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'unique-dairy-products-hermanstad'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
