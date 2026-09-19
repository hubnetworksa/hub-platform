-- Populate Roofing Contractors (was empty). 6 new businesses verified
-- against 2+ independent, different-domain sources with mandatory
-- phone+address; a 7th candidate (Speco Guttering Services) was dropped
-- for insufficient independent sourcing (only one non-owned source, plus
-- an unverifiable company TikTok post). An 8th candidate (Vonyani Group of
-- Companies) turned out to already exist in the directory under Building
-- & Construction -- adding a secondary category link for it instead of a
-- duplicate row. Depends on migration 0039 (myngenoegen suburb), applied
-- earlier in the same deploy.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'martek-roofing-magna-via', 'MarTek Roofing',
  (SELECT id FROM suburbs WHERE slug = 'magna-via'),
  '30 Kaye-Lyn Street, Magna Via, Polokwane, 0699', '015 298 9018', 'https://www.martekroofing.co.za', NULL,
  'MarTek Roofing is a MiTek-licensed fabricator manufacturing and erecting timber and galvanised steel roof trusses, plus supply of roof cladding and sheeting.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/martek-roofing-polokwane", "https://www.snupit.co.za/polokwane/central/martek-roofing/349682", "https://constructionconnection.co.za/di34329/MarTek-Roofing.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'martek-roofing-magna-via'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'c-d-roof-trusses-myngenoegen', 'C D Roof Trusses',
  (SELECT id FROM suburbs WHERE slug = 'myngenoegen'),
  'Plot 4/No 4, Myngenoegen, Polokwane, 0699', '015 263 6053', NULL, NULL,
  'C D Roof Trusses is a MiTek-affiliated roof truss manufacturer, supplier and installer specialising in all roofing materials.',
  NULL, NULL,
  '["https://www.mitek.co.za/manufacturer/c-d-roof-trusses/", "https://www.ivote.co.za/view/south-africa/cd-roof-trusses-in-polokwane", "http://business-service-directory.com/za/listing/c-d-roof-trusses-2457234"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'c-d-roof-trusses-myngenoegen'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tc-roof-erectors-polokwane-central', 'TC Roof Erectors',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '102 Market Street, Polokwane, 0700', '062 625 0252', NULL, NULL,
  'TC Roof Erectors supplies and fits prefabricated timber roof trusses and roof covering, does waterproofing, and offers roof inspections and certification.',
  NULL, NULL,
  '["https://www.snupit.co.za/polokwane/central/t-c-roof-erectors/532973", "https://polokwane.infoisinfo.co.za/card/tc-roof-erectors/806106"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'tc-roof-erectors-polokwane-central'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'roof-king-waterproofing-specialists-fauna-park', 'Roof King Waterproofing Specialists',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '37 Gazelle Street, Fauna Park, Polokwane, 0699', '015 296 2818', 'https://www.roofking.org', NULL,
  'Roof King Waterproofing Specialists is a long-running roof waterproofing contractor serving corporate and residential clients.',
  NULL, NULL,
  '["https://polokwane.infoisinfo.co.za/card/roof-king-waterproofing-specialists/495294", "https://www.yellosa.co.za/company/684345/roof-king-waterproofing-specialists-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'roof-king-waterproofing-specialists-fauna-park'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rubberproof-tech-polokwane-central', 'Rubberproof Tech',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '228 Marshall Street, Polokwane, 0700', '073 494 0341', NULL, NULL,
  'Rubberproof Tech waterproofs tile and zinc/metal roofs and repairs roof leaks using liquid rubber membrane systems.',
  NULL, NULL,
  '["https://www.entrepo.co.za/business-directory/rubberproof-tech/", "https://www.snupit.co.za/polokwane/polokwane-ext-12/rubberproof-tech/484634"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rubberproof-tech-polokwane-central'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limpopo-seamless-gutters-polokwane-central', 'Limpopo Seamless Gutters',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '117 Thabo Mbeki Street, Polokwane, 0699', '083 359 8197', NULL, NULL,
  'Limpopo Seamless Gutters does onsite seamless gutter fabrication and installation, tied to roof water-management work.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099852573806592/limpopo-seamless-gutters/polokwane/contractor-equipment-and-services", "https://www.adsnational.co.za/listings/view/id/403/Limpopo-Seamless-Gutters-Polokwane-Limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'limpopo-seamless-gutters-polokwane-central'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 1);

-- Secondary category link: Vonyani Group of Companies already exists
-- (slug vonyani-group-of-companies-dalmada) under Building & Construction;
-- its service lines explicitly include roofing/waterproofing.
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'vonyani-group-of-companies-dalmada'), (SELECT id FROM categories WHERE slug = 'roofing-contractors'), 0);
