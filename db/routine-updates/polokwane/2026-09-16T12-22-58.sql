-- Churches & Religious Organisations: 3 verified businesses (owner-requested
-- research, 2026-09-16). polokwane.info's old church directory
-- (polokwane.info/churches.htm) was used as a starting-point lead list per
-- owner instruction to cross-check it, not trust it -- every phone/address
-- below is confirmed against 2+ *current* independent sources, not that
-- page. Two of the three caught real discrepancies with it:
--   - Cathedral of the Sacred Heart: polokwane.info gives "295 3119"; the
--     diocese's own site and a Catholic directory both independently
--     confirm "285 3119" instead -- went with the corroborated number.
--   - NG Moedergemeente and the Lutheran Church entries were researched
--     but discarded: multiple distinct congregations share those generic
--     names locally and only one weak/single source could be found for
--     each specific address+phone pairing, not the required two.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'christ-church-cathedral-polokwane-central', 'Christ Church Cathedral',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '82 Biccard Street, Polokwane Central, 0700', '015 297 2667', NULL, NULL,
  'The Anglican cathedral for the Diocese of St Mark the Evangelist, on Biccard Street in Polokwane Central.',
  NULL, NULL,
  '["https://cathedral.org.za/contact/", "https://en.wikipedia.org/wiki/Christ_Church,_Polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'christ-church-cathedral-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cathedral-of-the-sacred-heart-polokwane-central', 'Cathedral of the Sacred Heart',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '54 Biccard Street, Polokwane Central, 0700', '015 285 3119', NULL, NULL,
  'The Roman Catholic cathedral for the Diocese of Polokwane, built in 1906, on Biccard Street in Polokwane Central.',
  NULL, NULL,
  '["https://polokwanediocese.org.za/priests-and-parishes/", "https://gcatholic.org/churches/africa/4018"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cathedral-of-the-sacred-heart-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wesley-methodist-church-polokwane-central', 'Wesley Methodist Church',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '74 Biccard Street, Polokwane Central, 0700', '015 297 0476', NULL, NULL,
  'A Methodist church on Biccard Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.gospelplaces.com/limpopo/polokwane/wesley-methodist-church", "https://www.facebook.com/polokwanemeth/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wesley-methodist-church-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'churches-religious-organisations'),
  1
);
