INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bpd-advertising-louwlardia', 'BPD Advertising',
  (SELECT id FROM suburbs WHERE slug = 'louwlardia'),
  '7 Bavaria Road, Louwlardia, Centurion, 0157', '012 667 6833', 'https://bpdadvertising.co.za', 'info@bpdadvertising.co.za',
  'BPD Advertising is a Google Premier Partner and Facebook Marketing Partner offering digital marketing, paid and organic social media, and brand advertising campaigns from Bavaria Road, in Louwlardia, Centurion.',
  NULL, NULL,
  '["https://bpdadvertising.co.za/contact-us/", "https://www.madvix.com/ZA/Centurion/181620621859325/BPD-Advertising", "https://www.facebook.com/BPDAdvertisingAgency/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bpd-advertising-louwlardia'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);
