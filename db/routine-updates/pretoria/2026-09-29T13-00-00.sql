INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-bushbaby-inn-lydiana', 'The Bushbaby Inn',
  (SELECT id FROM suburbs WHERE slug = 'lydiana'),
  '11 Suikerbos Drive, Lydiana, Pretoria, 0184', '012 804 9239', 'https://www.thebushbabyinn.co.za', 'info@thebushbabyinn.co.za',
  'The Bushbaby Inn is a 10-room guest house in Lydiana with air-conditioned rooms, private bathrooms and free WiFi, set in an indigenous garden with an outdoor pool, braai area and secure parking, close to the National Botanical Gardens.',
  NULL,
  NULL, NULL,
  '["https://www.thebushbabyinn.co.za/", "https://www.tripadvisor.com/Hotel_Review-g312583-d2064526-Reviews-The_Bushbaby_Inn-Pretoria_Gauteng.html", "https://www.ccbc.co.za/business-directory-2/accommodation/the-bushbaby-inn"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-bushbaby-inn-lydiana'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'agribonus-lydiana', 'AgriBonus',
  (SELECT id FROM suburbs WHERE slug = 'lydiana'),
  '25 Suikerbos Drive, Lydiana, Pretoria, 0184', '012 843 5660', 'https://www.agribonus.co.za', 'info@agribonus.co.za',
  'AgriBonus is a farmer loyalty rewards programme based in Lydiana, active since 1998, letting members earn points on purchases from partner agricultural brands that can be redeemed for electronics, appliances, holidays or charitable donations.',
  'Mon-Thu 08:00-16:00, Fri 08:00-15:00',
  NULL, NULL,
  '["https://www.agribonus.co.za/contact-us/", "https://www.facebook.com/AgriBonus/", "https://za.linkedin.com/company/agribonus"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'agribonus-lydiana'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);
