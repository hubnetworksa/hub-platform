-- Description enrichment sweep (job 4) — slice 32
-- 50 businesses (tng-renewable-energy-olievenhoutbosch .. totalsports-wonderboom-wonderboom)

UPDATE businesses
SET description = 'Tng Renewable Energy is a solar and renewable-energy business based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tng-renewable-energy-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tnsy Petroleum Consulting is a petroleum-industry consultancy based in Louwlardia, Centurion, helping clients secure wholesale and retail fuel licensing, run fuel-pricing and feasibility studies, and navigate supply-chain and regulatory requirements across the upstream, midstream and downstream sectors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'tnsy-petroleum-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toastit Business Solutions is a software development business based in Midstream Estate, Olifantsfontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'toastit-business-solutions-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toit Developments is a turnkey building and design company in La Montagne, Pretoria, offering architectural planning, design and construction for homes, with over 15 years of experience in the building industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'toit-developments-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toit Metals Trust is an industrial metal-supply business based in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'toit-metals-trust-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tokal Fibre Installation is a fibre installation business operating from Hillview Industrial Park in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tokal-fibre-installation-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tokollo Group Pty Ltd is a logistics, courier and transport business based near Woodhill Golf Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tokollo-group-pty-ltd-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tolamo Tax Specialists (Pty) Ltd is a tax and accounting firm based in Thatchfield Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tolamo-tax-specialists-pty-ltd-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tolcon Group is a transport-infrastructure management company operating from Corporate Park in Irene, Centurion, running toll and freeway operations, weighbridge and road-maintenance services, route patrols and renewable-energy solutions across South Africa since 1985.',
    description_enriched_at = datetime('now')
WHERE slug = 'tolcon-group-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toliri Services is a building and construction business based in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'toliri-services-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tombstones "R" us Quality is a tombstone and memorial-masonry supplier based in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'tombstones-r-us-quality-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tomorrow Products supplies eco-friendly, biodegradable and compostable packaging - takeaway containers, bio straws, cups, plates and deli containers - to food-industry businesses from Waterkloof Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tomorrow-products-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toncrete is a ready-mix concrete supplier based in Klerksoord, Akasia, with over 10 years of experience supplying and pumping concrete for foundations, slabs, roads, parking lots and driveways.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ccbc.co.za/business-directory-2/toncrete-klerksoord", "https://toncrete.co.za/contact-us/", "https://toncrete.co.za/"]'
WHERE slug = 'toncrete-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toner Factory is a stationery and printer-consumables business based in Amandasig, Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'toner-factory-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tong-Mongalo Corporate Services (TMCS) is a corporate and commercial law consultancy in Amberfield Glen, Centurion, offering contract-management, corporate-governance and company-secretary advisory services, transaction structuring and board training, operating since 2004.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'tong-mongalo-corporate-services-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tony''s Seafood & Grill is a family-run restaurant in Lynnwood Ridge, Pretoria, serving seafood and grilled meats with Portuguese and South African influences, including prawns, steaks, ribs and prego rolls, alongside a curated wine and drinks selection.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 10:30-21:00'
WHERE slug = 'tonys-seafood-grill-lynnwood-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Top Decks, Gauteng is a carpentry business in Wapadrand, Pretoria, building and installing custom timber decks, patios, pergolas, pool decks and built-in braais, and is a preferred installer for Envirodeck and Rhino Wood composite decking.',
    description_enriched_at = datetime('now')
WHERE slug = 'top-decks-gauteng-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Top Green Trading is an industrial supply business based in Koedoespoort Industrial, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'top-green-trading-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Top Health is a healthcare clinic on Alkantrant Road, near Lynnwood Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'top-health-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Top Roof Waterproofing is a roofing and waterproofing specialist in Villieria, Pretoria, handling tiled and iron-roof waterproofing, torch-on flat roofs, roof painting, gutters, ceilings and insulation, backed by a 5-year guarantee on its waterproofing work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'top-roof-waterproofing-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TopCap Canopies is a canopy manufacturing and supply business based in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'topcap-canopies-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Topaz Occasions is an events and function-venue business based at House of Makoya in Wapadrand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'topaz-occasions-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Topaz Park is a commercial property and office-space development in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'topaz-park-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toplinesteel is a steel supply and manufacturing business based in Rosslyn, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'toplinesteel-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Topo Software is a computer and IT services business based in Hazelwood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'topo-software-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toppan Security (Pty) Ltd is the local office of Toppan Security, a global identity- and payment-security company producing passports, ID cards, border-control systems and secure payment cards, based at Southdowns Office Park in Irene, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://africa.toppangravity.com/", "https://toppansecurity.com/"]'
WHERE slug = 'toppan-security-pty-ltd-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tops at Spar is a liquor store on 13th Street in Menlo Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tops-at-spar-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Topster Financial Services CC is an insurance and financial-services business based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'topster-financial-services-cc-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torea Networks (Pty) Ltd is a computer and IT services business based in Constantia Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'torea-networks-pty-ltd-constantia-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torenia Marketing is a marketing and advertising business based in The Orchards, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'torenia-marketing-the-orchards' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torga Optical is an opticians and eyewear store on Pretorius Street in Pretoria Central, part of the Torga Optical chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'torga-optical-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torinet (Pty) Ltd is a Level 1 BBBEE company in Kameeldrift East, Pretoria, providing project management and turnkey construction and telecommunications services, including emergency-vehicle warning equipment, micro-trenching and solar energy installations.',
    description_enriched_at = datetime('now')
