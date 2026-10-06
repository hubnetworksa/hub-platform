-- thin-pages pretoria batch 10, checkpoint 5: Akasia (12 businesses -- closes
-- accommodation, car-dealerships, cleaning-services, motor-spares and security-services
-- to 3). Three other candidates from the sub-agent's report were dropped on validation,
-- not published: "Comfort Digital (Pty) Ltd" (computer-it-services) -- every source gave
-- a garbled or only-partial phone digit string with no two sources agreeing on the same
-- number; "Artistic Ghetto Crafts (Pty) Ltd" (printing-services) -- already exists in the
-- live snapshot under this exact slug, i.e. already published; "La Louise Venue"
-- (wedding-services) -- its phone already belongs to an existing business published
-- under suburb slug "hesteapark". printing-services and wedding-services therefore stay
-- at 2 of 3 each, not closed, contrary to the sub-agent's initial read.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'casta-diva-boutique-hotel-akasia', 'Casta Diva Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '67 Albatros Street, Ninapark, Akasia, 0156', '+27 81 542 4449', 'https://castadiva.biz', 'info@castadiva.co.za',
  'Casta Diva Boutique Hotel is a four-star boutique hotel in Ninapark, Akasia, offering overnight accommodation alongside an on-site restaurant, theatre, art gallery, and conference centre under one roof. The property is listed by Pretoria''s official tourism body, Visit Tshwane, which highlights its views for sunrise and sunset viewing from the hotel grounds, positioning it as a destination for both overnight stays and events rather than a standalone guesthouse.

Located at 67 Albatros Street in Ninapark, the hotel combines private, upscale accommodation with venue hire for functions and conferences in the Akasia area. Its pairing of a theatre and art gallery with guest rooms and conferencing space makes it a venue suited to guests seeking a boutique stay as well as organisations looking to host small events, exhibitions or meetings in the northern Pretoria area.',
  '["https://castadiva.biz/contact", "https://www.visittshwane.co.za/casta-diva-boutique-hotel/", "https://za.africabz.com/gauteng/casta-diva-boutique-hotel-249337", "https://www.africabizinfo.com/ZA/casta-diva-boutique-hotel-081-542-4449"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'casta-diva-boutique-hotel-akasia'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'francor-guesthouse-akasia', 'Francor Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '4 Boundary Road, Heatherdale AH, Akasia, 0182', '+27 12 542 4958', 'https://www.francor-guesthouse.com', NULL,
  'Francor Guesthouse is a bed and breakfast in Heatherdale, Akasia, offering 14 tastefully decorated double and single en-suite rooms finished in an African country style. The guesthouse is positioned close to Rosslyn''s industrial area, the Onderstepoort academic and research precinct, and Akasia''s hospital, making it convenient for visitors with business or medical reasons to be in the northern Pretoria area.

The property is located at 4 Boundary Road in Heatherdale, within the greater Akasia area, and takes bookings directly for overnight stays. Its combination of ensuite rooms and a themed, country-style atmosphere makes it suited to both leisure travellers and visitors needing a quiet overnight base near Rosslyn''s commercial and industrial hub, Onderstepoort, or healthcare appointments in the surrounding suburb.',
  '["https://www.francor-guesthouse.com/contact-us.php", "https://za.africabz.com/gauteng/francor-guesthouse-39486", "https://www.africabizinfo.com/ZA/francor-guesthouse-012-542-4958", "https://www.destinationsouthafrica.co.za/accommodation/akasia/francor-guesthouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'francor-guesthouse-akasia'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'jmc-pretoria-north-akasia', 'JMC Pretoria North',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '565 Rachel De Beer Street, Pretoria North, Pretoria', '012 546 4503', NULL, NULL,
  'JMC Pretoria North is a car dealership on Rachel De Beer Street in the Pretoria North/Akasia area, selling both passenger vehicles and light commercial trucks to the public. The dealership specialises in vehicles with carrying capacities ranging from around 850 kilograms up to 3 tons, covering both high-end and more affordable options for private buyers and small businesses that need load-carrying vehicles.

