-- Re-add S Hansen & Associates (Polokwane Central). The original insert
-- (db/routine-updates/polokwane/2026-09-21T12-43-03.sql, applied and
-- cleared in commit 9f00945d) silently failed: it used
-- origin = 'owner_provided', which isn't in the businesses.origin CHECK
-- constraint ('seed_import' | 'agent_research' | 'owner_submitted'), so
-- INSERT OR IGNORE dropped the whole row without erroring -- wrangler
-- reported success and the SQL file got cleared as "applied" even though
-- nothing was written. Confirmed missing on the live site (404 on
-- /business/s-hansen-associates-polokwane-central, absent from
-- /category/accountants) before writing this fix.
--
-- origin is corrected to 'agent_research' here (this is routine-research
-- data, not a self-service owner submission via list-your-business); the
-- 'owner-provided-contact-details' source_urls marker records that the
-- address/phone were the owner's direct correction overriding conflicting
-- web listings (33 Plein Street / 015 295 4006, the latter also attributed
-- elsewhere to an unrelated dentist), per the original research below.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  's-hansen-associates-polokwane-central', 'S Hansen & Associates',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '150 Marshall Street, Polokwane, 0700', '015 295 5292', NULL, NULL,
  'S Hansen & Associates is a small accounting and tax practice in Polokwane.',
  NULL, NULL,
  '["https://accounting.cubit.co.za/", "https://www.nationalbusinesspages.co.za/", "owner-provided-contact-details"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 's-hansen-associates-polokwane-central'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 's-hansen-associates-polokwane-central'), (SELECT id FROM categories WHERE slug = 'tax-practitioners'), 0);
