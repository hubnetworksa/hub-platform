INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'amm-accountants-polokwane-central', 'AMM Accountants',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Office 316-17, Dadahouse Building, 19 Grobler Street, Polokwane, 0699', '015 291 1913', 'https://www.ammaccountant.co.za', NULL,
  'AMM Accountants is an accounting and tax advisory firm operating from the Dadahouse Building in the Polokwane CBD.',
  NULL, NULL,
  '["https://www.ammaccountant.co.za/contact-us/", "https://www.facebook.com/ammccountants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'amm-accountants-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);
