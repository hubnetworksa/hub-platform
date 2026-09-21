-- S Hansen & Associates (Polokwane Central). Web research found this firm
-- listed under a conflicting address (33 Plein Street) and a conflicting
-- second phone number (015 295 4006, which appears elsewhere attributed
-- to an unrelated dentist) across directory sites -- address and phone
-- published here are the owner's direct correction (150 Marshall Street;
-- 015 295 5292, which matched 2 of 3 web sources), overriding the
-- conflicting web listings. Added to both Accountants and Tax
-- Practitioners per owner instruction, though independent confirmation
-- of the tax-practice service line specifically was weak online.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  's-hansen-associates-polokwane-central', 'S Hansen & Associates',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '150 Marshall Street, Polokwane, 0700', '015 295 5292', NULL, NULL,
  'S Hansen & Associates is a small accounting and tax practice in Polokwane.',
  NULL, NULL,
  '["https://accounting.cubit.co.za/", "https://www.nationalbusinesspages.co.za/"]',
  'published', 'owner_provided'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 's-hansen-associates-polokwane-central'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 's-hansen-associates-polokwane-central'), (SELECT id FROM categories WHERE slug = 'tax-practitioners'), 0);
