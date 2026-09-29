INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greek-fisherman-sea-point', 'The Greek Fisherman',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '78 Regent Road, Sea Point, Cape Town, 8005', '021 418 5411', NULL, NULL,
  'The Greek Fisherman is a Greek seafood restaurant on Regent Road, in Sea Point.',
  NULL, NULL,
  '["https://www.facebook.com/GreekFishermanSA/videos/-78-regent-rd-sea-point%EF%B8%8F-021-418-5411-infogreekfishermancoza-thegreekfisherman-g/987786610065040/", "https://za.africabz.com/western-cape/greek-fisherman-19617"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'greek-fisherman-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jarryds-sea-point', 'Jarryds',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '90 Regent Road, Sea Point, Cape Town, 8005', '060 748 0145', NULL, NULL,
  'Jarryds is an all-day breakfast and brunch cafe on Regent Road, in Sea Point.',
  NULL, NULL,
  '["https://www.instagram.com/jarryds_eatery/reel/C9y92ixKLzO/", "https://www.corner.inc/place/67708"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jarryds-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
