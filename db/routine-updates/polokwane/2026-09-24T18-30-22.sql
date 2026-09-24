INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-hampton-court-bendor', 'PostNet Hampton Court',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Hampton Court, Cnr Neethling & Pierre Street, Bendor, Polokwane, 0699', '087 310 6021', 'https://www.postnet.co.za/stores/hampton-court', 'hamptoncourt@postnet.co.za',
  'PostNet Hampton Court is a copy, print and courier services branch in Bendor, offering black & white and colour printing, wide-format printing and parcel courier services.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/hampton-court", "https://www.callupcontact.com/b/Courier_amp_Postal_Services/Postnet_Hampton_Court/3779"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-hampton-court-bendor'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
