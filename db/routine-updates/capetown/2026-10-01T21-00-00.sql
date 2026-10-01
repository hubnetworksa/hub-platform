INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-constantia-constantia', 'PostNet Constantia',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Shop 6, Old Village Shopping Centre, Constantia Main Road, Constantia, Cape Town', '021 794 0447', NULL, NULL,
  'PostNet Constantia is a PostNet store offering printing, courier services and stationery, in Constantia.',
  NULL, NULL,
  '["https://postnet.co.za/stores/constantia", "https://www.callupcontact.com/b/Courier_amp_Postal_Services/Postnet_Constantia/3826"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-constantia-constantia'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
