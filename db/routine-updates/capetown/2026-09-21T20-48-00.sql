INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kromboom-gardens-centre-rondebosch-east', 'Kromboom Gardens Centre',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  'Kromboom Road, Kromboom Gardens, Rondebosch East, Cape Town, 7780', NULL, NULL,
  '["https://www.fresha.com/a/lash-fit-artists-eyelash-brow-professionals-cape-town-room-2-kromboom-gardens-kromboom-road-rondebosch-east-located-at-the-kwikspar-shopping-centre-in-kromboom-road-our-security-door-is-located-between-kwikspars-entrance-and-steers-ring-door-wjugfbkh/booking", "https://za.africabz.com/western-cape/kwikspar-40807"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-kromboom-rondebosch-east', 'KwikSpar Kromboom',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-gardens-centre-rondebosch-east'),
  'Kromboom Road, Kromboom Gardens, Rondebosch East, Cape Town, 7780', '021 697 2834', NULL, NULL,
  'KwikSpar Kromboom is a supermarket in Kromboom Gardens, Rondebosch East.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kwikspar-40807", "https://www.callupcontact.com/b/Supermarkets/Kromboom_KwikSpar/41059"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-kromboom-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-kromboom-rd-rondebosch-east', 'Steers Kromboom Rd',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-gardens-centre-rondebosch-east'),
  'Shop 3, 1st Floor, 134 Kromboom Road, Rondebosch East, Cape Town, 7780', '021 696 9993', NULL, NULL,
  'Steers Kromboom Rd is a flame-grilled burger and chicken fast-food outlet in Kromboom Gardens, Rondebosch East.',
  NULL, NULL,
  '["https://location.steers.co.za/kromboom-rd", "https://www.tripadvisor.co.za/Restaurant_Review-g2426452-d8661780-Reviews-Steers-Rondebosch_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-kromboom-rd-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'frying-nemo-rondebosch-east', 'Frying Nemo',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-gardens-centre-rondebosch-east'),
  'Shop 5, Kromboom Gardens, Kromboom Road, Rondebosch East, Cape Town, 7780', '073 944 0753', NULL, NULL,
  'Frying Nemo is a seafood takeaway in Kromboom Gardens, Rondebosch East.',
  NULL, NULL,
  '["https://hungryforhalaal.co.za/listing/frying-nemo-rondebosch-east/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d23117101-Reviews-Frying_Nemo-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'frying-nemo-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kromboom-dental-centre-rondebosch-east', 'Kromboom Dental Centre',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  'Cnr Kromboom & Burwood Road, Rondebosch East, Cape Town, 7780', '021 696 9428', 'https://www.kromboomdental.co.za', NULL,
  'Kromboom Dental Centre is a dental practice on the corner of Kromboom and Burwood Roads, Rondebosch East.',
  NULL, NULL,
  '["https://www.kromboomdental.co.za/contact/", "https://www.whatclinic.com/dentists/south-africa/cape-town/kromboom-dental-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kromboom-dental-centre-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'savoy-lodge-rondebosch-east', 'Savoy Lodge',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  '86 Kromboom Road & 3rd Avenue, Rondebosch East, Cape Town, 7764', '021 696 5783', 'http://www.savoylodge.co.za', NULL,
  'Savoy Lodge is a guest lodge on Kromboom Road, Rondebosch East.',
  NULL, NULL,
  '["http://www.savoylodge.co.za/", "https://holidays.africastay.com/accommodation/in-Cape_Town/South_Africa/savoy-lodge-rondebosch-east-south-africa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'savoy-lodge-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
