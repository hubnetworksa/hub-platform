-- Jobs 1-2: Brackenfell suburb research -- new shopping centre (Brackenfell Corner)
-- and 5 verified tenants, plus 3 standalone new businesses (9 records)

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'brackenfell-corner-brackenfell', 'Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Corner Frans Conradie Drive & Paradys Road, Brackenfell, Cape Town, 7560', NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.dischem.co.za/brackenfell-corner-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-brackenfell-corner-brackenfell', 'Woolworths Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 1, Brackenfell Corner Shopping Centre, Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560',
  '021 907 2540', NULL, NULL,
  'Woolworths Brackenfell Corner is a Woolworths retail store inside Brackenfell Corner Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.tiendeo.co.za/stores/Vergelegen/woolworths-brackenfell-corner-shopping-centre-paradys-street-brackenfell/47713"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-brackenfell-corner-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-brackenfell-corner-brackenfell', 'Dis-Chem Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 22, Brackenfell Corner Shopping Centre, Corner Frans Conradie & Paradys Roads, Brackenfell, Cape Town, 7560',
  '021 541 0609', NULL, NULL,
  'Dis-Chem Brackenfell Corner is a Dis-Chem pharmacy inside Brackenfell Corner Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.dischem.co.za/brackenfell-corner-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-brackenfell-corner-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-brackenfell-corner-brackenfell', 'SPAR Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Brackenfell Corner Shopping Centre, Corner Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560',
  '021 982 4326', NULL, NULL,
  'SPAR Brackenfell Corner is a SPAR supermarket inside Brackenfell Corner Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.tiendeo.co.za/stores/brackenfell/spar-co-frans-conradie-paradys-street/45965"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-brackenfell-corner-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-brackenfell-corner-brackenfell', 'Cash Crusaders Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 12, Brackenfell Corner Shopping Centre, Corner Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560',
  '021 982 3345', NULL, NULL,
  'Cash Crusaders Brackenfell Corner is a second-hand goods and pawn store inside Brackenfell Corner Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://cashcrusaders.co.za/locate-a-store/store/124/cash-crusaders-brackenfell"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-brackenfell-corner-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neovision-brackenfell-corner-brackenfell', 'Neovision Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 14, Brackenfell Corner Shopping Centre, Corner Frans Conradie & Paradys Street, Brackenfell, Cape Town, 7560',
  '021 001 3149', NULL, NULL,
  'Neovision Brackenfell Corner is an optometry practice inside Brackenfell Corner Shopping Centre in Brackenfell, offering eye exams, contact lenses and prescription eyewear.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=400160"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neovision-brackenfell-corner-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'planet-fitness-brackenfell-brackenfell', 'Planet Fitness Brackenfell',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Corner Bottelary Road & Cecil Morgan Drive, Brackenfell, Cape Town',
  '021 020 0767', 'https://www.planetfitness.co.za/gyms/brackenfell/', NULL,
  'Planet Fitness Brackenfell is a gym on the corner of Bottelary Road and Cecil Morgan Drive in Brackenfell, part of the Planet Fitness chain.',
  NULL, NULL,
  '["https://www.planetfitness.co.za/gyms/brackenfell/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=323947"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'planet-fitness-brackenfell-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brackenfell-hardware-brackenfell', 'Brackenfell Hardware',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  '55 Jacaranda Street, Protea Heights, Brackenfell, Cape Town',
  '021 023 2791', 'https://brackenfellhardware.co.za', NULL,
  'Brackenfell Hardware is a hardware store on Jacaranda Street in Protea Heights, Brackenfell.',
  NULL, NULL,
  '["https://www.facebook.com/Brackenfellhardware/", "https://brackenfellhardware.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brackenfell-hardware-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'premier-hardware-brackenfell', 'Premier Hardware',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Unit 5, Oryx Park, Tee Jay Road, Brackenfell Industria, Cape Town',
  '021 982 6290', 'https://premierhardware.co.za', NULL,
  'Premier Hardware is a hardware and architectural glass supplier based in Brackenfell Industria, Cape Town.',
  NULL, NULL,
  '["https://premierhardware.co.za/contact", "https://www.facebook.com/Premierhardwaresa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'premier-hardware-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
