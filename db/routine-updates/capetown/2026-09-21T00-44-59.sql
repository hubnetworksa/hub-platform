INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blue-water-cafe-kommetjie', 'Blue Water Café',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4545', NULL, NULL,
  'Blue Water Café is a restaurant at Imhoff Farm in Kommetjie, serving New Cape-style cuisine and wood-fired pizzas using fresh, local ingredients.',
  NULL, NULL,
  '["https://imhofffarm.co.za/blue-water-cafe/", "https://www.eatout.co.za/venue/blue-water-cafe-imhoff-farm/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blue-water-cafe-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'old-cape-wine-shop-kommetjie', 'Old Cape Wine Shop',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4545', NULL, NULL,
  'The Old Cape Wine Shop is a wine store at Imhoff Farm in Kommetjie, stocking a curated range of South African wines including small-batch and one-off releases.',
  NULL, NULL,
  '["http://imhofffarm.co.za/old-cape-wine-shop/", "https://blog.sa-venues.com/provinces/western-cape/the-imhoff-farm/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'old-cape-wine-shop-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'free-range-farm-shop-and-deli-kommetjie', 'Free Range Farm Shop and Deli',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  (SELECT id FROM shopping_centers WHERE slug = 'imhoff-farm-kommetjie'),
  'Imhoff Farm, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 5828', NULL, NULL,
  'Free Range Farm Shop and Deli is a farm shop and deli at Imhoff Farm in Kommetjie, stocking free-range meats, farm-style cheeses, olives and fresh-baked farmstall pies.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/free-range-farm-shop/", "https://imhofffarm.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'free-range-farm-shop-and-deli-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kommetjie-pizzeria-kommetjie', 'Kommetjie Pizzeria',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  'The Village Place, Erica Road, Kommetjie, Cape Town, 7975', '021 783 0524', NULL, NULL,
  'Kommetjie Pizzeria is a pizza restaurant at The Village Place on Erica Road in Kommetjie.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/phone,27-217830524,Pizza-Restaurant,Kommetjie,ZA282178.html", "https://za.africabz.com/western-cape/kommetjie-pizzeria-130024"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kommetjie-pizzeria-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kommetjie-surf-shop-kommetjie', 'Kommetjie Surf Shop',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  '1 Erika Road, Kommetjie, Cape Town, 7975', '021 783 4804', NULL, NULL,
  'Kommetjie Surf Shop is a surf shop in Kommetjie selling surfboards and related equipment and gear for the area''s big-wave, cold-water surf community.',
  NULL, NULL,
  '["https://komsurf.com/pages/contact-us", "https://www.safarinow.com/destinations/kommetjie/shops/kommetjie-surf-shop.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kommetjie-surf-shop-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harbour-house-kalk-bay', 'Harbour House',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  'Kalk Bay Harbour, Kalk Bay, Cape Town', '021 788 4133', NULL, NULL,
  'Harbour House is a seafood restaurant at Kalk Bay Harbour, part of the Harbour House restaurant group, with views over the working harbour.',
  NULL, NULL,
  '["https://www.harbourhouse.co.za/contact-us/", "https://www.tripadvisor.com/Restaurant_Review-g1788356-d1016469-Reviews-Harbour_House_Restaurant-Kalk_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harbour-house-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-to-cuba-kalk-bay', 'Cape to Cuba',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '165 Main Road, Kalk Bay, Cape Town, 7990', '021 788 1566', NULL, NULL,
  'Cape to Cuba is a Cuban-themed restaurant and bar on Main Road in Kalk Bay.',
  NULL, NULL,
  '["https://capetocuba.com/", "https://wanderboat.ai/restaurants/south-africa/western-cape/cape-to-cuba/f5mW8XjgSMS_Wr7hHBmfKA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-to-cuba-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalkys-kalk-bay', 'Kalky''s',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  'Kalk Bay Harbour, Kalk Bay, Cape Town', '021 788 1726', NULL, NULL,
  'Kalky''s is a harbourside fish and chips takeaway at Kalk Bay Harbour, operating on a cash-only basis.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/kalkys/", "https://oncebitten.co.za/?page_id=998"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalkys-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalk-bay-trading-post-kalk-bay', 'Kalk Bay Trading Post',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '71 Main Road, Kalk Bay, Cape Town, 7990', '021 788 9571', NULL, NULL,
  'Kalk Bay Trading Post is an antique dealer on Main Road in Kalk Bay, selling antiques, old coins, maps and vintage home furnishings.',
  NULL, NULL,
  '["https://www.africanadvice.com/1167472/Antique_Dealers/Cape_Town/Kalk_Bay_Trading_Post_Cc/", "https://insideguide.co.za/cape-town/kalk-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalk-bay-trading-post-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalk-bay-modern-kalk-bay', 'Kalk Bay Modern',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '136 Main Road, Kalk Bay, Cape Town', '021 788 6571', NULL, NULL,
  'Kalk Bay Modern is a contemporary art gallery on Main Road in Kalk Bay, showing Southern African art, ceramics, textiles and jewellery.',
  NULL, NULL,
  '["https://www.kalkbaymodern.co.za/", "https://www.art.co.za/galleries/kalk-bay-modern"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalk-bay-modern-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
