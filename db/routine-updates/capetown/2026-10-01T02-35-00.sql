INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jackies-on-5th-lotus-river', "Jackie's On 5th",
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  '327 5th Avenue, Lotus River, 7805', '063 696 1937', NULL, NULL,
  "Jackie's On 5th is a hair and beauty salon in Lotus River offering hair, nails, lashes and beauty treatments.",
  NULL, NULL,
  '["https://www.fresha.com/lvp/jackies-on-5th-5th-avenue-cape-town-QvRMVW", "https://www.facebook.com/p/Jackies-On-5th-100041606834058/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jackies-on-5th-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'miss-jzs-hair-and-beauty-bar-lotus-river', "Miss J'z Hair and Beauty Bar",
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  '5th Avenue, Lotus River', '067 262 2170', NULL, NULL,
  "Miss J'z Hair and Beauty Bar is a hair and beauty salon in Lotus River offering hairstyling, face waxing and eyebrow and eyelash treatments.",
  NULL, NULL,
  '["https://www.fresha.com/a/miss-jz-hair-and-beauty-bar-cape-town-5th-avenue-skxr5lrm", "https://www.facebook.com/people/Miss-Jz-Hair-And-Beauty-Bar/61558231372080/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'miss-jzs-hair-and-beauty-bar-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
