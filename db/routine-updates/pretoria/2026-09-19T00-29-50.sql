INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'acudeo-college-kirkney-kirkney', 'ACUDEO College Kirkney',
  (SELECT id FROM suburbs WHERE slug = 'kirkney'),
  '3264 Simonsberg Avenue, Kirkney, Pretoria, 0182', '012 941 9681', 'https://www.acudeo.co.za/kirkney-pretoria-affordable-school.html', NULL,
  'ACUDEO College Kirkney is an independent private school campus in Kirkney, Pretoria, offering affordable foundation and pre-primary phase education.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/acudeo-college-kirkney-simonsberg-ave-3264-kirkney,-pretoria", "https://www.acudeo.co.za/contactus.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'acudeo-college-kirkney-kirkney'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-cash-carry-pretoria-west-kirkney', 'Shoprite Cash & Carry Pretoria West',
  (SELECT id FROM suburbs WHERE slug = 'kirkney'),
  '1599 Van Der Hoff Rd (R514), Kirkney, Pretoria', '010 813 1421', NULL, NULL,
  'Shoprite Cash & Carry Pretoria West is a wholesale cash-and-carry grocery store on Van Der Hoff Road in Kirkney, Pretoria.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/shoprite-cash-and-carry-pretoria-west-van-der-hoff-rd-(r514)-1599-kirkney,-pretoria", "https://www.africabizinfo.com/ZA/shoprite-pretoria-west-cash-and-carry-010-813-1421"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-cash-carry-pretoria-west-kirkney'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
