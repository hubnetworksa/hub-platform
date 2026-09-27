INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pietersburg-funeral-supplies-polokwane-central', 'Pietersburg Funeral Supplies',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '104 General Joubert Street, Polokwane Central, Polokwane, 0700', '015 297 0625', NULL, NULL,
  'Pietersburg Funeral Supplies is a funeral parlour and undertaker on General Joubert Street in Polokwane Central, offering funeral arrangements and directing services.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/pietersburg-funeral-supplies-polokwane", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/pietersburg-funeral-supplies"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pietersburg-funeral-supplies-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'funeral-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jr-electrical-polokwane-central', 'JR Electrical',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '68 Jorissen Street, Polokwane Central, Polokwane, 0700', '+27 64 757 9437', 'https://jrelectrical.com', NULL,
  'JR Electrical is an electrical contractor on Jorissen Street in Polokwane Central, offering residential and commercial electrical installation and repair services.',
  NULL, NULL,
  '["https://www.facebook.com/jrelectrical.stazaworx/", "https://jrelectrical.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jr-electrical-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'electricians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mamashela-funeral-directors-tombstone-polokwane-central', 'Mamashela Funeral Directors & Tombstone',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '94 Market Street, Polokwane Central, Polokwane, 0700', '015 297 7727', NULL, NULL,
  'Mamashela Funeral Directors & Tombstone is a funeral parlour on Market Street in Polokwane Central, offering funeral directing and tombstone services.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/mamashela-funerals/254779", "https://www.brabys.com/za/limpopo/polokwane/undertakers-funeral-directors/mamashela-funeral-directors-tombstone"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mamashela-funeral-directors-tombstone-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'funeral-services'),
  1
);
