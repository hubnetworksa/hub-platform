-- Jobs 1-2: Kuils River suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'algarve-restaurant-bar-kuils-river', 'Algarve Restaurant & Bar',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '20 Church Street, Kuils River, Cape Town, 7580', '087 153 1957', NULL, NULL,
  'Algarve Restaurant & Bar is a Portuguese and South African restaurant serving seafood platters and grilled dishes, in Kuils River.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2213035-d27119572-Reviews-Algarve_Restaurant_Bar_Venue-Kuils_River_Western_Cape.html", "https://www.findglocal.com/ZA/Kuils-River/105233781057842/Algarve-Restaurant-&-Bar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'algarve-restaurant-bar-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beantree-coffee-shop-kuils-river', 'Beantree Coffee Shop',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Haasendal Gables, Bottelary Road, Kuils River, Cape Town, 7580', '021 286 6858', NULL, NULL,
  'Beantree Coffee Shop is a coffee shop at Haasendal Gables, Kuils River.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2213035-d17697555-Reviews-Beantree_Coffee_Shop-Kuils_River_Western_Cape.html", "https://www.sluurpy.co.za/kuils-river/restaurant/5031916/beantree-coffee-shop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beantree-coffee-shop-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'river-park-shopping-centre-kuils-river', 'River Park Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Corner Nooiensfontein & Van Riebeeck Road, Kuils River, Cape Town, 7580', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/river-park-shopping-centre.html", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/kuils-river/river-park-mall-4-nooiensfontein-road-17220/unit-7-and-8-48520"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-kuils-river', 'Cash Crusaders Kuilsriver',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'river-park-shopping-centre-kuils-river'),
  'Nooiensfontein Road, River Park Shopping Centre, Kuils River, Cape Town, 7580', '021 906 6415', NULL, NULL,
  'Cash Crusaders Kuilsriver is a second-hand goods and pawnbroking store inside River Park Shopping Centre, Kuils River.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/899257/cash-crusaderskuils-river", "https://cashcrusaders.co.za/storedetails?location=Kuilsrivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
