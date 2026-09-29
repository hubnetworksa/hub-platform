-- Slice 36 description-enrichment batch (job 4), agent-generated.
-- Each UPDATE is guarded by description_enriched_at IS NULL so it only ever applies once.

UPDATE businesses
SET description = 'Uloans is an online fintech lender based in The Willows offering short-term loans, personal loans and debt-consolidation loans from R500 to R180,000, with repayment terms of one to 72 months, and is registered with the National Credit Regulator (NCR).',
    description_enriched_at = datetime('now'),
    source_urls = '["https://web.uloans.co/", "https://www.uloansbusiness.com/home-page"]'
WHERE slug = 'uloans-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate 4x4 is an off-road specialist in Onderstepoort supplying spares, accessories, wheels and tyres for Toyota Hilux and Land Cruiser 4x4s, alongside vehicle repair, reconditioning and custom fabrication work for the mining and exploration industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultimate-4x4-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Labour Solutions is a legal consultancy in Doornpoort specialising in labour and industrial-relations disputes for both employers and employees, also offering divorce legal services and HR consulting.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultimate-labour-solutions-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Laser Design is an industrial supplier and manufacturer specialising in laser design work, in Eloffsdal.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultimate-laser-design-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Packaging & Spice supplies packaging materials and spices to caterers, bakers and retailers in Rietfontein, stocking items such as cling wrap, foil trays, cake boxes, bottles, baking ingredients and party goods, with in-store shopping, delivery and curbside pickup.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://ultimatepackaging.co.za/", "https://www.brabys.com/za/gauteng/pretoria/rietfontein/spice-shops/ultimate-packaging-spice"]'
WHERE slug = 'ultimate-packaging-spice-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Powder Coaters is a powder coating, sandblasting and metal fabrication specialist in Koedoespoort offering over 4,000 colour options plus chemical paint stripping, custom fabrication and welding from a full-service facility with large-capacity ovens and a dedicated blast chamber, and has been operating for more than 10 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-16:30, Fri 07:30-13:30, Sat-Sun Closed'
WHERE slug = 'ultimate-powder-coaters-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Sky is an events venue in Montana accommodating up to 500 guests, hosting weddings, receptions, birthdays and conferences, with state-of-the-art audio-visual facilities and conference spaces for 130 to 450 attendees.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.ultimatesky.co.za/", "https://www.gauteng.net/attractions/ultimate-sky/"]'
WHERE slug = 'ultimate-sky-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultimate Stationery (Pty) Ltd is an office supplies retailer in Hermanstad selling stationery, paper and printing products, office furniture, printer cartridges and back-to-school supplies both in-store and online, with free Gauteng delivery on orders over R300 and 30-day accounts for business customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultimate-stationery-pty-ltd-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultra Liquors Centurion is a liquor store in Zwartkop stocking a range of alcohol and non-alcohol beverages including brown spirits, white spirits, wines and ciders.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-18:30, Sat 09:00-17:00',
    source_urls = '["https://www.openstreetmap.org/node/12290219401", "https://www.tiendeo.co.za/stores/centurion/ultra-liquors"]'
WHERE slug = 'ultra-liquors-centurion-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultra Liquors Wolmer is a liquor store on President Steyn Street offering a wide selection of alcoholic and non-alcoholic beverages, with on-site parking and wheelchair-accessible access.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/za/gp/pretoria/ultra-liquors-wolmer?to=place.ChIJqf0nG17Zvx4RSXwyleR9Pa0", "https://pretoria.co.za/listing/ultra-liquors-wolmer/", "https://shop.ultraliquors.co.za/landing-page/gauteng"]'
WHERE slug = 'ultra-liquors-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ultranova (Pty) Ltd is a logistics, courier and transport company in Elardus Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'ultranova-pty-ltd-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umaki (Pty) Ltd is an industrial supplier and manufacturer in Murrayfield.',
    description_enriched_at = datetime('now')
WHERE slug = 'umaki-pty-ltd-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umdali Africa is a building and construction business in Florauna.',
    description_enriched_at = datetime('now')
WHERE slug = 'umdali-africa-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umdeni Distributors is an industrial goods distributor in Erasmia.',
    description_enriched_at = datetime('now')
