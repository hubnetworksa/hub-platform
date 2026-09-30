INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bierman-knoetze-inc-kraaifontein', 'Bierman Knoetze Inc',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Blochs Centre, Van Riebeeck Road, Kraaifontein', '021 988 7487', NULL, 'kraaifontein@biermangroup.co.za',
  'Bierman Knoetze Inc is an optometry practice at Blochs Centre on Van Riebeeck Road in Kraaifontein, part of the Bierman Group network.',
  NULL, NULL,
  '["https://biermangroup.co.za/stores/bierman-optometrists/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=167693"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bierman-knoetze-inc-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-medicross-kraaifontein', 'Spec-Savers Medicross Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Langeberg Medicross, Cnr Brighton & Kipling Road, Kraaifontein, 7570', '021 987 4796', 'https://www.specsavers.co.za/store/medicross-kraaifontein', 'kraaifntn@specstores.co.za',
  'Spec-Savers Medicross Kraaifontein is an optometrist inside the Langeberg Medicross building on the corner of Brighton and Kipling Roads, trading since 1995.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/medicross-kraaifontein", "https://www.tiendeo.co.za/stores/kraaifontein/spec-savers-medicross-kraaifontein-cnr-brighton-kipling-rd-kraaifontein/54641"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-medicross-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'malan-laas-and-scholtz-inc-kraaifontein', 'Malan Laas and Scholtz Inc',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '60 Brighton Road, Zoo Park, Kraaifontein, 7570', '021 988 1144', NULL, 'mls1@absamail.co.za',
  'Malan Laas and Scholtz Inc is a commercial law firm in Zoo Park, Kraaifontein, with expertise in property law, commercial litigation and deceased estates.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/malan-laas-and-scholtz-in-kraaifontein-cape-town", "https://www.brabys.com/za/western-cape/kraaifontein/zoo-park/attorneys/malan-laas-and-scholtz-inc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'malan-laas-and-scholtz-inc-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
