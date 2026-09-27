INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'forty-4-on-hoog-capricorn', 'Forty 4 on Hoog',
  (SELECT id FROM suburbs WHERE slug = 'capricorn'),
  '44 Hoog Street, Capricorn, Polokwane, 0699', '072 454 7353', 'https://forty4onhoog.co.za', NULL,
  'Forty 4 on Hoog is a recently renovated 4-star guest house on Hoog Street in Capricorn, Polokwane, offering luxury accommodation with a swimming pool, garden and full-day security.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/forty-4-on-hoog-luxury-accommodation", "https://www.makemytrip.com/hotels-international/en-us/south_africa/capricorn-hotels/forty_4_on_hoog-details.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'forty-4-on-hoog-capricorn'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