WHERE slug = 'torinet-pty-ltd-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Toro''s Meats is a butchery based in Amandasig, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'toro-s-meats-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totai is a wholesale and distribution business based in Icon Park, Sunderland Ridge, Centurion, supplying gas cookers, heaters, and catering and camping appliances and accessories under the Totai, Elba and Elica brands, with over 60 years in the gas-appliance industry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00',
    source_urls = '["https://www.hotfrog.co.za/company/1278060806680576/totai/pretoria/outdoor-accessories-equipment", "https://www.brabys.com/za/gauteng/centurion/sunderland-ridge-ind/gas-stoves/totai", "https://totai.co.za/contact/"]'
WHERE slug = 'totai-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Total Online Solution is a software development business based near Woodhill Golf Estate, Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'total-online-solution-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies 150 Garstfontein Road is a fuel station on Garstfontein Road in Newlands, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.openstreetmap.org/node/12269704075", "https://totalenergies.co.za/"]'
WHERE slug = 'totalenergies-150-garstfontein-road' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Annlin is a fuel station on Braam Pretorius Street in Annlin, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-annlin-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Centurion Gate is a fuel station on John Vorster Drive in Centurion Gate, Centurion, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-centurion-gate-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Daspoort Tunnel is a fuel station on Bremer Street in Claremont, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-daspoort-tunnel-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Eersterust is a fuel station on David Diedricks Avenue in Eersterust, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-eersterust-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Elardus Park is a fuel station on Solomon Mahlangu Drive in Erasmuskloof, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-elardus-park-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Eldoraigne is a fuel station at the shopping centre on Saxby Avenue in Eldoraigne, Centurion, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-eldoraigne-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Hertzog Street Motors is a fuel station on Hertzog Street in Rietfontein, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-hertzog-street-motors-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Moot Street Motors is a fuel station on Moot Street in Daspoort, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-moot-street-motors-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Silvertondale is a fuel station on Stormvoel Road in Eersterust, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-silvertondale-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Totiusdal is a fuel station on Codonia Avenue in Waverley, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-totiusdal-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TotalEnergies Waltloo is a fuel station on Petroleum Street in Waltloo, Silverton, Pretoria, part of the TotalEnergies network supplying fuel and ELF-branded lubricants to motorists.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalenergies-waltloo-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalguard Workwear Rosslyn is a PPE and workwear supplier in Rosslyn, Pretoria, positioning itself as a safety-equipment partner for workplace protective gear.',
    description_enriched_at = datetime('now')
WHERE slug = 'totalguard-workwear-rosslyn-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports is a national sporting-goods chain, part of the Foschini Group, selling footwear, apparel and equipment from brands including Nike, Adidas, Asics and Puma; this branch trades from Irene Village Mall in Irene Farm Villages, Centurion.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16976863_2", "https://mallguide.co.za/shops/view/9079/irene-village-mall/totalsports", "https://startupmag.co.za/2025/02/totalsports-from-humble-beginnings-to-south-africas-premier-sports-retailer/"]'
WHERE slug = 'totalsports-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports is a national sporting-goods chain, part of the Foschini Group, selling footwear, apparel and equipment from brands including Nike, Adidas, Asics and Puma; this branch trades from Wonderboom Junction Shopping Centre in Annlin West, Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.totalsports.co.za/?utm_source=google&utm_medium=store&utm_campaign=pretoria", "https://startupmag.co.za/2025/02/totalsports-from-humble-beginnings-to-south-africas-premier-sports-retailer/"]'
WHERE slug = 'totalsports-wonderboom-wonderboom' AND description_enriched_at IS NULL;
