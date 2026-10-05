-- thin-pages pretoria batch 12: checkpoint 1 (Florauna + Midrand)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'florauna-slaghuis-butchery-florauna', 'Florauna Slaghuis Butchery',
  (SELECT id FROM suburbs WHERE slug = 'florauna'),
  '586 Brits Rd, Florauna Sentrum, Pretoria North, Pretoria, 0116', '061 362 4275', NULL, NULL,
  'Florauna Slaghuis Butchery is a butcher shop and deli trading from Florauna Sentrum on Brits Road in Pretoria North. The store stocks a range of premium meats and fresh cuts alongside a curated deli selection, aimed at customers looking for quality cuts without leaving the local shopping centre.

Customers can expect a clean, efficient shopping environment and straightforward service from staff described as knowledgeable. The butchery accepts card payments and the premises are wheelchair accessible, with an accessible entrance and parking available at the centre. Trading six days a week, Florauna Slaghuis Butchery serves Florauna and the wider Pretoria North area as a neighbourhood option for everyday meat and deli purchases, closed only on Sundays.',
  'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun Closed',
  NULL, NULL,
  '["https://pretoria.co.za/place/florauna-slaghuis-butchery", "https://www.google.com/search?q=Florauna+Slaghuis+Butchery+Pretoria+North"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'florauna-slaghuis-butchery-florauna'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'florauna-campus-kampus-florauna', 'Florauna Campus / Kampus',
  (SELECT id FROM suburbs WHERE slug = 'florauna'),
  '706 Berg Ave, Florauna, Pretoria, 0182', '012 546 1928', 'https://floraunacampus.co.za/', NULL,
  'Florauna Campus / Kampus is a bilingual Christian private school in Florauna, at the foot of the Magaliesberg in Pretoria North, with more than 20 years in Christian-centred education. The school cares for children from 3 months old through to Grade 3, and separately offers aftercare for learners in Grades R to 7.

Class sizes are capped at a maximum of 25 learners, each with a dedicated teacher and an assistant, and the campus has secure access with CCTV. Florauna Campus / Kampus is registered with both the Department of Social Development and the Gauteng Department of Education, covering the regulatory requirements for early childhood care through to primary schooling. It serves families in Florauna and the wider Pretoria North area looking for a small, bilingual, Christian-based school with aftercare options through the primary years.',
  NULL,
  NULL, NULL,
  '["https://floraunacampus.co.za/", "https://www.google.com/search?q=%22Florauna+Campus%22+OR+%22Florauna+Kampus%22+706+Berg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'florauna-campus-kampus-florauna'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'so-divine-spa-and-wellness-florauna', 'So Divine Spa and Wellness',
  (SELECT id FROM suburbs WHERE slug = 'florauna'),
  '144 Krinkhout Avenue, Florauna, Pretoria North, 0182', '072 379 6501', NULL, NULL,
  'So Divine Spa and Wellness is a day spa on Krinkhout Avenue in Florauna, Pretoria North, offering massage, facial and body treatments in an upscale, welcoming setting. The business describes its own service as ranging from indulgent spa massages to revitalising facials, with on-site restroom facilities and wheelchair-accessible entrance and parking.

Treatments start from around R80, giving clients an accessible entry point alongside more involved massage and facial packages. The business has built up a strong reputation locally, rated between 4.7 and 4.9 out of 5 across different booking and review platforms, with review counts running into the dozens and, on one platform, over ninety. So Divine Spa and Wellness serves residents of Florauna and the wider Pretoria North area as a neighbourhood option for massage and facial treatments in a tranquil, professionally run spa.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/so-divine-spa-and-wellness", "https://www.google.com/search?q=spa+wellness+Florauna+Pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'so-divine-spa-and-wellness-florauna'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cowfish-waterfall-midrand', 'Cowfish Waterfall',
  (SELECT id FROM suburbs WHERE slug = 'midrand'),
  'Shop 31, cnr Woodmead & Waterfall Dr, Waterfall Corner Shopping Centre, Midrand, 2090', '010 157 1290', 'https://cow-fish.co.za/#waterfall', NULL,
  'Cowfish Waterfall is a restaurant and grill trading from Shop 31 in Waterfall Corner Shopping Centre, on the corner of Woodmead Drive and Waterfall Drive in Midrand. The menu spans Continental, Asian, grill and health-conscious dishes, giving diners a broad range of options from sushi and dim sum style plates to seafood and grilled mains.

The restaurant has built a strong local following, holding a 4.6 out of 5 rating across more than 800 Google reviews, and is described by reviewers as offering a vibrant dining experience that brings fresh flavours and creative presentation together. Cowfish Waterfall serves diners in the Waterfall and Vorna Valley pocket of Midrand looking for a sit-down restaurant combining Asian and Continental-style cooking with grill and health-focused choices in one shopping centre location.',
  NULL,
  NULL, NULL,
  '["https://cow-fish.co.za/#waterfall", "https://www.google.com/search?q=%22Cowfish%22+Waterfall+Midrand"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cowfish-waterfall-midrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'dinerboyz-midrand-midrand', 'Dinerboyz Midrand',
  (SELECT id FROM suburbs WHERE slug = 'midrand'),
  '62 Anton Hartmann St, Vorna Valley, Midrand, 1686', '081 314 9222', 'https://www.dinerboyz.com/', NULL,
  'Dinerboyz Midrand is an Indian restaurant and takeaway on Anton Hartmann Street in Vorna Valley, Midrand. The menu is built around curries and Durban-style bunny chow -- curry served in a hollowed-out loaf of bread -- including mutton and broad bean bunny options, alongside tikka dishes, samoosas and prawn curry.

