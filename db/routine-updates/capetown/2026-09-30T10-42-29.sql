-- Thornton: new business, tenant of Viking Place Convenience Centre
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mancelles-locksmiths-thornton', "Mancelle's Locksmiths",
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  (SELECT id FROM shopping_centers WHERE slug = 'viking-place-convenience-centre-thornton'),
  'Shop 8, Corner Viking & Odin Road, Thornton, Cape Town, 7460', '021 532 2271', NULL, NULL,
  "Mancelle's Locksmiths is a locksmith offering key cutting, lock supply and fitting, and vehicle key coding, in Thornton.",
  NULL, NULL,
  '["https://247locksmithscapetown.co.za/directory/mancelle-s-locksmiths-pty-ltd-7490/", "https://www.brabys.com/za/western-cape/cape-town/thornton/locksmiths/mancelles-locksmiths"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mancelles-locksmiths-thornton'),
  (SELECT id FROM categories WHERE slug = 'locksmiths'),
  1
);