Operating from 565 Rachel De Beer Street, the dealership positions itself among the established vehicle dealers serving the greater Pretoria North area, with a focus on quality stock across its range. Its mix of standard cars and light truck/bakkie-type vehicles makes it a point of call for buyers who need a single dealership covering both everyday transport and higher-capacity commercial vehicles in Akasia.',
  '["https://showme.co.za/pretoria/jmc-pretoria-north/", "https://www.cylex.net.za/company/jmc-pretoria-north-23662711.html", "https://www.onlycars.co.za/dealer/index/11437.html", "https://sabusinesslistings.co.za/listings/jmc-pretoria-north/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jmc-pretoria-north-akasia'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'amukelani-cleaning-services-akasia', 'Amukelani Cleaning Services',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '141 Rooipeer Street, Chantelle, Akasia', '+27 76 474 9747', 'https://www.amukelanisa.co.za', 'info@amukelanisa.co.za',
  'Amukelani Cleaning Services is a residential and commercial cleaning company based at 141 Rooipeer Street in Akasia''s Chantelle area. The business provides cleaning for homes, apartments, offices, retail spaces, and corporate environments across Gauteng, with teams handling tasks such as kitchens, bathrooms, walls, and cupboards as part of its standard service offering.

Services range from regular household cleaning to once-off deep cleans and office cleaning contracts, giving both homeowners and businesses a single provider for ongoing or occasional cleaning needs. Based in Akasia, the company positions itself as a dependable option for clients in the surrounding Gauteng area who need thorough, hygienic cleaning without managing the work themselves.',
  '["https://www.amukelanisa.co.za/contact-us/", "https://www.facebook.com/amukelanicleaning/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'amukelani-cleaning-services-akasia'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'priohealth-clinic-akasia', 'Priohealth Clinic',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '13 Plantain Avenue, The Orchards, Akasia, 0182', '+27 65 850 1179', NULL, NULL,
  'Priohealth Clinic is a medical facility at 13 Plantain Avenue in The Orchards, Akasia, offering routine diagnostic and treatment services in a general medical setting. The clinic operates from Monday to Saturday between 8:00 AM and 6:00 PM and is closed on Sundays, giving patients in the area extended weekday and Saturday access to care.

Positioned within The Orchards area of Akasia, the clinic focuses on efficient, patient-focused care for everyday medical needs rather than emergency or specialist hospital services. Its extended opening hours, including Saturdays, make it a convenient option for residents of Akasia and the surrounding Pretoria North suburbs who need accessible outpatient healthcare close to home.',
  'Mon-Sat 08:00-18:00, Sun Closed',
  '["https://pretoria.co.za/place/priohealth-clinic", "https://www.cybo.com/ZA-biz/priohealth-clinic", "https://rsa.worldorgs.com/catalog/akasia/hospital/priohealth-clinic", "https://www.infobel.com/en/southafrica/priohealth_clinic/the_orchards/ZA101903279/businessdetails.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'priohealth-clinic-akasia'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'akasia-beemer-spares-akasia', 'Akasia Beemer Spares',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '4 Hennie Steyn Street, Rosslyn, Pretoria', '083 521 6666', NULL, NULL,
  'Akasia Beemer Spares is a used and new auto parts store on Hennie Steyn Street in Rosslyn, specialising specifically in BMW parts. The business sources and sells both new and second-hand components for BMW vehicles, serving customers who need model-specific parts rather than general automotive stock.

