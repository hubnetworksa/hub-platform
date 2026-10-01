INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'the-gentle-dentist-wierdapark', 'The Gentle Dentist',
  (SELECT id FROM suburbs WHERE slug = 'wierdapark'),
  '321 Badenhorst St, Wierdapark, Centurion, 0157', '012 012 5983', NULL, NULL,
  'The Gentle Dentist is a dental practice in Wierdapark, Centurion, offering general, cosmetic and paediatric dentistry, including dental implants, orthodontics, facial aesthetics and early childhood orthodontics.',
  NULL, NULL,
  '["https://leadstal.com/sb/the-gentle-dentist-centurion", "https://discover.bookem.com/business/thegentledentist"]',
  'published', 'agent_research', 'Mon-Fri 08:00-16:30, Sat-Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-gentle-dentist-wierdapark'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'centurion-dental-studio-wierdapark', 'Centurion Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'wierdapark'),
  '285 Wilhelmina St, Wierdapark, Centurion, 0157', '012 653 4200', 'https://centuriondentalstudio.co.za', NULL,
  'Centurion Dental Studio is a dental practice on Wilhelmina Street in Wierdapark, Centurion, providing general and family dental care to the local community.',
  NULL, NULL,
  '["https://centuriondentalstudio.co.za", "https://leadstal.com/sb/centurion-dental-studio"]',
  'published', 'agent_research', 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'centurion-dental-studio-wierdapark'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
