INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-luxe-beaute-co-brooklyn', 'The Luxe Beauté Co.',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '57 Koeberg Road, Unit 1, Brooklyn, Cape Town, 7405', '021 512 1254', NULL, NULL,
  'The Luxe Beauté Co. is a beauty salon in Brooklyn offering nail, hair and skin treatments including gel overlays, brow waxing and tinting, and hair treatments.',
  NULL, NULL,
  '["https://www.fresha.com/a/the-luxe-beaute-co-brooklyn-cape-town-57-koeberg-road-n4qxa9ji", "https://epilfree.co.za/the-luxe-beaute-co/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-luxe-beaute-co-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'billboard-barbershop-brooklyn', 'Billboard Barbershop',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '57 Koeberg Road, Brooklyn, Cape Town, 7489', '071 078 8826', NULL, NULL,
  'Billboard Barbershop is a barbershop in Brooklyn serving the northern suburbs of Cape Town.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/the-billboard-barber-shop-koeberg-road-cape-town-xZYr6E", "https://www.facebook.com/Billboardbarbershop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'billboard-barbershop-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-brooklyn-junction-brooklyn', 'Clicks Brooklyn Junction',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  'Shop 2, Brooklyn Junction, Koeberg Road, Brooklyn, Cape Town, 7405', '021 460 1846', NULL, NULL,
  'Clicks Brooklyn Junction is a pharmacy and health, beauty and homeware retailer in the Brooklyn Junction centre.',
  NULL, NULL,
  '["https://clicks.co.za/store/Brooklyn-Junction/2183", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1884387"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-brooklyn-junction-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
