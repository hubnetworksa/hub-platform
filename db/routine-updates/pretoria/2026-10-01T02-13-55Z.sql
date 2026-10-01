INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'apogee-boutique-hotel-and-spa-waterkloof-ridge', 'Apogee Boutique Hotel & Spa',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-ridge'),
  '212 Johann Rissik Drive, Waterkloof Ridge, Pretoria, 0181', '012 786 0740', 'https://apogeeboutiquehotelspa.wa.profitroom.com', NULL,
  'Apogee Boutique Hotel & Spa is a family-owned boutique hotel set in landscaped gardens, offering luxury suites, a full spa, the on-site Tribute Restaurant for fine dining, and meeting and event facilities, in Waterkloof Ridge, Pretoria.',
  NULL, NULL,
  '["https://apogeeboutiquehotelspa.wa.profitroom.com/hotel", "https://www.successfulmeetings.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/Apogee-Boutique-Hotel-Spa-p59646961"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'apogee-boutique-hotel-and-spa-waterkloof-ridge'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'montpellier-guest-house-waterkloof-ridge', 'Montpellier Guest House',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-ridge'),
  '221 Delphinus Street, Waterkloof Ridge, Pretoria, 0181', '012 460 4351', 'http://www.montpellierguesthouse.co.za', NULL,
  'Montpellier Guest House is a 12-room guesthouse with a meeting room, free WiFi in common areas, an outdoor pool and nearby golf course access, in Waterkloof Ridge, Pretoria.',
  NULL, NULL,
  '["https://www.successfulmeetings.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/Montpellier-Guest-House-p53140600", "https://www.lastminutetravels.altervista.org/web/south-africa/pretoria/hotels/672389-montpellier-guest-house.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'montpellier-guest-house-waterkloof-ridge'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-way-recovery-waterkloof-ridge', 'The Way Recovery',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-ridge'),
  '442 Koedoesnek Avenue, Waterkloof Ridge, Pretoria, 0181', '012 030 0323', 'https://thewayrecovery.co.za', NULL,
  'The Way Recovery is an addiction treatment centre offering medical detox, 28-day residential programmes and outpatient follow-up using the Matrix Program, with on-site accommodation, gardens and a pool, in Waterkloof Ridge, Pretoria.',
  NULL, NULL,
  '["https://recovery.com/the-way-recovery-south-africa/", "https://www.news24.com/news24/partnercontent/the-way-recovery-a-beacon-of-hope-in-addiction-treatment-20250228"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-way-recovery-waterkloof-ridge'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
