-- Slice 38 description enrichment (job 4)
-- 50 businesses, slugs 'voltra-energy-solutions-florauna' .. 'vapopax-pty-ltd-kloofsig'

UPDATE businesses
SET description = 'Voltra Energy Solutions supplies and installs solar power systems for homes and businesses, with free on-site consultations and tiered package options, and holds PV GreenCard installer certification.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00'
WHERE slug = 'voltra-energy-solutions-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vorster en Kie Rekenmeesters is an accounting and auditing practice based in Bergtuin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vorster-en-kie-rekenmeesters-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VP Electrical Contractors is a 100% black-owned electrical contracting company founded in 1990, providing residential and commercial electrical installation and maintenance services with projects completed across Limpopo, Gauteng and the Eastern Cape.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.topbusinesswomen.co.za/directories/vp-electrical-contractors/"]'
WHERE slug = 'vp-electrical-contractors-pty-ltd-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VPM Properties is a property management company based in Kilner Park, handling residential and commercial property portfolios and listing available properties through Private Property.',
    description_enriched_at = datetime('now')
WHERE slug = 'vpm-properties-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VQ Communications Agency is a strategic communications firm offering public relations, branding, social media strategy, and organisational change management consulting for businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'vq-communications-agency-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VRA Attorneys Pretoria Inc is a boutique law firm offering commercial law, compliance and administrative law, litigation and alternative dispute resolution, estates and fiduciary services, family law, and notarial services.',
    description_enriched_at = datetime('now')
WHERE slug = 'vra-attorneys-pretoria-inc-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VRH Power specialises in electrical power infrastructure projects spanning 11kV to 400kV, including substations, transmission lines, and secondary plant protection and automation solutions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-16:00, Sat-Sun Closed'
WHERE slug = 'vrh-power-rooihuiskraal-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VSP Huur is part of the VSP property group, which develops and manages a roughly R200 million portfolio of commercial, industrial, and residential property across the Tshwane region.',
    description_enriched_at = datetime('now')
WHERE slug = 'vsp-huur-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VT Transport provides nationwide delivery of furniture, stock, and general goods, handling dedicated loads of up to 16 tons and part loads using a mixed fleet of open and closed vehicles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-18:00'
WHERE slug = 'vt-transport-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VUKA AFRICA consulting engineers & project managers, incorporated in 2004, provides consultative engineering and project management services for construction and infrastructure projects.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/vuka-africa-consulting-engineers-project-managers"]'
WHERE slug = 'vuka-africa-consulting-engineers-project-managers-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vuselelwa Solutions is a software development business based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'vuselelwa-solutions-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VWN (Pty) Ltd Nutsman/Handyman offers handyman and property maintenance services in Parktown Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vwn-pty-ltd-nutsman-handyman-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vyfster Elektries is a family-run electrical contractor operating since 1987, offering commercial, residential and industrial electrical installations, maintenance, certification, air conditioning and solar power solutions.',
    description_enriched_at = datetime('now')
WHERE slug = 'vyfster-elektries-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VZLR Inc is a multi-disciplinary law firm with over 80 years of combined legal experience, offering banking and financial law, conveyancing, corporate and commercial law, family law, litigation, insurance law, intellectual property, labour law, medical law, personal injury, and wills and estates services from branches in Pretoria, Johannesburg and Nelspruit.',
    description_enriched_at = datetime('now')
WHERE slug = 'vzlr-inc-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vacation Centre is a travel agency specialising in tailor-made international holiday packages to destinations including Mauritius, Zanzibar, the Maldives, Seychelles and Thailand, with particular expertise in Beachcomber Mauritius resort bookings.',
    description_enriched_at = datetime('now')
WHERE slug = 'vacation-centre-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vacay Vibez specialises in self-catering timeshare sales and rentals at resorts across KwaZulu-Natal, the Western Cape, North West, Mpumalanga, Gauteng and the Free State, along with timeshare transfer services.',
    description_enriched_at = datetime('now')
