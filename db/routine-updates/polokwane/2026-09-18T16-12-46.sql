-- Second parallel-agent research round (10 agents: 4 Polokwane, 6 Cape
-- Town). This file covers Polokwane's new businesses plus job-3-style
-- existing-tenant links discovered during shopping-centre sweeps. Every
-- entry verified against 2+ independent sources with mandatory
-- phone+address, per this session's established bar. No description
-- rewrites (job 4) were performed -- out of scope for this round by
-- explicit owner instruction.

-- polokwane-central: CBD attorneys (Thabo Mbeki St / Joubert St / Biccard
-- St / Hans van Rensburg St cluster)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'horak-de-bruin-oberholzer-inc-polokwane-central', 'Horak De Bruin Oberholzer Inc',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '27 Joubert Street, Polokwane Central, 0699', '015 291 2147', NULL, NULL,
  'Horak De Bruin Oberholzer Inc is a law firm operating from Joubert Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/horak%20de%20bruin"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'horak-de-bruin-oberholzer-inc-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mashingo-mokgetheng-polokwane-central', 'Mashingo Mokgetheng',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '52 Kerk Street, Polokwane Central, 0699', '015 291 2843', NULL, NULL,
  'Mashingo Mokgetheng is a law firm operating from Kerk Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/mashingo%20mokgetheng"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mashingo-mokgetheng-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mphahlele-ma-attorneys-polokwane-central', 'Mphahlele MA Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Office 10, A L Smit Building, 26 Thabo Mbeki Street, Polokwane Central, 0699', '076 954 5694', NULL, NULL,
  'Mphahlele MA Attorneys is a law firm operating from the A L Smit Building on Thabo Mbeki Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/mphahlele%20ma%20attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mphahlele-ma-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jacky-mogashoa-attorneys-polokwane-central', 'Jacky Mogashoa Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '18A Landdros Mare Street, Polokwane Central, 0699', '015 291 5971', NULL, NULL,
  'Jacky Mogashoa Attorneys is a law firm operating from Landdros Mare Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/jacky%20mogashoa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jacky-mogashoa-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'uys-pg-attorney-polokwane-central', 'Uys PG Attorney',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '33A Joubert Street, Polokwane Central, 0699', '015 291 3770', NULL, NULL,
  'Uys PG Attorney is a law firm operating from Joubert Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/uys%20pg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'uys-pg-attorney-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'frank-phahlane-attorneys-polokwane-central', 'Frank Phahlane Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '20 Thabo Mbeki Street, Polokwane Central, 0699', '015 291 1356', NULL, NULL,
  'Frank Phahlane Attorneys is a law firm operating from Thabo Mbeki Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/frank%20phahlane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'frank-phahlane-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mamabolo-attorneys-polokwane-central', 'Mamabolo Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '40 Biccard Street, Polokwane Central, 0699', '015 291 5011', NULL, NULL,
  'Mamabolo Attorneys is a law firm operating from Biccard Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/mamabolo%20attorneys"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mamabolo-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maloka-thulare-attorneys-polokwane-central', 'Maloka Thulare Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '31 Hans van Rensburg Street, Polokwane Central, 0699', '015 291 2950', NULL, NULL,
  'Maloka Thulare Attorneys is a law firm operating from Hans van Rensburg Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/maloka%20thulare"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'maloka-thulare-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rheeder-attorneys-polokwane-central', 'Rheeder Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '56A Hoog Street, Polokwane Central, 0700', '015 291 1646', NULL, NULL,
  'Rheeder Attorneys is a law firm operating from Hoog Street in Polokwane Central.',
  NULL, NULL,
  '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/rheeder"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rheeder-attorneys-polokwane-central'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

