INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'charlys-bakery-zonnebloem', 'Charly''s Bakery',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '38 Canterbury Street, Zonnebloem, Cape Town', '021 461 5181', NULL, NULL,
  'Charly''s Bakery is a bakery on Canterbury Street known for its custom cakes, cupcakes and baked treats, in Zonnebloem.',
  NULL, NULL,
  '["https://charlysbakery.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d2535353-Reviews-Charly_s_Bakery-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'charlys-bakery-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tommys-chop-shop-zonnebloem', 'Tommy''s Chop Shop',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '50 Canterbury Street, Zonnebloem, Cape Town', '063 681 7957', NULL, NULL,
  'Tommy''s Chop Shop is a neighbourhood bar on Canterbury Street serving cocktails and a whisky and bourbon selection, in Zonnebloem.',
  NULL, NULL,
  '["https://www.capetownetc.com/olivers-travels/inside-tommys-chop-shop-and-just-like-papa/", "https://tr.foursquare.com/v/tommys-chop-shop/6605d54a0f3e2271a8596ddd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tommys-chop-shop-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nude-foods-zonnebloem', 'Nude Foods',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '5 Constitution Street, Zonnebloem, Cape Town', '021 437 3003', NULL, NULL,
  'Nude Foods is a plastic-free grocery store on Constitution Street selling package-free wholefoods and sustainable products, in Zonnebloem.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/zonnebloem/supermarkets/nude-foods", "https://www.findglocal.com/ZA/Cape-Town/845006869007345/NUDE-FOODS"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nude-foods-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
