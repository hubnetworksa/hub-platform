INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-brooklyn-mall-pharm-muckleneuk', 'Clicks Brooklyn Mall Pharm',
  (SELECT id FROM suburbs WHERE slug = 'muckleneuk'),
  (SELECT id FROM shopping_centers WHERE slug = 'brooklyn-mall'),
  'Brooklyn Mall, Cnr Veale & Fehrsen St, Nieuw Muckleneuk, Pretoria, 0181', '012 460 4704', NULL, NULL,
  'Clicks Brooklyn Mall Pharm is a pharmacy and clinic inside Brooklyn Mall, open Monday to Friday 09:00-19:00 and Saturday and Sunday 09:00-17:00.',
  NULL, NULL,
  '["https://clicks.co.za/store/Brooklyn-Mall-Pharm/384", "https://www.inyourpocket.com/southafrica/johannesburg/venues/brooklyn-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-brooklyn-mall-pharm-muckleneuk'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noviskin-muckleneuk', 'Noviskin',
  (SELECT id FROM suburbs WHERE slug = 'muckleneuk'),
  '199 Bronkhorst St (cnr Tram St), Nieuw Muckleneuk, Pretoria, 0181', '012 460 4646', NULL, NULL,
  'Noviskin is a medical aesthetics clinic offering dermatologist consultations, acne treatment, acne scar treatment and chemical peels, at the corner of Bronkhorst and Tram Streets in Nieuw Muckleneuk.',
  NULL, NULL,
  '["https://whatclinic.com/dermatology/south-africa/pretoria", "https://www.fresha.com/lp/da/bt/æstetik/za-pretoria/bailey`s-muckleneuk"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noviskin-muckleneuk'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
