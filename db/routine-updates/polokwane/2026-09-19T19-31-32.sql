INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'royal-baeng-private-residence-dalmada', 'Royal Baeng Private Residence',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  '88 Second Street, Dalmada, Polokwane, 0699', '065 198 0820', NULL, NULL,
  'Royal Baeng Private Residence is a guest accommodation property in Dalmada, offering rooms with a garden, terrace and restaurant on site.',
  NULL, NULL,
  '["https://royal-baeng-private-residence.business.site/", "https://www.hotelsnearme.co.za/hotels/dalmada-ah/royal-baeng-private-residence.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royal-baeng-private-residence-dalmada'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
