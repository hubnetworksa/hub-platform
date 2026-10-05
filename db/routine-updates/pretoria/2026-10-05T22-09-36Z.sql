-- Thin-page fill, Pretoria batch 5, checkpoint 1: Equestria
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'travel-clinic-equestria-equestria', 'Travel Clinic Equestria',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  'Equestria Centre, Cnr Simon Vermooten & Furrow Road, Equestria, 0184', '012 807 6130', NULL, NULL,
  'Travel Clinic Equestria is a general medical practice based in Equestria, in the eastern suburbs of Pretoria. It is listed on South Africa''s Medpages healthcare provider directory as a General Practice (GP), offering everyday consultations alongside a specific focus on travel health, including pre-journey check-ups and travel vaccinations for patients preparing to travel abroad.

The practice operates from Equestria Centre, on the corner of Simon Vermooten Road and Furrow Road, placing it within easy reach of the surrounding residential streets of Equestria and the neighbouring Pretoria East suburbs. As a general practice with a travel-health service alongside routine GP care, it serves patients who need standard medical consultations as well as those who need vaccination certificates and pre-departure medical advice before an overseas trip. Its listing and contact details are maintained on the Medpages healthcare provider database, which records registered medical practices across South Africa, and the practice can also be found through other local business directories under the same Equestria address.',
  NULL, NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=185661", "https://www.africabizinfo.com/ZA/travel-clinic-equestria-012-807-6130"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'travel-clinic-equestria-equestria'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ltt-computer-solutions-equestria', 'LTT Computer Solutions',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  '17 Furrow Rd, Equestria, Pretoria, 0184', '012 816 5363', 'https://www.lttcomputersolutions.co.za', NULL,
  'LTT Computer Solutions is a computer repair business based in Equestria, on the eastern side of Pretoria. It is listed under the computer repair service category, offering diagnosis, repair and general servicing of desktop and laptop computers to customers in the surrounding area.

The business operates from 17 Furrow Road in Equestria, Pretoria, and keeps regular weekday trading hours plus a shorter Saturday morning slot. For residents and small businesses around Equestria, it offers a nearby option for hardware repairs and computer servicing without having to travel into central Pretoria, and its contact details and address are listed consistently across more than one local business directory covering the Pretoria East area.',
  'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed', NULL, NULL,
  '["https://www.africabizinfo.com/ZA/ltt-computer-solutions-012-816-5363", "https://www.findglocal.com/ZA/Pretoria-East/109539224269063/LTT-Computer-Solutions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ltt-computer-solutions-equestria'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-equestria-equestria', 'Clicks Equestria',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  'Equestria Shopping Centre, Furrow Rd, Equestria, Pretoria, 0184', '012 807 3741', 'https://clicks.co.za/store/Equestria/546', NULL,
  'Clicks Equestria is a branch of the Clicks pharmacy and retail chain, operating from the Equestria Shopping Centre on Furrow Road in Equestria, Pretoria. The store combines a retail pharmacy with the wider Clicks range of health, beauty and personal care products, and is staffed by a registered pharmacist on site.

As a full-service pharmacy branch, it dispenses prescription medicine and offers front-of-store healthcare products and over-the-counter advice to shoppers in Equestria and the surrounding Pretoria East suburbs. The branch keeps extended trading hours seven days a week, including Sunday and public holiday hours, making it a convenient stop for both routine prescriptions and everyday retail healthcare needs for people living in or passing through the Equestria Shopping Centre precinct.',
  'Mon-Sat 09:00-18:00, Sun 09:00-14:00', NULL, NULL,
  '["https://clicks.co.za/store/Equestria/546", "https://www.africabizinfo.com/ZA/clicks-pharmacy-equestria-012-807-0603"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-equestria-equestria'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'al-madina-supermarket-equestria', 'Al Madina Supermarket',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  'Equestria Gateway Centre, Simon Vermooten Road, Equestria, Pretoria', '074 213 0780', NULL, NULL,
  'Al Madina Supermarket is a grocery store located in the Equestria Gateway Centre in Equestria, Pretoria. The store offers a wide range of groceries and everyday household essentials, with in-store shopping for customers in the surrounding Equestria area.

