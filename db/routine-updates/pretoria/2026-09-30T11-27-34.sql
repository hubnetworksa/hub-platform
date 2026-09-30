-- Discovery checkpoint: Rooihuiskraal North (Centurion), Pretoria
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'centurion-lifestyle-centre-rooihuiskraal-north', 'Centurion Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'rooihuiskraal-north'),
  'Lenchen Ave, Rooihuiskraal North, Centurion, 0157', NULL, NULL,
  '["https://uk.trip.com/restaurant/south%20africa/centurion/detail/Kiowa%20Spur%20Steak%20Ranch-34954959", "https://magicpin.com/south-africa/Centurion/Eldoraigne/Restaurant/Kiowa-Spur/store/23c1400/reviews"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kiowa-spur-steak-ranch-rooihuiskraal-north', 'Kiowa Spur Steak Ranch',
  (SELECT id FROM suburbs WHERE slug = 'rooihuiskraal-north'),
  (SELECT id FROM shopping_centers WHERE slug = 'centurion-lifestyle-centre-rooihuiskraal-north'),
  'Shop 1, Centurion Lifestyle Centre, Lenchen Ave, Rooihuiskraal North, Centurion, 0157', '012 653 1644', NULL, NULL,
  'Kiowa Spur Steak Ranch is a branch of the nationwide Spur Steak Ranches family restaurant chain, trading daily from 07:00 to 21:00 out of Centurion Lifestyle Centre on Lenchen Avenue, Rooihuiskraal North.',
  NULL, NULL,
  '["https://uk.trip.com/restaurant/south%20africa/centurion/detail/Kiowa%20Spur%20Steak%20Ranch-34954959", "https://magicpin.com/south-africa/Centurion/Eldoraigne/Restaurant/Kiowa-Spur/store/23c1400/reviews"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kiowa-spur-steak-ranch-rooihuiskraal-north'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-basket-reds-mall-rooihuiskraal-north', 'Ocean Basket Reds Mall',
  (SELECT id FROM suburbs WHERE slug = 'rooihuiskraal-north'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-reds-rooihuiskraal-north'),
  'Shop E3, Mall@Reds, Cnr Rooihuiskraal Rd & Hendrik Verwoerd Dr, Rooihuiskraal North, Centurion, 0157', '012 656 0526', NULL, NULL,
  'Ocean Basket Reds Mall is a branch of the nationwide Ocean Basket seafood restaurant chain, in the Mall@Reds shopping centre on Rooihuiskraal Road, Rooihuiskraal North, trading daily with closing time between 20:00 and 21:00 depending on the day of the week.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Centurion/Eldoraigne/Restaurant/Ocean-Basket-Reds-Mall/store/235c974/reviews", "https://wanderlog.com/place/details/3472199"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-basket-reds-mall-rooihuiskraal-north'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
