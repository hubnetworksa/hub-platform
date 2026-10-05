INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'jordaan-smit-inc-attorneys-and-conveyancers-rietvalleirand', 'Jordaan Smit Inc. Attorneys & Conveyancers',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '36 Escombe Ave, Rietvalleirand, Pretoria, 0181', '012 940 3579', NULL, NULL,
  'Jordaan Smit Inc. Attorneys & Conveyancers is a law practice in Rietvalleirand, Pretoria, offering legal services in property transactions, conveyancing, and litigation. The firm handles the transfer and registration of property on behalf of buyers, sellers, and financial institutions, alongside representation in civil litigation matters. Clients are guided through each step of a property transaction or dispute with attention to the practical outcome they need.

The practice is based at 36 Escombe Avenue in Rietvalleirand, within reach of surrounding Pretoria East suburbs, and offers wheelchair accessible parking for visiting clients. It has built a track record working with individuals and smaller clients on conveyancing and litigation matters rather than large corporate caseloads, with reviewers noting clear communication throughout a matter.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/jordaan-smit-inc-attorneys-amp-conveyancers","https://yellowpages-af.cybo.com/ZA-biz/jordaan-smit-inc-attorneys-conveyancers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jordaan-smit-inc-attorneys-and-conveyancers-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ej-s-electronics-pty-ltd-rietvalleirand', 'EJ''s Electronics (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '733 Piering Rd, Rietvalleirand, Pretoria, 0174', '074 113 5077', NULL, NULL,
  'EJ''s Electronics (Pty) Ltd runs a showroom in Rietvalleirand, Pretoria, specialising in audio-visual equipment and related electronics. The range covers home and business AV setups, alongside IT solutions, with staff offering side-by-side product comparisons and tailored advice so customers can match equipment to the space and budget they have in mind rather than ordering sight unseen.

The showroom at 733 Piering Road, Rietvalleirand, Pretoria, 0174, is open for walk-in visits from Monday to Saturday and includes wheelchair accessible parking for customers. Hands-on demonstrations let shoppers test audio-visual gear in person before buying, rather than choosing from a catalogue alone, which suits both home entertainment installations and smaller business AV setups in the surrounding Pretoria East area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/ejs-electronics-pty-ltd","https://yellowpages-af.cybo.com/ZA-biz/ejs-electronics-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ej-s-electronics-pty-ltd-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kr-components-sa-rietvalleirand', 'KR Components SA',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '15 Haweswater Street, Rietvalleirand, Pretoria, 0181', '087 808 4520', 'https://www.krcomponents.com', NULL,
  'KR Components SA is an electronic component supplier based in Rietvalleirand, Pretoria, sourcing and importing parts for industrial and electronics customers. Its catalogue spans camlocs, switches, cables, motors, encoders, springs and meters, together with fasteners such as rivets, studs, washers, inserts, catches and latches, and specialised chemicals used in PC board manufacturing including Loctite, Scotch-Weld and RTV products.

The company also supplies moisture-control products such as self-indicating desiccant bags and industrial drum vent dryers, and acts as the South African distributor for UK manufacturer Brownell Ltd. Established for more than 20 years and BEE-certified as a women-owned SME, it sources from an international supplier network to fill orders for customers across South Africa.',
  'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/gp/pretoria/engineers-general/kr-components-sa-pty-ltd_597397+0.html","https://za.placedigger.com/kr-components-sa1269067634.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kr-components-sa-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ivory-manor-boutique-hotel-rietvalleirand', 'Ivory Manor Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '280 Jochem Street, Rietvalleirand, Pretoria', '012 110 4380', 'https://www.ivorymanor.co.za', NULL,
  'Ivory Manor Boutique Hotel is a family-owned function venue and boutique hotel in Rietvalleirand, Pretoria, catering for gatherings of 20 to 150 guests. The venue offers five air-conditioned conference rooms and breakaway spaces alongside a wine cellar and garden settings that can be used for indoor or outdoor events, suiting corporate conferences, product launches, weddings and private celebrations.

