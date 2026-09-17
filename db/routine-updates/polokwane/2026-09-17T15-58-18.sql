-- Owner-requested addition to Doctors & GPs: Medpark Family Practice.
-- Verified across multiple independent sources (Facebook, Cylex,
-- medpages.info, YEP, Yellow Pages Network) plus its own site
-- (medpark.co.za) -- consistent on 24 Jorissen Street and the phone
-- number; only the house number varies trivially (24 vs 24a) across
-- sources, not a real address conflict.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'medpark-family-practice-polokwane-central', 'Medpark Family Practice',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24 Jorissen Street, Polokwane, 0700', '015 297 2180', 'https://medpark.co.za/', 'medpark1@mweb.co.za',
  'Medpark Family Practice is a general practice on Jorissen Street in Polokwane Central, offering GP consultations and family medical care.',
  NULL, NULL,
  '["https://medpark.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=11879", "https://www.facebook.com/medpark.doctors/"]',
  'published', 'agent_research', 'Mon-Fri 07:00-19:00, Sat 08:00-19:00, Sun 09:30-19:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medpark-family-practice-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);
