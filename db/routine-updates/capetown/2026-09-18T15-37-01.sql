-- Parallel agent research batch, part 2 -- the remaining 2 of 7 Cape Town
-- agents (Wynberg/Constantia/Bishopscourt/Tokai/Plumstead/Diep River, and
-- Kraaifontein/Panorama/Welgemoed/Kuils River/Edgemead/Bothasig/Boston).
-- Same verification bar as part 1 (2+ independent sources, mandatory
-- phone+address, no individuals named). Bishopscourt yielded zero
-- businesses -- confirmed via two independent area guides plus Wikipedia
-- that it's an almost entirely non-commercial suburb, not a research gap.

-- New shopping centres discovered this batch

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'maynard-mall-wynberg', 'Maynard Mall',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  'Corner of Main & Wetton Road, Wynberg, Cape Town, 7824', NULL, NULL,
  '["https://www.maynardmall.co.za/", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/kenilworth/maynard-mall-wynberg-cape-town-2742"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'constantia-village-constantia', 'Constantia Village',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Corner of Constantia Main Road & Spaanschemat River Road, Constantia, 7806', NULL, NULL,
  '["https://constantiavillage.co.za/", "https://www.growthpoint.co.za/retail-property/the-constantia-village"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'constantia-emporium-constantia', 'Constantia Emporium',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Ladies Mile Road, Constantia, Cape Town', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Constantia_Emporium", "https://www.capeconcierge.co.za/bishopscourt-area-guide/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'steenberg-village-tokai', 'Steenberg Village',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Reddam Avenue, Tokai, Cape Town, 7945', NULL, NULL,
  '["https://steenbergvillage.com/contact-details", "https://en.wikipedia.org/wiki/Tokai,_Cape_Town"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'blue-route-mall-tokai', 'Blue Route Mall',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Tokai Road, Tokai, Cape Town', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Blue_Route_Mall", "https://en.wikipedia.org/wiki/Tokai,_Cape_Town"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'edgemead-village-centre-edgemead', 'Edgemead Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  '122 Letchworth Drive, Edgemead, Cape Town, 7441', NULL, NULL,
  '["https://www.edgemeadvillagecentre.co.za/", "https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/cape-town/edgemead.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'welgemoed-forum-welgemoed', 'Welgemoed Forum',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  'Cnr Jip de Jager Drive & Kommissaris Street, Welgemoed, Cape Town, 7530', NULL, NULL,
  '["https://welgemoedforum.co.za/", "https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/welgemoed.html"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'haasendal-gables-kuils-river', 'Haasendal Gables',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Corner of Bottelary Road and Saxdowns Road, Kuils River, 7580', NULL, NULL,
  '["https://www.haasendalgables.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bothasig-square-bothasig', 'Bothasig Square',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  'Vryburger Avenue, Bothasig, Cape Town, 7441', NULL, NULL,
  '["https://www.buildit.co.za/Stores/View/Build-it-Bothasig-Western-Cape", "https://wego.here.com/south-africa/cape-town/shopping-centre/bothasig-mall--710jx7ps-27ce274c447c0860dde255ed2cc16552"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'zevenwacht-mall-kuils-river', 'Zevenwacht Mall',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Jan van Riebeeck Road, Kuils River', NULL, NULL,
  '["https://www.zevenwachtmall.co.za/", "https://www.yellosa.co.za/location/kuils-river/3"]',
  'mall'
);

