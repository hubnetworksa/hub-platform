-- Beacon Valley (job 1/2): 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'look-its-me-hair-design-beacon-valley', 'Look Its Me Hair Design',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  '45 Korfbal Street, Beacon Valley, Mitchells Plain, Cape Town, 7785', '081 309 8337', NULL, NULL,
  'Look Its Me Hair Design is a hair salon in Beacon Valley, offering styling, braiding, colouring and other hair services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/look-its-me-hair-design-korfbal-street-cape-town-a2GQbY", "https://magicpin.com/south-africa/Cape-Town/Mitchells-Plain/Beauty/Look-Its-Me-Hair-Design/store/2391501"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'look-its-me-hair-design-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
