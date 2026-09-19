-- Kenwyn suburb checkpoint (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'backyard-brew-coffee-co-kenwyn', 'Backyard Brew Coffee Co.',
  (SELECT id FROM suburbs WHERE slug = 'kenwyn'),
  '74 Pinehurst Road, Kenwyn, Cape Town, 7779', '072 358 4486', 'https://www.backyardbrewcoffee.co.za', NULL,
  'Backyard Brew Coffee Co. is an owner-run coffee roastery in Kenwyn, roasting beans to order and offering collection by arrangement, Monday to Saturday.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/backyard-brew-coffee-co-165195", "https://harfield-village.co.za/business/backyard-brew-coffee-company/", "https://www.backyardbrewcoffee.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'backyard-brew-coffee-co-kenwyn'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'taaz-tours-kenwyn', 'Taaz Tours',
  (SELECT id FROM suburbs WHERE slug = 'kenwyn'),
  '2 Rockford Place, Rockford Road, Kenwyn, Cape Town, 7780', '083 409 9155', NULL, NULL,
  'Taaz Tours is a Kenwyn-based tour operator offering tours of Cape Town''s cultural and natural heritage.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/kenwyn/tours/taaz-tours", "https://cape-town.infoisinfo.co.za/card/taaz-tours/342035"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'taaz-tours-kenwyn'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);