Based at the corner of Hennie Steyn and Hardie Muller Street in Rosslyn, within the greater Akasia area, the store operates as a registered close corporation and deals directly with customers over the phone and in person at its Rosslyn premises. Its focus on a single vehicle brand makes it a specialist option for BMW owners and repairers in the Akasia and Rosslyn area looking for compatible parts without the markup of a main dealer.',
  '["https://www.facebook.com/akasia.beemer.spares/", "https://www.cylex.net.za/company/akasia-beemer-spares-pretoria--rosslyn-23846850.html", "https://firmania.co.za/pretoria/akasia-beemer-spares-pretoria-rosslyn-77631"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'akasia-beemer-spares-akasia'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'goldwagen-akasia-akasia', 'Goldwagen Akasia',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '20 Mispel Avenue, The Orchards, Akasia, 0201', '010 271 0254', 'https://www.goldwagen.com/store/goldwagen-akasia/', 'akasia@goldwagen.com',
  'Goldwagen Akasia is an automotive parts store at 20 Mispel Avenue in The Orchards, Akasia, operating as a branch of the national Goldwagen vehicle parts chain. The store stocks a range of vehicle spares and parts for sale to both trade and retail customers, backed by the group''s broader network of branches across South Africa.

The Akasia branch emphasises quality spares, customer service, and vehicle-specific product knowledge as part of its day-to-day retail operation. As one of several Goldwagen locations nationally, it gives motorists and workshops in the Akasia and wider Pretoria North area access to the chain''s established parts range and pricing without needing to travel to other branches.',
  '["https://www.goldwagen.com/store/goldwagen-akasia/", "https://www.findglocal.com/ZA/Akasia/101948439404169/Goldwagen-Akasia", "https://za.africabz.com/gauteng/goldwagen-akasia-585413"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goldwagen-akasia-akasia'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'plantland-akasia-garden-centre-akasia', 'Plantland Akasia Garden Centre',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  'Cnr Longmore and Old Brits Road, Akasia, Pretoria North, 0200', '012 942 8714', 'https://www.plantland.co.za', NULL,
  'Plantland Akasia Garden Centre is a nursery and garden centre at the corner of Longmore and Old Brits Road in Akasia, Pretoria North, operating as part of the wider Plantland chain. The centre stocks a wide range of indoor and outdoor plants alongside gardening hardware and related products for home gardeners.

Customers can shop in-store or arrange delivery, with staff available to help select plants suited to different spaces and growing conditions. The centre accepts credit card payment and offers in-store pickup for online or phone orders, giving residents of Akasia and Pretoria North a local branch of an established gardening retailer rather than an independent, one-off nursery.',
  '["https://showme.co.za/pretoria/lifestyle/plantland-akasia/", "https://www.cylex.net.za/company/plantland-akasia-garden-centre-23699075.html", "https://za.africabz.com/gauteng/plantland-akasia-garden-centre-71785", "https://pretoria.co.za/place/plantland-akasia-garden-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plantland-akasia-garden-centre-akasia'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'super-print-and-signs-akasia', 'Super Print & Signs',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '15 Seymore Road, The Orchards, Akasia, 0210', '012 549 0177', 'https://superprints.co.za', NULL,
  'Super Print & Signs is a print shop at 15 Seymore Road in The Orchards, Akasia, operating as a small business corporation across printing, signage, and embroidery. Its services cover full-colour litho and digital printing for business cards, flyers, brochures and general stationery, alongside signage and corporate clothing branding.

The business describes itself as a multi-discipline print shop rather than a single-product printer, combining signage and branding work with corporate clothing and a broad range of printing solutions for business customers. Based in The Orchards area of Akasia, it serves local businesses needing printed marketing materials, branded signage, and embroidered corporate wear from one supplier.',
  '["https://www.goafricaonline.com/za/1277818-super-print-signs", "https://superprints.co.za", "https://rsa.worldorgs.com/catalog/akasia/print-shop/super-print-signs", "https://www.facebook.com/superprintandsigns/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'super-print-and-signs-akasia'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

