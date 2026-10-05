-- Thin-page fill, Pretoria batch 2, checkpoint 1: Wierdapark (fashion-clothing)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'fashion-capsule-wierdapark', 'Fashion Capsule',
  (SELECT id FROM suburbs WHERE slug = 'wierdapark'),
  '185 Koedoe Street, Wierdapark, Centurion, 0157', '012 688 3004', NULL, NULL,
  'Fashion Capsule is a clothing boutique on Koedoe Street in Wierdapark, Centurion, built around small, limited-run capsule collections rather than a continuously restocked range. Each release is kept deliberately exclusive, featuring versatile staples alongside new-season pieces, with stock rotated regularly instead of held as a standing inventory.

The shop offers in-store browsing with on-site parking and is open Monday to Friday from 08:00 to 17:00. It operates from a shopfront on Koedoe Street in the Wierdapark area of Centurion and maintains an active social media presence, where it describes its capsule-based model as an approach to fashion retail for shoppers looking for pieces that are not widely available elsewhere.',
  'Mon-Fri 08:00-17:00',
  NULL, NULL,
  '["https://www.facebook.com/fashioncapsulesa/", "https://pretoria.co.za/place/fashion-capsule"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fashion-capsule-wierdapark'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ifateleng-wierdapark', 'Ifateleng',
  (SELECT id FROM suburbs WHERE slug = 'wierdapark'),
  'Shop 8, Vitolina Centre, 191 Springbok Street, Wierdapark, Centurion, 0157', '068 615 9759', NULL, 'ifatelengwierdpark@gmail.com',
  'Ifateleng is a second-hand goods store trading from Shop 8 in the Vitolina Centre on Springbok Street in Wierdapark, Centurion. Alongside pre-owned clothing, the shop stocks used furniture and household appliances, giving shoppers in the area a local option for buying these items second-hand rather than new. It is listed under both clothing and general household-goods categories, reflecting the mixed range of used items it carries.

The store is open Monday to Friday from 09:00 to 17:00, and is closed on both Saturdays and Sundays. Customers can reach it by phone, by WhatsApp message, or by email, and its social media page lists all three as ways to check stock or ask about specific items before visiting the Wierdapark shopfront in person.',
  'Mon-Fri 09:00-17:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://destinali.com/centurion/fashion-clothing/ifateleng-wierdapark-centurion", "https://www.facebook.com/profile.php?id=61579498868993"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ifateleng-wierdapark'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