Beyond events, the property operates as a boutique hotel with individually decorated guest suites and a restaurant serving meals from canapes to multi-course dinners. Functions can be arranged in a formal gala style or a more relaxed format such as a buffet or cocktail-style gathering, and the hotel is located at 280 Jochem Street in Rietvalleirand.',
  NULL,
  NULL, NULL,
  '["https://www.ivorymanor.co.za/contact/","https://www.lekkervenues.co.za/venues/ivory-manor-boutique-hotel"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ivory-manor-boutique-hotel-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'dpt-printing-rietvalleirand', 'DPT Printing',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '232 Jochem Street, Rietvalleirand, Pretoria, 0181', '079 491 8801', NULL, NULL,
  'DPT Printing is a print shop in Rietvalleirand, Pretoria, producing business cards, calendars, books and flyers for local customers. The shop focuses on fast turnaround and custom print runs, with in-store pickup available once an order is ready rather than requiring delivery for every job.

The premises at 232 Jochem Street, Rietvalleirand, Pretoria, 0181, accept debit and credit cards as well as NFC mobile payments, and the site offers wheelchair accessible parking. The shop has built a strong local reputation, with customers rating it highly for affordable pricing and straightforward, reliable service, making it a practical option for everyday printing needs such as flyers and business stationery rather than large commercial print runs.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/dpt-printing","https://www.findglocal.com/ZA/Pretoria/104916307841469/DPT-Printing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dpt-printing-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'rietvlei-akademie-rietvalleirand', 'Rietvlei Akademie',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '58/1 Jochem Street, Rietvalleirand, Pretoria', '071 832 5541', 'https://www.rietvleirar.co.za', NULL,
  'Rietvlei Akademie is a private Afrikaans Christian primary school in Rietvalleirand, Pretoria, aimed at learners who do not thrive in a mainstream classroom because of anxiety, ADHD or high-functioning autism and other learning barriers. The school follows the CAPS curriculum set by the Department of Education but presents the work in a simplified, more child-friendly way, using mind maps and dictation so learners spend less time on summarising and analysing text.

Classes are kept to 10 to 15 learners so that staff can give more individual attention and follow a remedial teaching approach, and the school maintains a strict anti-bullying policy. It is an independent, fee-paying primary school located on Jochem Street in Rietvalleirand, with qualified teaching staff and admission arranged directly with the school.',
  NULL,
  NULL, NULL,
  '["https://www.rietvleirar.co.za/kontak-ons/","https://schoolsdigest.co.za/listings/rietvlei-akademie/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rietvlei-akademie-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-village-waldorf-independent-primary-school-rietvalleirand', 'The Village Waldorf Independent Primary School',
  (SELECT id FROM suburbs WHERE slug = 'rietvalleirand'),
  '48 Blue Crane Avenue, Rietvalleirand, Pretoria', '012 345 3771', NULL, NULL,
  'The Village Waldorf Independent Primary School is a private primary school in Rietvalleirand, Pretoria, offering ordinary schooling outside the public system. As an independent, fee-paying institution, tuition fees are set by the school to cover its operating costs and resources, with families responsible for the fees that apply to their child''s grade.

Based at 48 Blue Crane Avenue in Rietvalleirand, the school recorded 68 learners and 9 educators in a 2023 survey, giving a student-to-teacher ratio of roughly 8 to 1. As with other independent schools, its uniform policy follows the South African Schools Act of 1996 and Gauteng Education Department guidelines, and admission and fee enquiries are handled directly through the school administration.',
  NULL,
  NULL, NULL,
  '["https://skools.co.za/listings/the-village-waldorf-independetnt-primary-school/","https://schoolsdigest.co.za/listings/the-village-waldorf-independent-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-village-waldorf-independent-primary-school-rietvalleirand'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

