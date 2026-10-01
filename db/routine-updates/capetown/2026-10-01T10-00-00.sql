INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-home-diep-river', 'Mr Price Home',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '207-209 Main Road, Diep River, Cape Town', '021 713 2210', NULL, NULL,
  'Mr Price Home is a homeware retail store on Main Road, in Diep River.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/42340", "https://za.africabz.com/western-cape/mr-price-home-main-road-8015"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-home-diep-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chelsea-village-framers-and-curiosity-shoppe-diep-river', 'Chelsea Village Framers & Curiosity Shoppe',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  'Clan Building, 179B Main Road, Diep River, Cape Town, 7800', '021 712 8421', 'http://www.chelseavillageframers.co.za/', NULL,
  'Chelsea Village Framers & Curiosity Shoppe is a custom framing, decor and gift shop, established in 2012, in Diep River.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10438272_2", "https://nearbyza.com/place/chelsea-village"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chelsea-village-framers-and-curiosity-shoppe-diep-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