-- bendor

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-engen-bendor-bendor', 'Steers Engen Bendor',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  'Cnr Veldspaat and Munnik Streets, Bendor, Polokwane, 0699', '015 296 0151', NULL, NULL,
  'Steers Engen Bendor is a quick-service restaurant trading from the Engen forecourt on the corner of Veldspaat and Munnik Streets in Bendor.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/bendor-park/steers-cnr-veldspaat-and-munnik-streets-polokwane/36081", "https://www.tripadvisor.com/Restaurant_Review-g312624-d19056194-Reviews-Steers-Polokwane_Limpopo_Province.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'steers-engen-bendor-bendor'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'applebox-accounting-bendor', 'Applebox Accounting',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '12 Dr Moolman Drive, Bendor, Polokwane, 0699', '015 297 0915', NULL, NULL,
  'Applebox Accounting is an accounting firm operating from Dr Moolman Drive in Bendor.',
  NULL, NULL,
  '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/applebox"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'applebox-accounting-bendor'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fanus-de-beer-ingelyf-bendor', 'Fanus de Beer Ingelyf',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '2A Pro Park, 29 Bendor Drive, Bendor, Polokwane, 0699', '086 160 4030', NULL, NULL,
  'Fanus de Beer Ingelyf is an accounting firm operating from the Pro Park office building on Bendor Drive.',
  NULL, NULL,
  '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/fanus%20de%20beer"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'fanus-de-beer-ingelyf-bendor'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'larciano-rekenmeesters-bendor', 'Larciano Rekenmeesters',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '29 Bendor Avenue, Polokwane, 0699', '015 297 5180', NULL, NULL,
  'Larciano Rekenmeesters is an accounting firm operating from Bendor Avenue.',
  NULL, NULL,
  '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/larciano"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'larciano-rekenmeesters-bendor'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);

-- bendor-park

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'franco-marx-attorneys-bendor-park', 'Franco Marx Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '141 Hillary Drive, Bendor Ext 60, Polokwane, 0699', '087 237 7848', NULL, NULL,
  'Franco Marx Attorneys is a law firm operating from Hillary Drive in Bendor Park.',
  NULL, NULL,
  '["https://www.brabys.com/", "https://www.snupit.co.za/polokwane/bendor/franco-marx-attorney/418309"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'franco-marx-attorneys-bendor-park'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

-- fauna-park

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ramusi-attorneys-fauna-park', 'Ramusi Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '19D Thabo Mbeki Street, Fauna Park, Polokwane, 0700', '015 291 3240', NULL, NULL,
  'Ramusi Attorneys is a law firm operating from Thabo Mbeki Street in Fauna Park.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/17271356_2", "https://www.opendi.co.za/polokwane/149013.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ramusi-attorneys-fauna-park'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'isaiah-nyathi-attorneys-incorporated-fauna-park', 'Isaiah Nyathi Attorneys Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '103 Thabo Mbeki Street, Fauna Park, Polokwane, 0699', '015 296 3170', NULL, NULL,
  'Isaiah Nyathi Attorneys Incorporated is a law firm operating from Thabo Mbeki Street in Fauna Park.',
  NULL, NULL,
  '["https://www.directory101.co.za/legaldir/index.php?page=item&id=1877", "https://www.thinklocal.co.za/biz/isaiah-nyathi-attorneys-incorporated-pietersburg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'isaiah-nyathi-attorneys-incorporated-fauna-park'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'deep-blue-accountants-fauna-park', 'Deep Blue Accountants',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '28 Gazelle Street, Fauna Park, Polokwane, 0699', '082 368 9471', NULL, NULL,
  'Deep Blue Accountants is an accounting firm operating from Gazelle Street in Fauna Park.',
  NULL, NULL,
  '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/deep%20blue%20accountants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'deep-blue-accountants-fauna-park'), (SELECT id FROM categories WHERE slug = 'accountants'), 1);

-- sterpark

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jungle-buddies-preschool-sterpark', 'Jungle Buddies Preschool',
  (SELECT id FROM suburbs WHERE slug = 'sterpark'),
  '40 Juno Ave, Sterpark, Polokwane, 0699', '015 590 7411', NULL, NULL,
  'Jungle Buddies Preschool is an early-learning and preschool facility in Sterpark.',
  NULL, NULL,
  '["https://findapreschool.co.za/preschools/limpopo/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'jungle-buddies-preschool-sterpark'), (SELECT id FROM categories WHERE slug = 'schools-education'), 1);

-- Job-3-style existing-tenant links found during this round's shopping
-- centre sweeps: each business's own address literally names the centre
-- and/or shares the exact building/shop-number as an already-linked
-- tenant, confirmed against status/polokwane/db-snapshot.json.

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'checkers-centre-polokwane-central')
WHERE slug = 'spec-savers-polokwane-cbd-polokwane-central';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'ivy-park-centre-ivy-park')
WHERE slug = 'iv-med-pharmacy-ivy-park';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'ivy-park-centre-ivy-park')
WHERE slug = 'polokwane-north-dental-clinic-ivy-park';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'ivy-park-centre-ivy-park')
WHERE slug = 'food-zone-ivy-park-ivy-park';
