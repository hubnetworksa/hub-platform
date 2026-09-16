-- Rubbish & Rubble Removal: Skip Boyz (owner-provided lead, 2026-09-16).
-- Phone and address supplied directly by the site owner (from the
-- business's Facebook page, which isn't readable by automated fetch).
-- Address corroborated independently against this repo's own data: 8
-- other businesses already published on Corundum Street all resolve to
-- the Futura suburb, including one at the exact same street number (55,
-- CW Towing Service) -- strong confidence this is a real, correctly-
-- suburbed address even without a second public web source for it.
--
-- Extensive web research for this category otherwise came up empty per
-- the owner's instruction not to use polokwane.info: most local
-- rubble/skip operators are mobile-only with no public address, and OT
-- Rubble Removal was discarded after three searches returned three
-- different addresses and inconsistent phone numbers -- too unreliable
-- to trust.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'skip-boyz-futura', 'Skip Boyz',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '55 Corundum Street, Futura, Polokwane', '071 410 6611', NULL, NULL,
  'Skip Boyz offers skip hire and rubble removal services from Futura, Polokwane.',
  NULL, NULL,
  '["https://www.facebook.com/SkipBoyzpolokwane/", "owner-provided-contact-details"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'skip-boyz-futura'),
  (SELECT id FROM categories WHERE slug = 'rubbish-rubble-removal'),
  1
);
