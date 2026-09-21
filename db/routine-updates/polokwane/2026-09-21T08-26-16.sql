-- Job 1/2: new businesses discovered in Polokwane Central suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mary-jane-mphahlele-attorneys-inc-polokwane-central', 'Mary-Jane Mphahlele Attorneys Inc',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '3rd Floor, Thabakgolo Building, 60 Landdros Mare Street, Polokwane Central, Polokwane, 0699',
  '015 023 0013', NULL, NULL,
  'Mary-Jane Mphahlele Attorneys Inc is a law firm in Polokwane Central offering services including deceased estate administration, insolvency, dispute resolution and litigation, divorce and family law, commercial law, debt collection and personal injury claims.',
  NULL, NULL,
  '["https://www.facebook.com/p/Mary-Jane-Mphahlele-Attorneys-100088186725987/", "https://www.mjmattorneys.co.za/about/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mary-jane-mphahlele-attorneys-inc-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-m-b-seopa-dental-and-medical-aesthetics-polokwane-central', 'Dr. M.B. Seopa Dental and Medical Aesthetics',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '41A Grobler Street, Suite B, Redimed Building, Polokwane Central, Polokwane, 0699',
  '015 590 9906', NULL, NULL,
  'A dental practice in Polokwane Central offering basic, cosmetic and specialised dentistry alongside medical aesthetics treatments.',
  NULL, NULL,
  '["https://www.facebook.com/drmbseopa/", "https://seopadental.co.za/about-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-m-b-seopa-dental-and-medical-aesthetics-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thomas-grobler-attorneys-polokwane-central', 'Thomas Grobler Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '14 Landdros Mare Street, Polokwane Central, Polokwane, 0700',
  '015 295 6046', NULL, NULL,
  'Thomas Grobler Attorneys is a long-established Polokwane Central law firm, in practice for more than 25 years, providing litigation, conveyancing and estate planning services.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2625167_2", "https://www.thinklocal.co.za/biz/thomas-grobler-attorneys-polokwane", "https://www.brabys.com/za/limpopo/polokwane/attorneys/thomas-grobler-attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thomas-grobler-attorneys-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
