-- Museums & Heritage Sites: 3 verified businesses (owner-requested,
-- 2026-09-16, "double check if using polokwane.info data outdated").
-- polokwane.info wasn't actually the leading source for this category
-- (a general web search of tourism/museum sites was) but the same
-- cross-checking discipline applied throughout: every fact confirmed
-- against 2+ current independent sources before publishing.
--
-- Hugh Exton Photographic Museum was researched but discarded: two
-- sources gave two different phone numbers (290 2182 vs 290 2186) and
-- two different addresses (119 Suid St vs Landros Mare Street) for it,
-- with no third source to break the tie -- too unreliable to trust.
--
-- Bakone Malapa sits ~9km outside town on the R37 toward Chuenespoort,
-- outside every currently seeded suburb -- added as its own new suburb
-- (0035_seed_chuenespoort_suburb.sql) rather than skipped, given how
-- well-corroborated and well-known it is (5+ independent tourism sites
-- agree on its location).

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-irish-house-polokwane-central', 'The Irish House',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Corner Market Street & Thabo Mbeki Street, Polokwane Central, 0700', '015 290 2182', NULL, NULL,
  'The Polokwane Cultural History Museum, housed in a heritage building on the corner of Market and Thabo Mbeki Streets in Polokwane Central.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/limpopo/polokwane-museum/", "https://www.wheretostay.co.za/topic/5342-irish-house-and-polokwane-museum-in-polokwane-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-irish-house-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-art-museum-polokwane-central', 'Polokwane Art Museum',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '70 Schoeman Street, Civic Centre, Polokwane Central, 0700', '015 290 2177', NULL, NULL,
  'An art museum in the Danie Hough Cultural Centre, Library Gardens complex, on Schoeman Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.art.co.za/galleries/polokwane-art-museum", "https://www.wheretostay.co.za/topic/5327-polokwane-art-museum-in-polokwane-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'polokwane-art-museum-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bakone-malapa-open-air-museum-chuenespoort', 'Bakone Malapa Northern Sotho Open-Air Museum',
  (SELECT id FROM suburbs WHERE slug = 'chuenespoort'),
  'R37 Chuenespoort Road, approximately 9km from Polokwane', '015 290 2540', NULL, NULL,
  'A living open-air museum reconstructing a traditional Northern Sotho village, about 9km from Polokwane on the R37 toward Chuenespoort.',
  NULL, NULL,
  '["https://www.sa-venues.com/attractionslm/bakone-malapa.php", "https://triptap.com/places/za/limpopo/polokwane/bakone-malapa-open-air-museum-t06117db"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bakone-malapa-open-air-museum-chuenespoort'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
