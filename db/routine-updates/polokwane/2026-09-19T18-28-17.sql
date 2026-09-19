-- Populate Agricultural & Farming Supplies (was empty). 9 businesses, each
-- verified against 2+ independent, different-domain sources with mandatory
-- phone+address. Depends on migration 0037 (industria/laboria/magna-via
-- suburbs), applied earlier in the same deploy.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ntk-limpopo-agric-polokwane-industria', 'NTK Limpopo Agric Polokwane (VKB Group)',
  (SELECT id FROM suburbs WHERE slug = 'industria'),
  '27 Industria St, Polokwane Ext 3, Polokwane, 0699', '015 297 3671', 'https://www.vkb.co.za', NULL,
  'NTK Limpopo Agric is an agricultural co-operative and wholesaler supplying seed, fertiliser, agri-chemicals, animal feed and irrigation supplies to farmers; part of the VKB Group.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/ntk-limpopo-agric-polokwane-174584", "https://sabusinesslistings.co.za/listings/ntk-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ntk-limpopo-agric-polokwane-industria'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-feeds-industria', 'Polokwane Feeds',
  (SELECT id FROM suburbs WHERE slug = 'industria'),
  '22 Industria St, Industria, Polokwane, 0699', '061 535 0830', 'https://polokwanefeeds.co.za', NULL,
  'Polokwane Feeds is a retailer of livestock, poultry and pet feed, supplements and general farm supplies for commercial and small-scale farmers.',
  NULL, NULL,
  '["https://polokwanefeeds.co.za/contact-us/", "https://www.goafricaonline.com/za/1340877-polokwane-feeds"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'polokwane-feeds-industria'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alzu-feeds-polokwane-industria', 'Alzu Feeds Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'industria'),
  '20 Industria St, Polokwane Ext 2, Polokwane, 0699', '015 297 5005', 'https://alzufeeds.co.za', NULL,
  'Alzu Feeds is an animal feed store stocking feed for poultry, cattle, sheep, goats, pigs, horses and rabbits, plus related husbandry supplies.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/alzu-feeds-polokwane-174490", "https://www.yellowpages.net/phone_27-152975005_animal-feed-store_Polokwane_ZA100745.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'alzu-feeds-polokwane-industria'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'angel-feeds-polokwane-industria', 'Angel Feeds Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'industria'),
  '41A 19th St, Industria, Polokwane, 0699', '015 297 1072', 'https://angelfeeds.co.za', NULL,
  'Angel Feeds is a poultry-focused agricultural supplier offering feed and poultry equipment for farmers, with several branches across Limpopo.',
  NULL, NULL,
  '["https://za.africabz.com/limpopo/angel-feeds-polokwane-228185", "https://iinfo.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'angel-feeds-polokwane-industria'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sizabantu-piping-systems-limpopo-division-laboria', 'Sizabantu Piping Systems - Limpopo Division',
  (SELECT id FROM suburbs WHERE slug = 'laboria'),
  '13 Tin Street, Laboria, Polokwane', '015 293 1527', 'https://sizabantu.com', NULL,
  'Sizabantu Piping Systems manufactures and distributes plastic piping and drainage solutions, including irrigation piping for agriculture, from its Limpopo division.',
  NULL, NULL,
  '["https://sizabantu.com/divisions/limpopo-division/", "https://truedondirectory.co.za/business-directory-2/3336/sizabantu-piping-systems-provincial-listing/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sizabantu-piping-systems-limpopo-division-laboria'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tts-polokwane-magna-via', 'TTS Polokwane (Massey Ferguson dealer)',
  (SELECT id FROM suburbs WHERE slug = 'magna-via'),
  '9 Marmer St, Magna-Via, Polokwane, 0699', '015 298 8256', 'https://www.ttsmasseypolokwane.co.za', NULL,
  'TTS Polokwane is a Massey Ferguson tractor and farm implement dealership, offering tractors, implements, genuine AGCO parts and service.',
  NULL, NULL,
  '["https://www.ttsmasseypolokwane.co.za/", "https://www.yellosa.co.za/company/977323/tts-plant-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tts-polokwane-magna-via'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'new-holland-limpopo-polokwane-magna-via', 'New Holland Limpopo (Polokwane branch)',
  (SELECT id FROM suburbs WHERE slug = 'magna-via'),
  'Danielle Close, Corporate Park 2, Magna Via, Polokwane Ext 12, Polokwane, 0699', '015 045 0320', 'https://nhlimpopo.co.za', NULL,
  'New Holland Limpopo is a new and used agricultural tractor and machinery dealership, also offering parts and service.',
  NULL, NULL,
  '["https://nhlimpopo.co.za/contact/", "https://www.cylex.net.za/company/new-holland-limpopo--polokwane-23866645.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'new-holland-limpopo-polokwane-magna-via'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tony-turner-agencies-ladine', 'Tony Turner Agencies',
  (SELECT id FROM suburbs WHERE slug = 'ladine'),
  '19 Natrium Str, Ladine, Polokwane, 0700', '015 293 1414', 'https://ttagencies.co.za', NULL,
  'Tony Turner Agencies is a family-run distributor of irrigation equipment, pumps, piping, fittings and hoses for agriculture and construction, trading since 1994.',
  NULL, NULL,
  '["https://ttagencies.co.za/contact-us/", "https://www.cylex.net.za/company/tony-turner-agencies-17580856.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tony-turner-agencies-ladine'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'snyman-voere-ladine', 'Snyman Voere',
  (SELECT id FROM suburbs WHERE slug = 'ladine'),
  '37 Staal St, Ladine, Polokwane', '015 293 0886', NULL, NULL,
  'Snyman Voere is an animal feed store selling poultry, cattle, sheep, horse and game feed, medication and husbandry accessories, established in 1985.',
  NULL, NULL,
  '["https://nearfinderza.com/business/limpopo/polokwane/snyman-voere_86540+9.html", "https://www.thinklocal.co.za/biz/snyman-voere-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'snyman-voere-ladine'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);