WHERE slug = 'vacay-vibez-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vacuform 2000 is a Rosslyn-based manufacturer of vacuum-formed, blow-moulded and injection-moulded plastic components supplying automotive manufacturers including Ford, BMW, Nissan, Toyota, Mercedes-Benz and Volkswagen.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.vacuform.co.za/", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/vacuform-2000-pty-ltd"]'
WHERE slug = 'vacuform-2000-pty-ltd-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vahva Construction is a building and construction business serving the Florauna area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'vahva-construction-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vaimo is part of a global digital commerce and customer experience consultancy operating in 16+ markets, offering commerce strategy, solution development, experience design and analytics services, and holding partner status with Adobe Commerce, Shopify and commercetools.',
    description_enriched_at = datetime('now')
WHERE slug = 'vaimo-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Val de Grace Vet CREW is a full-service animal hospital offering vaccinations, diagnostics, general and spay/neuter surgery, dental care, microchipping and grooming, with particular expertise in exotic pets such as bearded dragons and small mammals, plus 24/7 emergency care.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'val-de-grace-vet-crew-val-de-grace' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valhalla Book Exchange sells affordable second-hand books, with prices ranging from around R5 to R150.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'valhalla-book-exchange-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valhalla Pharmacy & Clinic operates as a family pharmacy and clinic offering pharmaceutical products, health advice and clinical care from the Shoprite Centre in Valhalla.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-13:00'
WHERE slug = 'valhalla-pharmacy-clinic-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valhalla Safi Optometrists provides comprehensive eye examinations, prescription spectacles and contact lenses, and paediatric optometry for children from 6 months old, stocking eyewear brands including Ray-Ban, Guess and Pierre Cardin.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-11:30'
WHERE slug = 'valhalla-safi-optometrists-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valhalla Spares CC supplies a wide range of quality auto parts and accessories, with in-store shopping, in-store pickup and card and mobile payment options.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://pretoria.co.za/place/valhalla-spares-c-c"]'
WHERE slug = 'valhalla-spares-c-c-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valley Falls Spur is a branch of the Spur Steak Ranches family restaurant chain, serving steaks, burgers and other South African family dining favourites at Irene Village Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'valley-falls-spur-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valtran General Transport Contractors is a trucking and logistics company founded in 1975, offering general cargo and structural steel transport, warehousing and part-load services across Limpopo, Mpumalanga, Gauteng, North West, the Northern Cape, the Free State and into Botswana.',
    description_enriched_at = datetime('now')
WHERE slug = 'valtran-general-transport-contractors-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valuesmart Business Solutions is a cloud-based accounting and tax practice offering bookkeeping, tax accounting and tax consulting services to small and medium businesses.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/valuesmart-business-solution"]'
WHERE slug = 'valuesmart-business-solutions-grootfontein-country-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Valuetec Property Valuers provides independent professional valuations of commercial, agricultural, residential and specialised properties, including wine farms, for purposes ranging from market value and insurance to legal, tax and deceased estate matters, with valuers registered with the SACPVP and SAIV.',
    description_enriched_at = datetime('now')
WHERE slug = 'valuetec-property-valuers-gauteng-head-office-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Der Hoeven Smith Attorneys is a boutique property law firm of attorneys, notaries and conveyancers specialising in residential and commercial property transfers.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-der-hoeven-smith-attorneys-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Der Linde & Venter Konstruksie is a construction company handling projects from large commercial contracts to minor alterations, with experience across abattoirs, education and health facilities, industrial warehouses, retail spaces and residential construction, and BBBEE Level 2 status with 35% black women ownership.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-der-linde-venter-konstruksie-edms-bpk-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Der Merwe GP Attorneys is a Florauna-based law firm that has acted as an executor and authorised agent in deceased estate matters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30',
    source_urls = '["scraped:google-places-no-website", "https://www.cylex.net.za/company/van-der-merwe-gp-attorneys-23718954.html"]'
