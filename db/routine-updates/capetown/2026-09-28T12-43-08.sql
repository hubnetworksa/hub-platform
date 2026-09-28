INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpha-pharm-lentegeur-pharmacy-lentegeur', 'Alpha Pharm Lentegeur Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  '79E Merrydale Road, Lentegeur, Mitchells Plain, Cape Town', '021 371 1775', NULL, NULL,
  'Alpha Pharm Lentegeur Pharmacy is a pharmacy on Merrydale Road in Lentegeur, Mitchells Plain.',
  NULL, NULL,
  '["https://www.africanadvice.com/1301958/Pharmacies/Western_Cape/Lentegeur_Pharmacy/", "https://thinklocal.co.za/biz/lentegeur-pharmacy-mitchells-plain", "https://www.hotfrog.co.za/company/0dc538da048b5422832895641074ba9c/alpha-pharm-lentegeur-pharmacy/cape-town/pharmacies-prescriptions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpha-pharm-lentegeur-pharmacy-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
