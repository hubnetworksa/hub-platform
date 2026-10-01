INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ringpharm-pharmacy-centurion-crescent-zwartkop', 'Ringpharm Pharmacy - Centurion Crescent',
  (SELECT id FROM suburbs WHERE slug = 'zwartkop'),
  (SELECT id FROM shopping_centers WHERE slug = 'centurion-crescent-shopping-centre-zwartkop'),
  'Shop 4A & 5A, Centurion Crescent Centre, 81 Lenchen Avenue, Zwartkop, Centurion, 0157', '012 001 9556', NULL, NULL,
  'Ringpharm Pharmacy - Centurion Crescent is a branch of the Ringpharm group of independently owned community pharmacies, trading from Centurion Crescent Shopping Centre on Lenchen Avenue in Zwartkop, and offers prescription dispensing, health advice and vaccinations.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Centurion/Samrand/Pharmacy/Ringpharm-Centurion-Crescent-Pharmacy/store/23c4818", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1837504"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ringpharm-pharmacy-centurion-crescent-zwartkop'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