The restaurant is listed on halal restaurant-finder platforms, pointing to a halal-friendly menu, and trades seven days a week at a mid-range price point of roughly R100 to R200 per person. Reviews describe quick order turnaround, friendly staff and generous portion sizes for the price. Dinerboyz Midrand serves residents of Vorna Valley and the wider Midrand area as a takeaway and sit-down option for Indian cuisine, with bunny chow as its signature dish.',
  'Mon-Sun 10:30-19:30',
  NULL, NULL,
  '["https://www.dinerboyz.com/", "https://www.google.com/search?q=%22Dinerboyz%22+%2262+Anton+Hartmann%22"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dinerboyz-midrand-midrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'build-it-bronkhorstspruit-bronkhorstspruit', 'Build it Bronkhorstspruit',
  (SELECT id FROM suburbs WHERE slug = 'bronkhorstspruit'),
  'Shop 34, Bronkhorstspruit Mall, 39 Lanham Street, Bronkhorstspruit, Gauteng, 1020', '013 935 1955', 'https://www.buildit.co.za/Stores/View/Build-it-Bronkhorstspruit-Gauteng', 'shop@bronkbuildit.co.za',
  'Build it Bronkhorstspruit is a hardware and building-materials store trading from Shop 34 in Bronkhorstspruit Mall on Lanham Street. As part of the nationwide Build It hardware group, the branch stocks general hardware, building materials and home-improvement supplies, and offers services including deliveries, key cutting, gas refills, paint mixing, glass cutting and reading of building plans.

Reviewers describe the store as well stocked with good pricing and helpful staff, reflecting a rating of 3.8 out of 5 across more than 200 Google reviews. Build it Bronkhorstspruit serves builders, contractors and residents across Bronkhorstspruit needing hardware, building supplies and home-improvement materials from a single mall-based branch, with its position inside Bronkhorstspruit Mall making it an easy stop alongside other shopping in the town centre.',
  'Mon-Fri 07:30-17:00, Sat 08:00-14:00, Sun 09:00-14:00',
  NULL, NULL,
  '["https://www.buildit.co.za/Stores/View/Build-it-Bronkhorstspruit-Gauteng", "https://www.google.com/search?q=hardware+store+Bronkhorstspruit"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'build-it-bronkhorstspruit-bronkhorstspruit'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kungwini-mica-bronkhorstspruit', 'Kungwini Mica',
  (SELECT id FROM suburbs WHERE slug = 'bronkhorstspruit'),
  '45 Lanham Street, Erasmus, Bronkhorstspruit, Gauteng, 1020', '013 932 3129', 'https://mica.co.za/store-location/gauteng/kungwini-mica', 'cic@mica.co.za',
  'Kungwini Mica is a hardware store on Lanham Street in the Erasmus area of Bronkhorstspruit, trading as part of the nationwide Mica hardware franchise group. The branch specialises in general hardware, paint, and board cutting and edging services, alongside DIY supplies, and has previously run an in-store shop-in-shop promotion for INGCO power tools.

The store has built up a strong local reputation, rated 4.2 out of 5 across more than 500 Google reviews, with customers describing staff as consistently friendly and the store as well stocked and well priced. Kungwini Mica serves Bronkhorstspruit and the surrounding Erasmus area as a Mica-branded option for hardware, paint, board-cutting and home-improvement purchases.',
  'Mon-Fri 07:00-17:00, Sat 07:00-13:00, Sun 08:00-12:00',
  NULL, NULL,
  '["https://mica.co.za/store-location/gauteng/kungwini-mica", "https://www.facebook.com/KungwiniMicaHardware"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kungwini-mica-bronkhorstspruit'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-glass-house-guest-house-bronkhorstspruit', 'The Glass House Guest House',
  (SELECT id FROM suburbs WHERE slug = 'bronkhorstspruit'),
  '1451 Kingfisher Street, Kungwini Bay, Bronkhorstspruit Baai, 1020', '063 141 0375', NULL, NULL,
  'The Glass House Guest House is a guest house within Kungwini Country Estate in Kungwini Bay, part of the Bronkhorstspruit Baai area outside Bronkhorstspruit. The property offers a swimming pool, free secure parking and Wi-Fi for guests, with rooms sleeping up to two people from around R1,200 a night.

Set inside the broader Kungwini Country Estate, the guest house gives visitors a self-contained base near the Bronkhorstspruit dam area, with on-site parking and pool access included in the stay. The Glass House Guest House is listed on booking platforms alongside reviews from past guests, and serves travellers and weekend visitors looking for guest-house accommodation in the Kungwini Country Estate and Bronkhorstspruit Baai area rather than in the Bronkhorstspruit town centre itself.',
  NULL,
  NULL, NULL,
  '["https://www.google.com/search?q=%22The+Glass+House%22+Kungwini+Country+Estate+Bronkhorstspruit", "https://www.lekkeslaap.co.za/accommodation-in/bronkhorstspruit"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-glass-house-guest-house-bronkhorstspruit'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
