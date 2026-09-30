INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'casa-flora-guest-house-silverlakes', 'Casa Flora Guest House',
  (SELECT id FROM suburbs WHERE slug = 'silverlakes'),
  '12A Castle Pine St, Silver Lakes, Pretoria, 0081', '083 267 0695', 'https://casaflora.co.za', 'info@casaflora.co.za',
  'Casa Flora is a self-catering guest house inside the gated Silver Lakes Golf Estate in Pretoria East, offering five en-suite rooms, a pool and entertainment area, and a conference room for up to 15 delegates, aimed at business and leisure travellers.',
  NULL, NULL,
  '["https://casaflora.co.za", "https://www.lekkeslaap.co.za/akkommodasie/casa-flora"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'casa-flora-guest-house-silverlakes'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-links-corporate-guest-house-silverlakes', 'The Links Corporate Guest House',
  (SELECT id FROM suburbs WHERE slug = 'silverlakes'),
  '147 Gleneagles Dr, Silver Lakes, Pretoria, 0081', '083 431 3455', 'https://www.the-links.co.za', 'bookings@the-links.co.za',
  'The Links Corporate Guest House is an upmarket accommodation property inside the gated Silver Lakes Golf Estate in Pretoria East, offering rooms with golf-themed decor, an in-house cinema, secure parking and airport transfer services for corporate and international visitors.',
  NULL, NULL,
  '["https://www.the-links.co.za/contact-us", "https://www.successfulmeetings.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/The-Links-Corporate-Guest-House-p53162524"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-links-corporate-guest-house-silverlakes'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