-- Businesses: Constantia / Tokai / Wynberg / Plumstead / Diep River

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'groot-constantia-constantia', 'Groot Constantia',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Groot Constantia Road, Constantia, 7806', '+27 21 794 5128', 'https://grootconstantia.co.za', NULL,
  'Groot Constantia is South Africa''s oldest wine-producing estate, in Constantia, with a manor house museum and a daily wine-tasting shop.',
  NULL, NULL,
  '["https://grootconstantia.co.za/contact-us/", "https://constantiawineroute.com/groot-constantia/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'groot-constantia-constantia'), (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buitenverwachting-constantia', 'Buitenverwachting',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '37 Klein Constantia Road, Constantia, 7806', '021 794 5190', 'https://www.buitenverwachting.com', NULL,
  'Buitenverwachting is a wine estate in Constantia offering wine tastings and cellar-door sales.',
  NULL, NULL,
  '["https://www.buitenverwachting.com/", "https://constantiawineroute.com/buitenverwachting/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'buitenverwachting-constantia'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steenberg-wine-estate-hotel-tokai', 'Steenberg Wine Estate & Hotel',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Steenberg Road, Tokai', '+27 21 713 2211', 'https://steenbergfarm.com', NULL,
  'Steenberg is a working wine farm in Tokai with a five-star hotel and spa, described as the Cape''s first farm.',
  NULL, NULL,
  '["https://steenbergfarm.com/contact-us/", "https://constantiavalley.com/steenberg-vineyards/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'steenberg-wine-estate-hotel-tokai'), (SELECT id FROM categories WHERE slug = 'accommodation'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'norval-foundation-tokai', 'Norval Foundation',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  '4 Steenberg Road, Tokai, Cape Town', '+27 87 654 5900', 'https://www.norvalfoundation.org', NULL,
  'Norval Foundation is a contemporary art museum and sculpture garden in Tokai, open Wednesday to Sunday.',
  NULL, NULL,
  '["https://www.norvalfoundation.org/", "https://www.sa-venues.com/things-to-do/westerncape/norval-foundation/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'norval-foundation-tokai'), (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'constantia-pharmacy-constantia', 'Constantia Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Shop 25, Constantia Village Centre, Main Road, Constantia, 7806', '021 794 3713', 'https://www.constantiapharmacy.co.za', NULL,
  'Constantia Pharmacy is a pharmacy operating from the Constantia Village shopping centre.',
  NULL, NULL,
  '["https://www.constantiapharmacy.co.za/", "https://cape-town.infoisinfo.co.za/card/constantia-pharmacy/231804"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'constantia-pharmacy-constantia'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'riley-incorporated-wynberg', 'Riley Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '212 Rosmead Avenue, Wynberg, Cape Town, 7800', '021 797 7116', 'https://www.jfrlaw.co.za', NULL,
  'Riley Incorporated is a full-service law firm in Wynberg with particular expertise in criminal litigation.',
  NULL, NULL,
  '["https://www.jfrlaw.co.za/", "https://cape-town.infoisinfo.co.za/card/riley-inc/297070"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'riley-incorporated-wynberg'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pirates-steakhouse-and-pub-plumstead', 'Pirates Steakhouse and Pub',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '160 Main Road, Plumstead, 7800', '021 797 5659', 'https://www.piratessteakhouse.co.za', 'Plumstead@piratessteakhouse.co.za',
  'Pirates Steakhouse and Pub is a steakhouse and pub in Plumstead that has operated since 1990.',
  NULL, NULL,
  '["https://www.piratessteakhouse.co.za/", "https://cape-town.infoisinfo.co.za/card/pirates-steakhouse-and-pub/290414"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pirates-steakhouse-and-pub-plumstead'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nicol-coachworks-diep-river', 'Nicol Coachworks',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  'Unit 34, River Park, 77 De Waal Road, Diep River, 7800', '021 705 3411', 'https://www.nicolcw.co.za', 'info@nicolcw.co.za',
  'Nicol Coachworks is an owner-run panel-beating and structural repair shop in Diep River, SAMBRA-approved as a major structural repairer.',
  NULL, NULL,
  '["https://www.nicolcw.co.za/", "https://cape-town.infoisinfo.co.za/card/nicol-coachworks/414006"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'nicol-coachworks-diep-river'), (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'combat-force-cape-cc-diep-river', 'Combat Force Cape CC',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '9 Greenville Terrace, Diep River, Cape Town, 7800', '021 706 7775', NULL, NULL,
  'Combat Force Cape CC is a security company in Diep River specialising in CCTV installation and remote electronic monitoring.',
  NULL, NULL,
  '["https://www.yellosa.co.za", "https://cape-town.infoisinfo.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'combat-force-cape-cc-diep-river'), (SELECT id FROM categories WHERE slug = 'security-services'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mediclinic-constantiaberg-plumstead', 'Mediclinic Constantiaberg',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  'Burnham Road, Plumstead, Cape Town', '021 799 2911', NULL, NULL,
  'Mediclinic Constantiaberg is a 24-hour private hospital located in Plumstead.',
  NULL, NULL,
  '["https://www.capeconcierge.co.za/bishopscourt-area-guide/", "https://en.wikipedia.org/wiki/Plumstead,_Cape_Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mediclinic-constantiaberg-plumstead'), (SELECT id FROM categories WHERE slug = 'clinics-healthcare'), 1);

