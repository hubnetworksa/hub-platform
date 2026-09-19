-- Populate Painters & Decorators (was empty). Only 2 of 3 candidates
-- cleared the bar -- a third (Black Apple Design) was discarded: its two
-- sources gave two different phone numbers (015 295 5191 vs 015 295 9151),
-- a genuine conflict, not just formatting. Depends on migration 0038
-- (roodepoort-polokwane suburb), applied earlier in the same deploy.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'madithapa-sandblasting-painting-roodepoort-polokwane', 'Madithapa Sandblasting & Painting',
  (SELECT id FROM suburbs WHERE slug = 'roodepoort-polokwane'),
  'Plot 12, Roodepoort, Polokwane, 0699', '015 293 0724', 'https://madithapa.co.za', NULL,
  'Madithapa Sandblasting & Painting is a family-owned painting and sandblasting contractor doing interior/exterior painting, staining and sandblasting for residential, commercial and government contracts.',
  NULL, NULL,
  '["http://www.madithapa.co.za/contact.htm", "https://www.thinklocal.co.za/biz/madithapa-sandblasting-painting-polokwane", "https://www.yellosa.co.za/company/392168/madithapa-sandblastingpainting"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'madithapa-sandblasting-painting-roodepoort-polokwane'), (SELECT id FROM categories WHERE slug = 'painters-decorators'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'meason-construction-maintenance-polokwane-central', 'Meason Construction & Maintenance',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '68A Hoog Street, Polokwane, 0700', '015 291 1493', 'https://meason.co.za', NULL,
  'Meason Construction & Maintenance is a general building and maintenance firm with a dedicated interior and exterior house/building painting service, alongside waterproofing, plumbing, roofing and carpentry.',
  NULL, NULL,
  '["https://www.yoys.co.za/phone,27-152911493,construction-and-maintenance-office,Polokwane,ZA384530.html", "https://polokwane.infoisinfo.co.za/card/meason-construction-maintenance/362246", "https://meason.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'meason-construction-maintenance-polokwane-central'), (SELECT id FROM categories WHERE slug = 'painters-decorators'), 1);
