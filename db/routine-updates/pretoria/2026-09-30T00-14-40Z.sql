INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-monument-park-monument-park', 'Clicks Monument Park',
  (SELECT id FROM suburbs WHERE slug = 'monument-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'monument-park-shopping-centre'),
  'Monument Park Shopping Centre, Skilpad Rd, Monument Park, Pretoria, 0105', '012 346 8193', NULL, NULL,
  'Clicks Monument Park is a pharmacy and health and beauty retailer inside Monument Park Shopping Centre on Skilpad Road. The store trades Monday to Friday from 09:00 to 19:00, Saturday from 08:00 to 17:00, Sunday from 09:00 to 15:00, and 09:00 to 16:00 on public holidays.',
  NULL, NULL,
  '["https://clicks.co.za/store/Monument-Park/526", "https://www.thebusinessdirectory.co.za/listings/clicks-monument-park/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-monument-park-monument-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
