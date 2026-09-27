-- Jobs 1-2: camps-bay suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bo-vine-wine-grill-house-camps-bay', 'Bo-Vine Wine & Grill House',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 1a, The Promenade, 87 Victoria Road, Camps Bay, Cape Town, 8005', '021 203 5314', NULL, NULL,
  'Bo-Vine Wine & Grill House is a steak and grill restaurant inside The Promenade shopping centre in Camps Bay, also offering an extensive wine list.',
  NULL, NULL,
  '["https://www.capetownetc.com/things-to-do-cape-town/cooking-the-perfect-steak-with-bo-vine-in-camps-bay/", "https://www.bovinegrillhouse.com/campsbay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bo-vine-wine-grill-house-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morea-house-autograph-collection-camps-bay', 'Morea House, Autograph Collection',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '35 Victoria Road, Camps Bay, Cape Town, 8040', '+27 21 892 2980', NULL, NULL,
  'Morea House, Autograph Collection is a boutique hotel on Victoria Road in Camps Bay offering ocean-view rooms near Camps Bay beach.',
  NULL, NULL,
  '["https://www.marriott.com/en-us/hotels/cptck-morea-house-autograph-collection/overview/", "https://www.luxurylifestylemag.co.uk/travel/hotel-review-morea-house-autograph-collection-cape-town-in-south-africa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'morea-house-autograph-collection-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'camps-bay-haute-coiffure-camps-bay', 'Camps Bay Haute Coiffure',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 104c, The Promenade, 87 Victoria Road, Camps Bay, Cape Town', '+27 21 035 0855', NULL, NULL,
  'Camps Bay Haute Coiffure is a hair salon inside The Promenade shopping centre in Camps Bay offering cuts, colour, and styling services.',
  NULL, NULL,
  '["https://www.facebook.com/campsbayhautecoiffure/", "https://www.barbercartel.co.za/camps-bay-haute-coiffure"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'camps-bay-haute-coiffure-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-marly-camps-bay', 'The Marly Boutique Hotel & Spa',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '201 The Promenade, Victoria Road, Camps Bay, Cape Town, 8005', '+27 21 437 1287', NULL, NULL,
  'The Marly is a five-star beachfront boutique hotel on Victoria Road in Camps Bay with its own on-site spa.',
  NULL, NULL,
  '["https://www.themarly.co.za/", "https://www.sa-venues.com/visit/themarly/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-marly-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-bay-hotel-camps-bay', 'The Bay Hotel',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '69 Victoria Road, Camps Bay, Cape Town', '+27 21 430 4444', NULL, NULL,
  'The Bay Hotel is a beachfront hotel on Victoria Road in Camps Bay, within walking distance of the suburb''s restaurants and beach.',
  NULL, NULL,
  '["https://thebayhotel.com/", "https://www.tripadvisor.com/Hotel_Review-g312658-d302905-Reviews-The_Bay_Hotel-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-bay-hotel-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '61-on-camps-bay-camps-bay', '61 On Camps Bay',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '61 Camps Bay Drive, Camps Bay, Cape Town, 8040', '+27 71 150 6582', NULL, NULL,
  '61 On Camps Bay is a guesthouse on Camps Bay Drive offering sea-facing and pool-facing en-suite rooms a short walk from the beach.',
  NULL, NULL,
  '["https://www.61oncampsbay.co.za/contact/contact-us/", "https://www.sa-venues.com/visit/61oncampsbaydrive/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '61-on-camps-bay-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'finchley-guest-house-camps-bay', 'Finchley Guest House',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '18 Finchley Road, Camps Bay, Cape Town, 8005', '021 201 8901', NULL, NULL,
  'Finchley Guest House is a guesthouse on Finchley Road in Camps Bay with six en-suite rooms and views of the Atlantic Ocean and the Twelve Apostles.',
  NULL, NULL,
  '["https://www.finchleyguesthouse.com/", "http://www.finchleyguesthouse.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'finchley-guest-house-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