Open seven days a week from early morning until late evening, the supermarket gives residents of Equestria a long-hours option for topping up groceries outside of standard shopping-centre hours. Its range covers typical supermarket staples alongside a broader selection of everyday items, and its address and trading hours are listed consistently across more than one local business directory covering the Equestria Gateway Centre.',
  'Mon-Sun 06:00-20:30', NULL, NULL,
  '["https://pretoria.co.za/place/al-madina-supermarket", "https://www.cybo.com/ZA-biz/al-madina-supermarket_9B"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'al-madina-supermarket-equestria'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'union-caterers-equestria', 'Union Caterers',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  '840 Cura Ave, Equestria, Pretoria, 0184', '012 807 3500', 'https://www.unioncaterers.co.za', NULL,
  'Union Caterers (Pty) Ltd is a catering company based at 840 Cura Avenue in Equestria, Pretoria. The business caters for functions of varying sizes, with customer reviews describing its use for both larger events and smaller gatherings, and praising its food quality and venue parking.

Operating from its Equestria premises, Union Caterers serves clients across the greater Pretoria area who need catering for events and functions, combining food preparation with practical considerations such as on-site parking for guests. The business maintains its own website alongside listings on more than one independent South African business directory, which consistently record its Equestria address and contact number.',
  NULL, NULL, NULL,
  '["https://vymaps.com/ZA/Union-Caterers-Pty-Ltd-3542383/", "https://www.findmy.co.za/services/business/union-caterers-pty-ltd/82467"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'union-caterers-equestria'),
  (SELECT id FROM categories WHERE slug = 'catering'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cit-moto-equestria', 'CIT Moto',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  '921 Lynnwood Road, Equestria, Pretoria', '012 342 8571', 'https://www.citmoto.co.za', NULL,
  'CIT Moto is a vehicle dealership and RMI-approved repair workshop based at 921 Lynnwood Road in Equestria, Pretoria. Alongside selling new and used cars, bakkies, SUVs and Jeep vehicles, the business runs an accredited workshop offering minor and major vehicle services, engine and gearbox repairs, diagnostics and electronics work.

The workshop side of the business also fits 4x4 accessories, LED lighting, exhaust systems, sound systems, upholstery and vehicle wrapping, giving Equestria-area customers a single site for both buying a vehicle and maintaining or customising one afterwards. As an RMI-approved workshop, it follows the Retail Motor Industry Organisation''s accreditation standards for motor vehicle repair work. Its Equestria address and contact details are listed consistently across its own website and more than one independent motoring and local business directory.',
  NULL, NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/100471563068600/CIT-Moto", "https://www.cars.co.za/groups/Individual-Dealers/CITMoto/4830/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cit-moto-equestria'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mzansi-afrika-consulting-services-equestria', 'Mzansi Afrika Consulting Services',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  '83 Papillon Complex, Farm Road, Equestria, Pretoria, 0184', '083 284 3305', 'https://mzansiafrika.co.za', NULL,
  'Mzansi Afrika Consulting Services is a business management consulting firm based at 83 Papillon Complex on Farm Road in Equestria, Pretoria. It is listed under the business management consultant category, providing consulting support to businesses operating in and around the greater Pretoria area, rather than accounting, legal or marketing services specifically.

Operating from its Equestria office, the firm offers clients a locally based alternative to consultants in Pretoria''s central business districts. It maintains its own website in addition to being listed on more than one independent South African business directory, with its contact number and Equestria address recorded consistently across these listings, which also note the firm''s registration under the business management consulting classification used for professional services firms of this kind.',
  NULL, NULL, NULL,
  '["https://www.africabizinfo.com/ZA/mzansi-afrika-consulting-services-083-284-3305", "https://www.findmy.co.za/services/business/mzansi-afrika-consulting-services/3548"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mzansi-afrika-consulting-services-equestria'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);
