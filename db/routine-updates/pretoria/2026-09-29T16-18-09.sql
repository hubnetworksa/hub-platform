INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lynnwood-galleries-lynnwood', 'Lynnwood Galleries',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood'),
  '354 Rosemary Road, Lynnwood, Pretoria, 0081', NULL, NULL,
  '["https://lynnwoodgalleries.co.za/", "https://www.primereal.co.za/lynwood-galleries-1"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lm-in-the-east-lynnwood', 'LM in the East',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-galleries-lynnwood'),
  'Lynnwood Galleries, Shop No. 6, Cnr Rosemary & Diana Rd, Lynnwood, Pretoria, 0081', '012 348 3359', 'https://eatatlm.co.za/', NULL,
  'LM in the East is one of Pretoria''s oldest Portuguese family restaurants, known for its seafood, pizza and steak menu including prawns, calamari and prego rolls. It is located in Lynnwood Galleries on the corner of Rosemary and Diana Streets, and trades daily from 10am to 10pm.',
  NULL, NULL,
  '["https://eatatlm.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d1929043-Reviews-LM_in_the_East-Pretoria_Gauteng.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lm-in-the-east-lynnwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-bertus-van-niekerk-orthodontist-lynnwood', 'Dr Bertus van Niekerk Orthodontist',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood'),
  'Suite 202, Xcel Park, 441 Rodericks Road, Lynnwood, Pretoria, 0081', '012 348 1196', NULL, NULL,
  'Dr Bertus van Niekerk Orthodontist is a specialist orthodontic practice in Lynnwood offering braces, clear aligners and minimally invasive corrective jaw procedures for children, adolescents and adults, including retainers and bite correction.',
  NULL, NULL,
  '["https://southafricandoctors.co.za/orthodontist/gauteng/pretoria/lynnwood/bertus-van-niekerk", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=59176"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-bertus-van-niekerk-orthodontist-lynnwood'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