-- NOTE: a candidate "Artistic Ghetto Crafts (Pty) Ltd" (printing-services/akasia) was
-- dropped here -- validate.mjs found it already exists in the live snapshot under this
-- same slug, i.e. it is already a published business, not a new one. printing-services
-- therefore stays at 2 of 3 (existing Minuteman Press Rosslyn + Super Print & Signs
-- above), not closed, contrary to the sub-agent's initial read.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'xplode-security-services-and-projects-akasia', 'Xplode Security Services and Projects',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '45 Shannon Street Extension, The Orchards, Akasia, 0182', '072 606 1962', NULL, NULL,
  'Xplode Security Services and Projects is a security company registered at 45 Shannon Street Extension in The Orchards, Akasia. The business has operated as a primary co-operative since its incorporation in October 2008, placing it among the longer-established security providers in the Akasia area and giving it a multi-decade presence in the northern Pretoria security sector.

The company''s registered activity covers security services and related projects, and it maintains an active social media presence for client updates and safety information relevant to the area. Based in The Orchards, it serves the Akasia community as a locally registered security provider with close to two decades of operating history behind it, offering a level of continuity that newer entrants in the area cannot yet match.',
  '["https://www.findglocal.com/ZA/Pretoria/1666903780279124/Xplode-Security-Services-and-Projects", "https://b2bhint.com/en/company/za/xplode-security-services-and-projects--B2008227676", "https://www.facebook.com/Xplode-Security-Services-and-Projects-1666903780279124/photos/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'xplode-security-services-and-projects-akasia'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'preen-security-and-armed-response-akasia', 'Preen Security & Armed Response',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '2011 M17 Road, Moshate Gardens, Rosslyn, Pretoria North', '087 711 1226', 'https://preensecurity.co.za', 'info@preensecurity.co.za',
  'Preen Security & Armed Response operates from a head office at 2011 M17 Road in Moshate Gardens, Rosslyn, providing round-the-clock security services to the greater Akasia area. Its service range covers armed guarding, armed response, VIP and personal protection, a K9 unit, alarm systems, and a dedicated control room and call centre, alongside event security for functions and gatherings.

The company operates on a 24/7 basis and is led by a management team the business describes as having a combined 30 years of security industry experience. Based in Rosslyn within Akasia, it positions itself as a full-service security provider covering everything from static guarding to specialised response and monitoring services for homes, businesses, and events in the area.',
  'Open 24 hours',
  '["https://preensecurity.co.za/contact-us/", "https://www.assist247.co.za/Search/service-provider.aspx?sp_id=2456776", "https://services4africa.co.za/Search/service-provider.aspx?sp_id=2456776"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'preen-security-and-armed-response-akasia'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'duck-and-dine-akasia', 'Duck & Dine',
  (SELECT id FROM suburbs WHERE slug = 'akasia'),
  '44 Gillyflower Street, Winternest AH, Akasia', '+27 82 895 0561', 'https://www.duckdine.com', NULL,
  'Duck & Dine is an event and wedding venue at 44 Gillyflower Street in Winternest, Akasia, run as a family business with a distinctive French bohemian, vintage-chic style. The venue hosts weddings, corporate functions, birthdays, and other gatherings, and is designed to suit both small, intimate events and larger functions.

Described as an upmarket but accessible venue, Duck & Dine combines garden and function spaces with themed decor that distinguishes it from more conventional wedding venues in the area. Set in Winternest within Akasia, it serves couples and event organisers across northern Pretoria looking for a boutique, character-driven setting rather than a standard banqueting hall.',
  '["https://www.duckdine.com/contact-us/", "https://za.africabz.com/gauteng/duck-dine-239623", "https://www.facebook.com/duckanddinevenue/", "https://showme.co.za/pretoria/lifestyle/duck-dine/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'duck-and-dine-akasia'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);

-- NOTE: a candidate "La Louise Venue" (wedding-services/akasia) was dropped here --
-- validate.mjs found its phone already belongs to an existing business published under
-- a different suburb slug ("la-louise-venue-hesteapark"), i.e. it is already on the
-- site, not a new business. wedding-services therefore stays at 2 of 3 (existing Mon
-- Sha-Mia Venue + Duck & Dine above), not closed, contrary to the sub-agent's initial read.
