INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panorama-veterinary-clinic-specialist-centre-panorama', 'Panorama Veterinary Clinic & Specialist Centre',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '1 Uys Krige Drive, Panorama, Cape Town, 7500', '021 930 6632', 'https://panoramavet.co.za', NULL,
  'Panorama Veterinary Clinic & Specialist Centre is a 24-hour veterinary hospital offering general, emergency and specialist referral care for dogs and cats, on Uys Krige Drive, Panorama.',
  NULL, NULL,
  '["https://panoramavet.co.za/contact/", "http://textmap.co.za/3/15042"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panorama-veterinary-clinic-specialist-centre-panorama'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belle-ame-salon-panorama', 'Belle Ame Salon',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Cnr Rothschild Boulevard & Hennie Winterbach Street, Panorama Healthcare Centre, Panorama, Cape Town, 7506', '021 911 2383', 'https://www.belleamesalon.co.za', NULL,
  'Belle Ame Salon is a hairdressing and beauty salon inside Panorama Healthcare Centre, Panorama.',
  NULL, NULL,
  '["https://www.belleamesalon.co.za/", "https://www.panoramahcc.co.za/tenants/belle-ame/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belle-ame-salon-panorama'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neovision-panorama-panorama', 'Neovision Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Shop 13, Panorama Healthcare Centre, Cnr Rothschild Boulevard & Hennie Winterbach Street, Panorama, Cape Town, 7500', '021 100 3233', 'https://www.neovision.co.za/stores/panorama/', NULL,
  'Neovision Panorama is an optometry practice inside Panorama Healthcare Centre, Panorama.',
  NULL, NULL,
  '["https://www.neovision.co.za/stores/panorama/", "https://www.panoramahcc.co.za/tenants/lezanne-vosloo-neovision-optometrist/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neovision-panorama-panorama'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-bank-panorama-panorama', 'Absa Bank Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '1 Rothschild Boulevard, Panorama, Cape Town, 7500', '021 937 6500', NULL, NULL,
  'Absa Bank is a bank branch on Rothschild Boulevard, Panorama.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/absa-bank-rothschild-boulevard-panorama/60084", "https://za.ypgo.net/Absa+Branch,+Panorama,+Delmar+Centre-45518862418"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-bank-panorama-panorama'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lotz-of-joy-guesthouse-panorama', 'Lotz of Joy Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '70 Panorama Road, Panorama, Cape Town, 7500', '021 930 0180', 'https://www.lotzofjoy.co.za', NULL,
  'Lotz of Joy is a guest house on Panorama Road, Panorama.',
  NULL, NULL,
  '["https://www.lotzofjoy.co.za/", "https://www.capetown.travel/listing/lotz-of-joy-guesthouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotz-of-joy-guesthouse-panorama'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