WHERE slug = 'van-der-merwe-gp-attorneys-florauna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van der Walt & Hugo Inc is a commercial law firm and conveyancing specialist established in 1998, handling residential and commercial property transfers, bonds, and litigation and dispute resolution, with Level 2 BEE status.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-der-walt-hugo-inc-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Heerden Pharmacy in Lyttelton, located in the Highlands Centre, offers comprehensive prescription services with delivery, same-day delivery and in-store pickup options, and trades six days a week including Saturdays.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/2609212687", "https://pretoria.co.za/listing/van-heerden-pharmacy-lyttelton/"]'
WHERE slug = 'van-heerden-pharmacy-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Heerdens Pharmacy at 522 Stanza Bopape Street is part of a pharmacy group with fifteen branches across Limpopo, Gauteng and Mpumalanga.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:30, Sun 08:00-12:30',
    source_urls = '["https://www.openstreetmap.org/node/307692604", "https://www.thinklocal.co.za/biz/van-heerden-pharmacy-arcadia-pretoria"]'
WHERE slug = 'van-heerdens-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Jaarsveldt Attorneys is a law firm serving clients in the Rietondale area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-jaarsveldt-attorneys-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Niekerk Attorneys Inc, founded in 2015, specialises in personal injury law, corporate and commercial litigation and family law, with additional services in estates, cyberlaw and notarial work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-14:00, Sat-Sun Closed'
WHERE slug = 'van-niekerk-attorneys-inc-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Niekerk Construction, established in 2001, is a medium-sized building contractor specialising in commercial, hospitality, residential and retail construction.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-niekerk-construction-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Niekerk Real Estate Moot specialises in residential property sales and rentals in Pretoria neighbourhoods including Villieria, Waverley, Wonderboom South and Dorandia, handling houses, apartments, townhouses and vacant land.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-niekerk-real-estate-moot-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Niekerk Vermaak Attorneys is a law firm of attorneys, conveyancers and notaries offering corporate law, family law, labour law, divorce law, commercial law, immigration law and conveyancing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/van-niekerk-vermaak-attorneys"]'
WHERE slug = 'van-niekerk-vermaak-attorneys-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Technologies is a managed IT services provider offering cloud hosting, Microsoft 365 deployment, VoIP phone systems, and on-site installations including network cabling, servers, firewalls and security cameras, with SLA-backed support contracts.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-technologies-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Tonder Transport is a trucking and transport business operating a fleet of MAN trucks.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-tonder-transport-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Vuuren Prokureurs is a law firm based in Roseville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-vuuren-prokureurs-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Wyk is an automotive repair business serving the Rooiwal area of Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-wyk-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Zyl Incorporated Attorneys / Properties, founded in 1998, offers conveyancing, litigation, estate planning, commercial law, property law, family law and notarial services, with more than 50 years of combined legal experience across its directors.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-zyl-incorporated-attorneys-properties-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Zyl''s Autobody is an insurance-approved, dealer-certified panelbeater offering collision repairs, spray painting and valeting for vehicles of any warranty status, with a two-year workmanship warranty and lifetime paintwork warranty.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30'
WHERE slug = 'van-zyls-autobody-jan-niemand-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Zyl''s Meat Market is a butchery offering top-quality cuts and specialty items including chakalaka wors and prepared venison.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://za.africabz.com/gauteng/van-zyls-meat-market-70744"]'
WHERE slug = 'van-zyl-s-meat-market-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van der Walt Attorneys Incorporated offers attorney, notary and conveyancing services from Garsfontein Office Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'van-der-walt-attorneys-incorporated-garsfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vaperite Lynnwood Lane is an over-18 vaping retailer stocking disposable vapes, pod devices, replacement coils, e-liquids and nicotine pouches, located in the Lynnwood Lane Retail Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'vaperite-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VapidEdge Corporate Services is a business consulting firm based in Amberfield Valley, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'vapidedge-corporate-services-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vapopax is a residential and commercial contractor with over 8 years in the industry, offering construction, electrical work, plant hire, waste management and property maintenance as a turnkey solution.',
    description_enriched_at = datetime('now')
WHERE slug = 'vapopax-pty-ltd-kloofsig' AND description_enriched_at IS NULL;
