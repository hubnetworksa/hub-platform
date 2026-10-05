-- thin-pages pretoria batch-01: checkpoint 5 (Eldoraigne, Spas & Wellness)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'villa-thai-health-spa-eldoraigne', 'Villa Thai Health Spa',
  (SELECT id FROM suburbs WHERE slug = 'eldoraigne'),
  '1266 Willem Botha Drive, Eldoraigne, Centurion, 0157', '076 565 2504', 'https://www.villa-thaispa.co.za/', 'info@villa-thaispa.com',
  'Villa Thai Health Spa is a Thai-styled health spa at 1266 Willem Botha Drive in Eldoraigne, Centurion. The spa offers Thai massage alongside a broader treatment menu covering facials, hands and feet treatments, waxing and spa packages, with gift and treatment vouchers also available.

The business is built around a calm, spa-like atmosphere, with secure on-site parking noted by clients as part of the experience. Clients return regularly for its Thai massage treatments in particular, and the spa positions its offering around relaxation and pampering rather than medical or clinical treatments.

Villa Thai Health Spa operates seven days a week, from 9am to 8pm daily. It can be reached by phone, and treatment vouchers can be purchased online and redeemed in person; bookings are required to redeem a voucher or secure an appointment.',
  'Mon-Sun 09:00-20:00',
  NULL, NULL,
  '["https://www.villa-thaispa.co.za/", "https://www.facebook.com/VillaThaiHealthSpa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'villa-thai-health-spa-eldoraigne'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pure-bliss-day-spa-and-mobile-spa-eldoraigne', 'Pure Bliss Day Spa and Mobile Spa',
  (SELECT id FROM suburbs WHERE slug = 'eldoraigne'),
  '1275 Willem Botha Street, Eldoraigne, Centurion, 0157', '079 367 5822', NULL, NULL,
  'Pure Bliss Day Spa and Mobile Spa operates from 1275 Willem Botha Street in Eldoraigne, Centurion, offering both an on-site day spa and a mobile spa service that travels to clients. Treatments include massages, hand and foot treatments, facials, body scrubs and wraps, available as single treatments or as full-day and half-day spa packages.

The spa has a twin treatment room for couples or side-by-side bookings, food and beverage available on site, and a swimming pool as part of its facilities. Its treatment menu is built around relaxation and pampering rather than medical or clinical procedures, and packages are aimed at individuals, couples and small groups such as bridal parties.

Pure Bliss trades Monday to Saturday from 9am to 10pm and on Sundays from 9am to 6pm. The mobile spa option extends the same treatment menu to clients'' homes or venues, in addition to appointments at the Eldoraigne premises.',
  'Mon-Sat 09:00-22:00, Sun 09:00-18:00',
  NULL, NULL,
  '["https://www.spaguide.co.za/spa-directory-health-spas/pure-bliss-day-spa-and-mobile-spa-day-spa-in-eldoraigne-centurion-gauteng-3546.html", "https://showme.co.za/pretoria/pure-bliss-day-spa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pure-bliss-day-spa-and-mobile-spa-eldoraigne'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
