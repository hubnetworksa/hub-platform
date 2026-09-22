INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-pool-team-tokai-kirstenhof', 'The Pool Team Tokai',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  (SELECT id FROM shopping_centers WHERE slug = 'kirstenhof-shopping-centre-kirstenhof'),
  'Unit 5, Kirstenhof Shopping Centre, 282 Main Road, Kirstenhof, Cape Town, 7945', '021 712 1917', NULL, 'tokai@thepoolteam.co.za',
  'The Pool Team Tokai is a swimming pool equipment, chemicals and maintenance retailer in Kirstenhof Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-pool-team-tokai-253184", "https://www.facebook.com/ThePoolTeam/photos/weve-moved-visit-us-at-our-new-storethe-pool-team-tokaikirstenhof-shopping-centr/778577780938300/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-pool-team-tokai-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-tokai-kirstenhof', 'Cash Crusaders Tokai',
  (SELECT id FROM suburbs WHERE slug = 'kirstenhof'),
  (SELECT id FROM shopping_centers WHERE slug = 'kirstenhof-shopping-centre-kirstenhof'),
  'Shop 11, Kirstenhof Shopping Centre, Cnr Main & Tokai Roads, Kirstenhof, Cape Town, 7945', '021 712 5041', 'https://cashcrusaders.co.za/storedetails?location=Tokai', NULL,
  'Cash Crusaders Tokai is a second-hand goods and pawnbroking store in Kirstenhof Shopping Centre, buying and selling electronics, tools and household items.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/cash-crusaders-tokai-162482", "https://www.tiendeo.co.za/stores/cape-town/cash-crusaders-pick-n-pay-centre-main-and-tokai-roads-tokai/22215", "https://cashcrusaders.co.za/locate-a-store/store/68/Cash%20Crusaders%20Tokai"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-tokai-kirstenhof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcgregor-take-aways-meadowridge', 'McGregor Take Aways',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Firgrove Way, Meadowridge Shopping Centre, Meadowridge, Cape Town, 7945', '021 712 9298', NULL, NULL,
  'McGregor Take Aways is a fish and chips takeaway in Meadowridge Shopping Centre.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/mc-gregor-46656", "https://www.thinklocal.co.za/biz/mcgregor-take-aways-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcgregor-take-aways-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
