INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-designer-warehouse-emporium-maitland', 'The Designer Warehouse Emporium',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '515 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 2535', NULL, NULL,
  'The Designer Warehouse Emporium is a factory-shop-style clothing store on Voortrekker Road, Maitland, offering discounted designer and branded fashion for men, women and children.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-designer-warehouse-emporium-68809", "https://www.findglocal.com/ZA/Cape-Town/492443357591597/The-Designer-Warehouse-Emporium"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-designer-warehouse-emporium-maitland'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  '10th-avenue-shopping-centre-maitland', '10th Avenue Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  'Corner 10th Avenue and Voortrekker Road, Maitland, Cape Town', NULL, NULL,
  '["https://www.anvilproperty.co.za/commercial-property/retail/to-rent/maitland/10th-avenue-shopping-centre-kensington-11155", "https://www.rennieproperty.co.za/buildings/10th-avenue-shopping-centre.html"]',
  'mall'
);