-- Businesses: Kraaifontein / Panorama / Kuils River / Boston / Edgemead / Welgemoed

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bailey-haynes-inc-kraaifontein', 'Bailey Haynes Inc',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Crown Crescent, Zonnendal, Kraaifontein', '021 422 4963', NULL, NULL,
  'Bailey Haynes Inc is a law firm in Kraaifontein handling civil litigation, conveyancing, and family law matters.',
  NULL, NULL,
  '["https://www.yellosa.co.za/location/kraaifontein"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bailey-haynes-inc-kraaifontein'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'craigmore-poultry-farm-kraaifontein', 'Craigmore Poultry Farm',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Old Paarl Road, Kraaifontein, 7570', '021 988 4055', NULL, NULL,
  'Craigmore Poultry Farm is a poultry farming operation on Old Paarl Road in Kraaifontein.',
  NULL, NULL,
  '["https://www.yellosa.co.za/location/kraaifontein"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'craigmore-poultry-farm-kraaifontein'), (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zoo-park-motors-kraaifontein', 'Zoo Park Motors',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '135 Brighton Road, Bonny Brook, Kraaifontein, 7570', '021 988 6543', NULL, NULL,
  'Zoo Park Motors is a service station in Kraaifontein offering fuel, a shop, and a car wash.',
  NULL, NULL,
  '["https://www.yellosa.co.za/location/kraaifontein/2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'zoo-park-motors-kraaifontein'), (SELECT id FROM categories WHERE slug = 'fuel-stations'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'advanced-electric-fencing-kraaifontein', 'Advanced Electric Fencing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '49 Edward Street, Windsor Park, Kraaifontein', '021 987 6988', NULL, NULL,
  'Advanced Electric Fencing is an electric fencing and security installation business in the Windsor Park area of Kraaifontein.',
  NULL, NULL,
  '["https://www.yellosa.co.za/location/kraaifontein"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'advanced-electric-fencing-kraaifontein'), (SELECT id FROM categories WHERE slug = 'fencing-security-installations'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mediclinic-panorama', 'Mediclinic Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Rothschild Boulevard, Panorama, Cape Town, 7500', '021 938 2111', 'https://www.mediclinic.co.za/en/panorama/home.html', NULL,
  'Mediclinic Panorama is a private hospital in Panorama.',
  NULL, NULL,
  '["https://www.mediclinic.co.za/en/panorama/home.html", "https://www.sa-venues.com/attractionswc/panorama.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mediclinic-panorama'), (SELECT id FROM categories WHERE slug = 'clinics-healthcare'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-castors-kuils-river', 'Cape Castors',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '35 Eikenbosch Street, De Kuilen, Kuils River, 7580', '021 903 0734', NULL, NULL,
  'Cape Castors is an industrial supplier of castors and wheels based in the De Kuilen area of Kuils River.',
  NULL, NULL,
  '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/kuils-river.html", "https://www.yellosa.co.za/location/kuils-river/3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'cape-castors-kuils-river'), (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'photo-booth-world-boston', 'Photo Booth World',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  '48 6th Avenue, Boston, Bellville, 7406', '072 118 2633', 'https://www.photoboothworld.co.za', NULL,
  'Photo Booth World is a photo booth hire business for events, based in the Boston area of Bellville.',
  NULL, NULL,
  '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville.html", "https://www.photoboothworld.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'photo-booth-world-boston'), (SELECT id FROM categories WHERE slug = 'party-event-hire'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-edgemead', 'The Crazy Store (Edgemead)',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 32, Letchworth Drive, Edgemead Village Centre, Edgemead, 7441', '021 558 5925', NULL, NULL,
  'The Crazy Store is a discount variety retailer trading from the Edgemead Village Centre shopping mall in Edgemead.',
  NULL, NULL,
  '["https://www.edgemeadvillagecentre.co.za/", "https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/cape-town/edgemead.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-crazy-store-edgemead'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-welgemoed', 'The Crazy Store (Welgemoed)',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 2-3, Welgemoed Forum, Cnr Jip de Jager Drive & Kommissaris Street, Welgemoed, 7530', '087 135 9673', NULL, NULL,
  'The Crazy Store is a discount variety retailer trading from the Welgemoed Forum shopping centre in Welgemoed.',
  NULL, NULL,
  '["https://welgemoedforum.co.za/", "https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/welgemoed.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-crazy-store-welgemoed'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);
