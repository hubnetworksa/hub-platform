INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mosate-lodge-hospark', 'Mosate Lodge',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  'Corner of Grobler & Dorp Street, Hospital Park, Polokwane, 0700', '015 291 1004', 'https://www.mosate.co.za/', NULL,
  'Mosate Lodge is a 4-star luxury guest lodge and conference facility in Hospital Park, offering accommodation and event/meeting space in central Polokwane.',
  NULL, NULL,
  '["https://www.mosate.co.za/contact/", "https://www.booking.com/hotel/za/mosate-lodge.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mosate-lodge-hospark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
