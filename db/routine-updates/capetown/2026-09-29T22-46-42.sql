INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'richmond-centre-plumstead', 'Richmond Centre',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'Main Road, Plumstead, Cape Town', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/richmond-centre---plumstead.html", "https://www.crave.co.za/establishment.asp?est=17353"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simply-asia-plumstead', 'Simply Asia',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-centre-plumstead'),
  'Richmond Centre, Main Road, Plumstead, Cape Town', '021 761 2117', 'https://stores.simplyasia.co.za/details/plumstead', NULL,
  'Simply Asia in Plumstead''s Richmond Centre is a Thai and Asian restaurant with food prepared by Thai chefs.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/simply-asia-plumstead/", "https://www.crave.co.za/establishment.asp?est=17353", "https://www.tripadvisor.co.za/Restaurant_Review-g6776488-d7851398-Reviews-Simply_Asia_Plumstead-Plumstead_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simply-asia-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'paul-bothner-music-plumstead', 'Paul Bothner Music',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-centre-plumstead'),
  'Shop G7, Richmond Centre, Main Road, Plumstead, Cape Town, 7800', '+27 21 761 4828', 'https://bothners.co.za/', NULL,
  'Paul Bothner Music''s Plumstead branch is a musical instrument superstore, one of four Paul Bothner Music stores serving the greater Cape Town area.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/paul-bothner-music-plumstead_2T", "https://bothners.co.za/plumstead-super-store-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'paul-bothner-music-plumstead'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'terrys-beds-plumstead', 'Terry''s Beds',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'richmond-centre-plumstead'),
  'Shop 1, 178 Main Road, Plumstead, Cape Town, 7800', '021 761 1041', NULL, NULL,
  'Terry''s Beds is a bedding and mattress showroom in Plumstead''s Richmond Centre, described as the biggest bedding showroom in the Southern Suburbs.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/amp/phone,27-217611041,Bed-Shop,Cape-Town,ZA6723.html", "https://opening-hours.co.za/02668058/Terry''s_Beds"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'terrys-beds-plumstead'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
