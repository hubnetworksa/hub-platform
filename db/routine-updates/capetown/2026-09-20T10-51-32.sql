INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'ottery-hyper-ottery', 'Ottery Hyper',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  'New Ottery Road, Ottery, Cape Town', NULL, NULL,
  '["https://www.facebook.com/Otteryhyper/", "https://my-catalogue.co.za/stores/ottery/pick-n-pay-hypermarket/new-ottery-road"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-hyper-ottery', 'Pick n Pay Hyper',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'New Ottery Road, Ottery, Cape Town, 7808', '021 704 7600', NULL, NULL,
  'Pick n Pay Hyper is the anchor supermarket at Ottery Hyper on New Ottery Road in Ottery.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/ottery/pick-n-pay-hypermarket/new-ottery-road", "https://www.callupcontact.com/b/Supermarkets/Pick_39n_Pay_Ottery_Hypermarket/186"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-hyper-ottery'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-ottery', 'Dis-Chem',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop 27-31, Ottery Hyper, New Ottery Road, Ottery, Cape Town, 7800', '021 541 0661', NULL, NULL,
  'Dis-Chem is a pharmacy and health store inside Ottery Hyper on New Ottery Road in Ottery.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/dischem-shop--ottery-shopping-centre-new-ottery-road-ottery-cape-town/75598", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1866824"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-ottery'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-converters-ottery', 'Cash Converters',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L53, Ottery Hyper, New Ottery Road, Ottery, Cape Town, 7800', '021 703 7900', NULL, NULL,
  'Cash Converters is a second-hand goods and pawnbroking store inside Ottery Hyper on New Ottery Road in Ottery.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/9775", "https://za.2pos.info/2/3910"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-converters-ottery'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
