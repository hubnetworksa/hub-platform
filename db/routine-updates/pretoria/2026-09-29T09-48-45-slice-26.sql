-- Slice 26 description-enrichment batch (job 4)
-- 50 businesses, "Team Building Go" .. "Tepanyekga Contribution Enterprise PTY LTD"

UPDATE businesses
SET description = 'Team Building Go is a Pretoria-based corporate events company offering activities like The Amazing Race, escape rooms, Minute to Win It and Survivor-style challenges, plus deep team-building packages focused on growth strategies, based in Ashlea Gardens.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-building-go-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Infinite Team designs experiential learning programmes for corporate groups in and around Annlin, ranging from recreational activities to adventure sports, aimed at building unity and communication through hands-on team-development exercises.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-building-pretoria-the-infinite-team-annlin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Team Centuria - Powered by Real Estate Services is an estate agents team based in Amberfield Glen Estates, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-centuria-powered-by-real-estate-services-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Team Miche is a business consulting firm based in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-miche-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Team Orion Remax Infoglobe is a real estate team within RE/MAX Infoglobe''s Constantia Park office, handling residential sales, rentals and vacant land across Pretoria, Centurion and Brits, based near Woodhill Golf Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'team-orion-remax-infoglobe-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tebogo Digital Solutiions is an IT services provider based in Olievenhoutbosch Ext 36, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tebogo-digital-solutiions-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Cables is a wholesale and commercial cable supplier in Rietfontein, Pretoria, stocking cables and related equipment for telecommunications, security systems and electrical installations.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.africanadvice.com/1230285/Cables/Pretoria/Tech_Cables/", "https://www.brabys.com/za/gauteng/pretoria/rietfontein/cables/tech-cables"]'
WHERE slug = 'tech-cables-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Center is a software development business based in Doornpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-center-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Dad is an IT services provider based in Boardwalk, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-dad-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech IT All is an online technology retailer in Wapadrand selling networking gear, laptops, CCTV and security equipment, storage, and power solutions such as UPS units and solar kits, plus refurbished electronics.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-it-all-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Nation, based at Jacaranda Mall in Rietfontein, builds custom gaming PCs from entry-level to high-performance rigs, offers 3D printing, and provides IT and console repairs alongside computer and gaming hardware sales.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'tech-nation-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Smart Business Solutions offers flexible, monthly-rental solar panel installation and maintenance for businesses in Zwavelpoort, helping reduce energy costs without a large upfront investment.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-smart-business-solutions-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech Serve is an IT consulting and software development agency in Die Hoewes, Centurion, building web and mobile applications and e-commerce solutions alongside general IT support.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-serve-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech-Mate Online is an electronics and appliance retailer based in Kosmosdal, Midrand.',
    description_enriched_at = datetime('now')
WHERE slug = 'tech-mate-online-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tech-Tech is an IT consulting and support company serving Pretoria, offering managed IT services, cybersecurity, Microsoft 365 support and voice/data connectivity for businesses that want a single IT partner.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.tech-tech.co.za/", "https://techtech.co.za/"]'
WHERE slug = 'tech-tech-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TechLaw Consulting is a business consulting firm based in Die Wilgers, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'techlaw-consulting-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TechLifestyle is an electronics and appliance retailer based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'techlifestyle-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TechStyle HDL is an electrical contractor based in Murrayfield, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'techstyle-hdl-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Techfave Industries is a software development business based in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'techfave-industries-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Techfusion (Pty) Ltd is a managed IT services provider with over 20 years'' experience, based at Fintech Campus in Die Wilgers and offering IT support, cybersecurity and infrastructure management, with a particular focus on supply chain, healthcare and financial-services clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'techfusion-pty-ltd-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Technical Draughting Services, based in Pierre van Ryneveld Park, produces civil and structural drawings, structural steelwork layouts, reinforcement detailing and mechanical layout drawings.',
    description_enriched_at = datetime('now')