WHERE slug = 'umdeni-distributors-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umjikelo Recruitment Services is an executive search and recruitment firm founded in 2009, offering head-hunting, senior and middle-management placements, psychometric assessments and enterprise-development beneficiary recruitment across sectors including gaming, energy, media and ICT, based in Lynnwood Bridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'umjikelo-recruitment-services-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umlilo Creative Studios is a marketing and advertising agency in Brooklands Lifestyle Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'umlilo-creative-studios-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Umso Construction (Pty) Ltd is a civil engineering and construction firm established in 1996 and headquartered in Highveld, Centurion, specialising in road construction and rehabilitation, earthworks, water and sanitation infrastructure, and large public and private sector projects including bridges, schools, healthcare facilities and housing.',
    description_enriched_at = datetime('now')
WHERE slug = 'umso-construction-pty-ltd-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unahina Business Solutions is a contract-based funding provider in Menlo Park offering purchase order funding, tender funding and invoice discounting to help South African businesses fulfil confirmed orders and government or corporate contracts without disrupting their working capital.',
    description_enriched_at = datetime('now')
WHERE slug = 'unahina-business-solutions-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Underhill Corporate Solutions is a business consultancy in Sunnyside specialising in socio-economic research, development-programme monitoring and evaluation, data capturing and analysis, and economic impact assessment for clients across Southern Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.underhillsolutions.co.za/about-us/"]'
WHERE slug = 'underhill-corporate-solutions-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ungrounded Tech is a computer and IT services provider in Waterkloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'ungrounded-tech-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UniNetwork is a construction-industry connector based in Montana Park that links consumers with building resources across Gauteng, operates digital billboard advertising at high-traffic Pretoria intersections, and provides construction, property-maintenance and insurance-repair work through its subsidiary Astute Business Solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'uninetwork-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UniPlate is an industrial supplier and manufacturer in Waltloo.',
    description_enriched_at = datetime('now')
WHERE slug = 'uniplate-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Union Buildings is the official seat of the South African government and the office of the President, built between 1910 and 1913 on Meintjies Kop to a design by Sir Herbert Baker in English monumental style, with terraced indigenous gardens, a 9,000-seat amphitheatre and a bronze statue of Nelson Mandela unveiled in 2013.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'union-buildings-arcadia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unior Bike Tools is a shop in Doringkloof Mall, Doringkloof, selling bicycle tools and maintenance equipment.',
    description_enriched_at = datetime('now')
WHERE slug = 'unior-bike-tools-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uniqon Developers (Pty) Ltd is a Pretoria property development group established in 1985, building residential estates -- sectional-title apartments, simplex units and townhouses -- as well as retail centres, with a completed portfolio of more than 7,895 residential units across suburbs including Six Fountains, Olympus, Montana and Brooklyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'uniqon-developers-pty-ltd-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Dairy Products is a Pretoria-based dairy manufacturer producing ice cream, soft serve, frozen novelties, milk, cream and yoghurt under its own Avondale, Creamstar and Milkworx brands, as well as contract manufacturing for other brands including Wakaberry, McDonald''s and King Pie, from its Hermanstad facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://uniquedairy.co.za/contacts/", "https://za.africabz.com/gauteng/unique-dairy-products-127375", "https://uniquedairy.co.za/"]'
WHERE slug = 'unique-dairy-products-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Flooring is a flooring specialist in Centurion Crescent Shopping Centre that has traded since 1997, supplying and installing laminate, vinyl and engineered wood flooring plus wall cladding from brands including Kronotex, Kronoswiss, Egger and Classen, with a five-year workmanship warranty on installations.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/uniqueflooringsa/posts/composite-deck-done-by-unique-flooring-centurion-crescent-shopping-center-012-65/4710645648986771/", "http://www.findglocal.com/ZA/Centurion/706197812764928/Unique-Flooring-Blinds-&-Shutters", "https://uniqueflooring.co.za/"]'
WHERE slug = 'unique-flooring-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Metal Works CC is a metal fabrication business in Daspoort producing decorative ironwork such as rosettes, scrolls and spears alongside structural components and industrial castings and forgings, sold from an extensive product catalogue.',
    description_enriched_at = datetime('now')
WHERE slug = 'unique-metal-works-cc-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Motorsport is a 5-star RMI-graded vehicle performance and maintenance workshop in Rietfontein established in 2015, specialising in ECU remapping, performance modifications, diagnostics and fault-finding via data logging, and able to assist with warranty claims.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'unique-motorsport-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Painters is a painting and waterproofing contractor in Waverley with over 13 years of experience, offering interior and exterior painting, roof and damp waterproofing, wall crack repair and replastering, and wood revitalisation, with hands-on quality control by the company''s directors.',
    description_enriched_at = datetime('now')
