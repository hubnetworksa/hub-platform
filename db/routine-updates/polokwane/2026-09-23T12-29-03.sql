INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tpm-attorneys-inc-polokwane-central', 'TPM Attorneys Inc',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Thabakgolo Building, 3rd Floor, 58-60 Landdros Mare Street, Polokwane Central, Polokwane, 0700',
  '060 222 8742', NULL, NULL,
  'TPM Attorneys Inc is a law firm in the Polokwane CBD providing corporate, cyber-law, civil litigation and family-law services.',
  NULL, NULL,
  '["https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=2269", "https://tpmattorneys.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tpm-attorneys-inc-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cure-o-pharm-polokwane-central', 'Cure-O-Pharm',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '42 Thabo Mbeki Street, Polokwane Central, Polokwane, 0699',
  '015 291 1860', NULL, NULL,
  'Cure-O-Pharm is a community pharmacy in the Polokwane CBD operating under The Local Choice pharmacy group.',
  NULL, NULL,
  '["https://thelocalchoice.co.za/cure-o-pharm/", "https://nationalbusinesspages.co.za/business-directory/10074/cure-o-pharm/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cure-o-pharm-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