WHERE slug = 'technical-draughting-services-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Techno-Electronics is an industrial supplier based on the CSIR Campus in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'techno-electronics-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TechnoScene is a business consulting firm based in The Willows, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'technoscene-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Technofin is an asset-finance intermediary established in 1991, arranging rental and asset-acquisition finance for dealers, schools and other clients from its office in Ashlea Gardens, Pretoria.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = 'technofin-ashley-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Technology Infrastructure Architects PTY LTD is an IT services provider based in Sinoville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'technology-infrastructure-architects-pty-ltd-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Technomobi (Pty) Ltd is an online mobile phone retailer in Doringkloof, Centurion, selling smartphones, tablets and smartwatches from brands including Apple, Samsung and Huawei, as well as certified pre-owned and refurbished devices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat-Sun Closed'
WHERE slug = 'technomobi-pty-ltd-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Techtion is an instrumentation and automation specialist in Rosslyn, delivering turnkey automation solutions and engineering consulting for the automotive, food and beverage, and tobacco sectors.',
    description_enriched_at = datetime('now')
WHERE slug = 'techtion-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Techxilla is a software development business based near Copperleaf Golf Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'techxilla-copperleaf-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tecleo Data Recovery Lab and Digital Forensics Lab is an IT services provider based in Olievenhoutbosch, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tecleo-data-recovery-lab-and-digital-forensics-lab-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TecsaReco supplies refrigeration, HVAC, renewable-energy and appliance spare parts from Hennopspark, Centurion, covering everything from compressors and solar inverters to washing-machine and stove components.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-17:00, Fri 07:30-16:30, Sat 08:00-12:00, Sun Closed'
WHERE slug = 'tecsareco-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tectix Group is a software and digital-transformation company in Eco Park, Centurion, offering custom software engineering, cloud migration, DevOps, cybersecurity and data engineering services built on platforms including AWS, Azure and Salesforce.',
    description_enriched_at = datetime('now')
WHERE slug = 'tectix-group-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ted Graphics Solutions is a marketing and advertising business based in Andeon, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'ted-graphics-solutions-andeon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teddy Trailers, also trading as Mobile Kitchen Trailers SA, manufactures custom mobile kitchen trailers, mobile VIP toilet units and mobile freezer units for food businesses, events and construction sites, built to order in Annlin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'teddy-trailers-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TeeCentral is an engineering and surveying firm based at Midlands Office Park, Midstream Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'teecentral-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teejays Projects is an electrical contractor based at Summerfields Estate, Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'teejays-projects-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teejey Electronic is an electronics and appliance business based in Salvokop, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'teejey-electronic-salvokop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tegra is a systems-integration partner in Faerie Glen with over 20 years'' experience, specialising in API management, API security, managed file transfer and network security for enterprises across Southern Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'tegra-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Teka Famba is a car rental company based in Thatchfield, Centurion, offering hatchbacks through to SUVs, bakkies and minibuses with low deposits, no credit card requirement and pickup/delivery at agreed locations.',
    description_enriched_at = datetime('now')
WHERE slug = 'teka-famba-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Telecloud is a South African telecommunications provider based in Eldoraigne, Centurion, offering business-class fibre internet, Cloud PBX and VoIP phone systems, and call-centre technology since 2011.',
    description_enriched_at = datetime('now')
WHERE slug = 'telecloud-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Telkom Direct Wonderboom (Kolonnade) is a mobile phone and telecoms retail branch inside Wonderboom Junction, Annlin West.',
    description_enriched_at = datetime('now')
WHERE slug = 'telkom-direct-wonderboom-kolonnade-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Telkom Wonderpark Express is a mobile phone and telecoms retail branch inside Wonderpark Shopping Centre, Karenpark.',
    description_enriched_at = datetime('now')
WHERE slug = 'telkom-wonderpark-express-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TelloTech is a business consulting firm based in Centurion Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'tellotech-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Telltec is an IT services provider based in Raslouw, Celtisdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'telltec-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tempest Car Hire Centurion is a vehicle hire business based in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tempest-car-hire-centurion-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ten-E Packaging Service SA (Pty) Ltd is an industrial packaging supplier based in Hennopspark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'ten-e-packaging-service-sa-pty-ltd-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tender Capital Africa is a 100% woman- and black-owned tender-finance enterprise based in Faerie Glen, providing funding that helps small and medium businesses take on tender opportunities.',
    description_enriched_at = datetime('now')
WHERE slug = 'tender-capital-africa-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tender Zone is a printing services business based in Amberfield, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tender-zone-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TenderX (PTY) Ltd is a business consulting firm based in Waterkloof Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tenderx-pty-ltd-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tenth Consulting is a business consulting firm based in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'tenth-consulting-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tepanyekga Contribution Enterprise PTY LTD is a business consulting firm based in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'tepanyekga-contribution-enterprise-pty-ltd-erasmuskloof' AND description_enriched_at IS NULL;
