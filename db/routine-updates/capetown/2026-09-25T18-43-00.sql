INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lentegeur-pharmacy-lentegeur', 'Lentegeur Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  'Merrydale Road, Lentegeur, Mitchells Plain, Cape Town, 7785', '021 371 1775', NULL, NULL,
  'Lentegeur Pharmacy is a pharmacy on Merrydale Road in Lentegeur, Mitchells Plain.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/lentegeur-pharmacy-23823042.html", "https://www.brabys.com/za/western-cape/mitchells-plain/lentegeur/pharmacies/lentegeur-pharmacy", "https://www.africanadvice.com/1301958/Pharmacies/Western_Cape/Lentegeur_Pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lentegeur-pharmacy-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
