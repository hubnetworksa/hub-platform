INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vodacom-shop-schoeman-street-polokwane-central', 'Vodacom Shop Polokwane Schoeman Street',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Shop 14, Rentmeester Building, 58c Schoeman St, Polokwane Central, 0700', '015 291 1982', NULL, NULL,
  'Vodacom Shop Polokwane Schoeman Street is a mobile phone and accessories retailer operating as a Vodacom-branded store in the Rentmeester Building on Schoeman Street, Polokwane Central.',
  NULL, NULL,
  '["https://visita.co.za/directory/vodacom-shop-pietersburg-schoeman-street-polokwane/", "https://www.southafricabusinessdirectory.co.za/company/cc74d1e0720984d1569b40b0f72ffbab/vodacom-shop-polokwane-schoeman-street/polokwane/consumer-electronics-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vodacom-shop-schoeman-street-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'evn-africa-polokwane-central', 'EVN Africa',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '30 Schoeman St, Polokwane Central, 0700', '015 291 2020', 'https://www.evn.co.za', NULL,
  'EVN Africa is an engineering consultancy in Polokwane Central offering civil engineering, structural engineering, water and sanitation, agricultural engineering, and roads and infrastructure design services, from pre-site appraisal through detailed design to construction monitoring.',
  NULL, NULL,
  '["https://www.evn.co.za", "https://www.yellosa.co.za/company/148527/evn-africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'evn-africa-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ijuici-market-street-factory-shop-polokwane-central', 'iJuici Market Street Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '66A Market Street, Polokwane Central, 0699', '015 495 1102', 'https://ijuici.co.za', 'shopms@granorpassi.co.za',
  'iJuici Market Street Factory Shop is a factory outlet selling fruit juice concentrates and related products made by Granor Passi, in Polokwane Central.',
  NULL, NULL,
  '["https://ijuici.co.za/store/market-street-polokwane-factory-shop/", "https://www.granorpassi.co.za/store/market-street-polokwane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ijuici-market-street-factory-shop-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'metropolitan-market-street-polokwane-central', 'Metropolitan Polokwane (Market Street)',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Metropolitan Centre, 51 Market St, Polokwane Central, 0700', '015 291 1944', NULL, NULL,
  'Metropolitan Polokwane (Market Street) is an insurance and financial services branch offering funeral, life, retirement and investment products, in the Metropolitan Centre, Polokwane Central.',
  NULL, NULL,
  '["https://rsa.worldorgs.com/catalog/polokwane/financial-institution/metropolitan-polokwane-market-street", "https://south-africa.searchinafrica.com/business/4731191/south-africa/limpopo/polokwane/market-st/insurance-brokers/metropolitan-group-schemes"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'metropolitan-market-street-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-tlc-market-street-polokwane-central', 'Dis-Chem TLC Market Street',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '62 Market Street, Polokwane Central, 0699', '015 612 0509', NULL, 'marketstdispensary@thelocalchoice.net',
  'Dis-Chem TLC Market Street is a Dis-Chem The Local Choice pharmacy in Polokwane Central offering dispensing, click-and-collect and in-store clinic services such as vaccinations, blood tests and wellness screenings.',
  NULL, NULL,
  '["https://www.dischem.co.za/tlc-market-street-polokwane", "https://rfmcf.co.za/search-medical-provider/pharmacy-clinics/pharmacy-clinics/dis-chem-tlc-polokwane-(market-street)-pharmacy/323/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-tlc-market-street-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
