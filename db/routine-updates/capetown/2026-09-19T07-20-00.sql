-- Jobs 1-2: Rosebank suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hometown-cafe-rosebank', 'Hometown Cafe',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '6 Alma Road, Rosebank, Cape Town', '021 685 0394', NULL, NULL,
  'Hometown Cafe is a small neighbourhood cafe on Alma Road serving tea, scones and light meals in a family-friendly setting, in Rosebank.',
  NULL, NULL,
  '["https://www.instagram.com/hometown.cafe/", "https://www.tripadvisor.com/Restaurant_Review-g2427350-d10787479-Reviews-Hometown_Cafe-Rosebank_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hometown-cafe-rosebank'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
