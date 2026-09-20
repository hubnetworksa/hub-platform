INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'psg-wealth-polokwane-ismini-park-bendor', 'PSG Wealth Polokwane Ismini Park',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'PSG Building, 26 Ismini Street, Ismini Office Park, Bendor, Polokwane, 0699', '015 291 4734', NULL, NULL,
  'PSG Wealth Polokwane Ismini Park is a financial advisory branch office in Bendor, offering wealth and investment planning services.',
  NULL, NULL,
  '["https://www.psg.co.za/branch-office/polokwane-ismini-park-johan-van-ravesteyn", "https://south-africa.worldplaces.me/view-place/75911841-psg-wealth-polokwane-ismini-park-gerhard-mare.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'psg-wealth-polokwane-ismini-park-bendor'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
