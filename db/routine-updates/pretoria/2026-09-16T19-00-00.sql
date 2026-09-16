INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'juniper-green-health-grootfontein-country-estate', 'Juniper Green Health',
  (SELECT id FROM suburbs WHERE slug = 'grootfontein-country-estate'),
  '233 Mark Street, Grootfontein Country Estate, Pretoria East, 0156', '082 051 1213', 'https://junipergreen.co.za', NULL,
  'Juniper Green Health is a natural health sanctuary in Grootfontein Country Estate offering alternative and holistic treatments including Electro Resonance Therapy, acupressure massage and herbalism.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Juniper-Green-Health-Sanctuary-118886515178170/", "https://sahealthguide.co.za/juniper-green-health"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'juniper-green-health-grootfontein-country-estate'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