WHERE slug = 'unique-painters-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Plus is a Rietondale-based creative design and media company offering graphic design (logos, branding, brochures, billboards), 3D/2D modelling and motion graphics, photography and videography for weddings and corporate events, and website design and SEO services.',
    description_enriched_at = datetime('now')
WHERE slug = 'unique-plus-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique Products Importers & Exporters CC is an importer and exporter of goods, based in Wingate Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'unique-products-importers-exporters-cc-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unique X-Ray Services is an X-ray and medical imaging services business in Theresapark, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'unique-x-ray-services-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'UniqueCo Property Valuers is a national South African valuation firm based in Val-De-Grace, providing SACPVP-accredited insurance, market and municipal valuations, mass valuation assessments, and servitude and expropriation assessments across residential, commercial, industrial and agricultural property types.',
    description_enriched_at = datetime('now')
WHERE slug = 'uniqueco-property-valuers-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unisa IRENE Conferencing Centre is a conference and events venue on the Unisa Irene campus in Doringkloof, hosting business meetings, workshops, parties and weddings, with ample on-site parking and security patrols.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/unisa-irene-conferencing-centre-275798"]'
WHERE slug = 'unisa-irene-conferencing-centre-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'United Radiology Solutions (Pty) Ltd is a medical imaging equipment supplier in Hennopspark, distributing United Imaging Healthcare systems including CT, MRI, digital X-ray, mammography, fluoroscopy, ultrasound, angiography and endoscopy equipment with technical support to hospitals, clinics and imaging centres.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://unitedradiologysolutions.com/"]'
WHERE slug = 'united-radiology-solutions-pty-ltd-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Universal Coolers is a heat-exchange and cooling-systems specialist in Raslouw established in 1999, manufacturing engine and transmission oil coolers, intercoolers, charge-air coolers and aluminium header tanks, and offering intercooler and radiator re-coring and testing plus custom 3D CAD-designed cooling solutions for the motorsport, mining, aviation and earthmoving sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'universal-coolers-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Universal Signs & Advertising is a Koedoespoort signage and printing company established in the early 1970s, manufacturing safety signage, pylons, gates and fencing in-house alongside business-card and brochure printing, branded apparel and embroidery, and display products such as gazebos and roll-up banners.',
    description_enriched_at = datetime('now')
WHERE slug = 'universal-signs-advertising-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Universal Meats is a butchery in Proclamation Hill.',
    description_enriched_at = datetime('now')
WHERE slug = 'universal-meats-proclamation-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Universal Vapes and Tobacconist is a shop in Nina Park Square, Ninapark, Akasia, selling vaping and tobacco products.',
    description_enriched_at = datetime('now')
WHERE slug = 'universal-vapes-and-tobacconist-ninapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unlimited Events Group is an event solutions company in Centurion with over 25 years of experience, offering event decor and styling, equipment and furniture rental, sound and lighting, stretch tents, staging and team-building activities from a catalogue of more than 2,000 hire items.',
    description_enriched_at = datetime('now')
WHERE slug = 'unlimited-events-group-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unlimited Fitness SA is a fitness business in Wapadrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'unlimited-fitness-sa-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unlock Capital is a gold, silver and diamond dealer in Montana Park that buys and sells krugerrands and old South African coins and notes, with daily-updated pricing.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.unlockcapital.co.za/we-buy/"]'
WHERE slug = 'unlock-capital-montana-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unrecorded Simplicity Multimedia Production (Pty) Ltd is a marketing and advertising business specialising in multimedia production, in Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'unrecorded-simplicity-multimedia-production-pty-ltd-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Unus2unum is an AI-powered business networking and referral-matching platform based in Clubview, Centurion, offering a private vetted network where members exchange client referrals, track introductions and attend in-person meetups worldwide.',
    description_enriched_at = datetime('now')
WHERE slug = 'unus2unum-glen-lauriston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Up in Smoke BBQ Centurion is a catering business specialising in BBQ, in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'up-in-smoke-bbq-centurion-heuweloord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Upat S.A. (Pty) Ltd is an industrial supplier and manufacturer based in Heritage Hill Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'upat-s-a-pty-ltd-pretoria-heritage-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Upendi Group of Services is a cleaning services company in Kirkney.',
    description_enriched_at = datetime('now')
WHERE slug = 'upendi-group-of-services-kirkney' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uprising Holdings Business Consultancy is a business consulting firm in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'uprising-holdings-business-consultancy-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Upskill My Business is a training and education provider in Muckleneuk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'upskill-my-business-muckleneuk' AND description_enriched_at IS NULL;
