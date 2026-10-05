-- thin-pages pretoria batch-01: checkpoint 3 (Irene Farm Villages, Beauty & Hair Salons)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cinnedene-studios-irene-farm-villages', 'Cinnedene Studios',
  (SELECT id FROM suburbs WHERE slug = 'irene-farm-villages'),
  (SELECT id FROM shopping_centers WHERE slug = 'irene-village-mall-irene-farm-villages'),
  'Shop 179, Basement, Irene Village Mall, Cnr Nellmapius Dr & Van Ryneveld Ave, Irene, Centurion, 0133', '068 343 3749', 'https://www.cinnedene.co.za/', NULL,
  'Cinnedene Studios is a makeup, beauty and aesthetics practice trading from Irene Village Mall in Irene Farm Villages. The studio offers professional make-up, nail services and advanced beauty and aesthetic treatments, including facial rejuvenation and skin resurfacing, from a single location that combines aesthetic treatment rooms, a makeup counter and nail bars.

As a flagship practice of DrK and a stockist of Kryolan, the studio carries a curated range of make-up and skincare brands, including Stila, Yungskin, SunSkin, Trind, Jenna Clifford and Glasshouse. It is registered with the South African Association of Health and Skincare Professionals (SAAHSP), and an in-house somatologist is available for skin-care consultations alongside the studio''s beauty and nail teams.

The business describes itself as more than a single-service beauty counter, built around makeup, medical-grade aesthetics and nail care under one roof for clients visiting Irene Village Mall. It markets seasonal bookings for occasions such as weddings and festive events, alongside its regular walk-in beauty, nail and skincare treatments.',
  NULL,
  NULL, NULL,
  '["https://www.cinnedene.co.za/", "https://www.beautynailhairsalons.com/ZA/Pretoria/1606172819659424/Cinnedene-Makeup-%26-Aesthetics"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cinnedene-studios-irene-farm-villages'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
