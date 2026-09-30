INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nouvelle-ere-beauty-spa-and-boutique-guesthouse-the-reeds', 'Nouvelle Ere Beauty Spa & Boutique Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'the-reeds'),
  '222 Panorama Rd, The Reeds, Centurion', '012 023 4007', NULL, NULL,
  'Nouvelle Ere Beauty Spa & Boutique Guesthouse is a boutique guesthouse in The Reeds, Centurion, offering overnight accommodation with breakfast alongside an on-site day spa providing massages, body scrubs, body wraps and sauna sessions.',
  NULL, NULL,
  '["https://www.fresha.com/lp/fr/bt/spas/za-centurion/the-reeds-ext-15", "https://www.booking.com/hotel/za/nouvelle-ere-beauty-spa-amp-boutique-guesthouse.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nouvelle-ere-beauty-spa-and-boutique-guesthouse-the-reeds'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'exquiste-hair-salon-the-reeds', 'Exquiste Hair Salon',
  (SELECT id FROM suburbs WHERE slug = 'the-reeds'),
  (SELECT id FROM shopping_centers WHERE slug = 'blu-valley-mall-the-reeds'),
  'Shop 5, Blu Valley Mall, The Reeds, Centurion, 0061', '076 794 3360', NULL, NULL,
  'Exquiste Hair Salon is a hair salon at Shop 5 in Blu Valley Mall, The Reeds, Centurion, offering women''s haircuts and styling, open daily including Saturdays and Sundays.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/exquiste-hair-salon-centurion-G57v31", "https://bluvalleymall.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'exquiste-hair-salon-the-reeds'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
