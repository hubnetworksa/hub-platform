-- Description enrichment sweep (job 4) -- slice 16
-- 23 researched, 27 reworded, 6 with hours found, 0 skipped

UPDATE businesses
SET description = 'Smartin Solutions is a software consulting firm in Pierre van Ryneveld Park, Centurion, specialising in business automation and digital transformation -- offering gap analysis, solution architecture and full software development lifecycle delivery, including systems integration across ERP, finance and e-commerce platforms.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartin-solutions-pty-ltd-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smartline Designs & Print is a design and print business in Erasmia, Centurion, serving local marketing and advertising needs.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartline-designs-print-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smit Compliance is a legal and regulatory compliance consultancy in Rietfontein, Pretoria, offering HR and labour consulting, health and safety and environmental compliance audits, contract drafting, and training on POPI, employment law and occupational health and safety.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["http://www.smitcompliance.com/", "https://local.infobel.co.za/ZA101658551/smit_compliance-rietfontein.html"]'
WHERE slug = 'smit-compliance-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smith and Company Administrative Consultants is an accounting and administrative consultancy based in Eersterust, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smith-and-company-administrative-consultants-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smokey Jan is a smokehouse food truck operating in Theresapark, Pretoria North, serving smoked brisket and pork sandwiches with potato salad, with meat slow-smoked for up to 20 hours.',
    description_enriched_at = datetime('now')
WHERE slug = 'smokey-jan-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smoof Move is a furniture removals and relocation company based in Shere, Centurion, offering residential and office moves, storage solutions, and weekly shared-load transport between Pretoria, Johannesburg, Bloemfontein, Durban, Cape Town and Port Elizabeth.',
    description_enriched_at = datetime('now')
WHERE slug = 'smoof-move-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SnA Architects is an architecture and design practice in Die Wilgers, Pretoria, working across corporate, retail, educational, residential and industrial projects, and recognised with a SAPOA merit award for its work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30',
    source_urls = '["http://www.snaar.co.za/", "https://nearbyza.com/place/sna-architects"]'
WHERE slug = 'sna-architects-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SnA Architects is an architecture and design practice in Die Wilgers, Pretoria, working across corporate, retail, educational, residential and industrial projects, and recognised with a SAPOA merit award for its work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30'
WHERE slug = 'sna-architects-die-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snap Packaging Pty Ltd is an industrial packaging supplier based in Waltloo, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'snap-packaging-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snaps & Sneakers Media is a media production company in Midstream Estate specialising in wedding videography and cinematography, creating custom wedding films for couples.',
    description_enriched_at = datetime('now')
WHERE slug = 'snaps-sneakers-media-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snoux Company is a photography business based in The Reeds, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'snoux-company-the-reeds' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snow Water is an industrial supplier based in Southdowns, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'snow-water-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snyman P J N is a dental practice in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'snyman-p-j-n-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snyman Staalwerke is a steelworks and construction business in Klerksoord, Akasia.',
    description_enriched_at = datetime('now')
WHERE slug = 'snyman-staalwerke-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snyman de Jager Attorneys'' Centurion office, based at River Falls Office Park in Doringkloof, practises property and conveyancing, litigation, estate and trust administration, and notarial and general legal services.',
    description_enriched_at = datetime('now')
WHERE slug = 'snyman-de-jager-attorneys-centurion-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snyman de Jager Attorneys'' Midstream branch practises property and conveyancing, litigation, estate and trust administration, and notarial and general legal services, from Bondev Office Park in Midstream.',
    description_enriched_at = datetime('now')
WHERE slug = 'snyman-de-jager-attorneys-midstream-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'So Subtle is a restaurant and takeaway in Ashley Gardens, near Menlyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'so-subtle-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SoReal Solutions is an IT support and cloud services provider in Highveld, Centurion, offering technical support with SLA-backed response times, cloud hosting, network design, cybersecurity, VoIP telephony, backup and disaster recovery, and Microsoft 365 services, with over 20 years in the industry.',
    description_enriched_at = datetime('now')
WHERE slug = 'soreal-solutions-highveld' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SoSafety is an industrial safety products supplier based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sosafety-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soap World Mayville Factory Shop is a factory outlet selling cleaning and soap products in Eloffsdal, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'soap-world-mayville-factory-shop-eloffsdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soap-Up Detergents is a cleaning products supplier based in Daspoort, Pretoria, trading from Garden Plaza in Hermanstad.',
    description_enriched_at = datetime('now')
WHERE slug = 'soap-up-detergents-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soapbox Promo & Gifts is a promotional products and corporate gifting supplier based in Brummeria, Pretoria, offering branded apparel, bags, drinkware and office items with in-house embroidery and branding services.',
    description_enriched_at = datetime('now')
WHERE slug = 'soapbox-promo-and-gifts-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Social Company is a digital marketing and social media agency based in Bergtuin, Pretoria, offering SEO, paid advertising, social media management, web design and hosting services, with over a decade of experience serving 200+ clients.',
    description_enriched_at = datetime('now')
WHERE slug = 'social-company-bergtuin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Social Excellence is a full-service marketing agency in Murrayfield, Pretoria, offering web design, graphic design and printing, social media management, photography and videography, and brand identity development.',
    description_enriched_at = datetime('now')
WHERE slug = 'social-excellence-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Social Media and Design Corp is a branding and marketing firm in Waverley, Pretoria, offering social media management, graphic design, website development, corporate clothing and gifting, and signage and printed products.',
    description_enriched_at = datetime('now')
WHERE slug = 'social-media-and-design-corp-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sodalis Business Group (SBG) is a business consulting firm based in Bronberrik, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sodalis-business-group-sbg-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soft Solutions is an industrial supplier based in Waterkloof Heights, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'soft-solutions-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soft Touch Day Spa is a day spa in Amandasig, Pretoria North, offering beauty and wellness treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'soft-touch-day-spa-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soft-Ice Catering Equipment is a commercial catering equipment supplier in Montana, Pretoria, trading since 2008 and serving as the exclusive South African importer for ChromeCater and Beiqi, supplying soft-serve machines, commercial refrigeration, butchery and bakery equipment to restaurants and caterers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-12:00'
WHERE slug = 'soft-ice-catering-equipment-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Softcre8 is a software development business based in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'softcre8-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Softree is a software development company based in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'softree-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Soin Africa is an online retailer of professional audio equipment based in The Willows, Pretoria, selling full-range speakers, subwoofers and replacement parts from brands including Nexus, X Audio and FatalPro.',
    description_enriched_at = datetime('now')
WHERE slug = 'soin-africa-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sokolic Commercial Property - Pretoria is a commercial real estate brokerage handling leasing and sales of offices, industrial, retail and warehouse properties, and investment property, with listings across Gauteng and the Western Cape.',
    description_enriched_at = datetime('now')
WHERE slug = 'sokolic-commercial-property-pretoria-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SokulungaSolutions is an industrial supplier based in Klerksoord, Rosslyn, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sokulungasolutions-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sol-Tech (Monumentpark-kampus) is a private vocational training college in Monument Park, Pretoria, offering Afrikaans-medium, skills-based training in technical trades such as diesel mechanics, electrical work, mechatronics and welding, as well as IT, early childhood development and hairdressing qualifications.',
    description_enriched_at = datetime('now')
WHERE slug = 'sol-tech-monumentpark-kampus-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SolMach is an industrial equipment supplier based in Woodhill Golf Estate, Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solmach-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SolTech (Pty)Ltd is an education and training provider based in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'soltech-pty-ltd-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sola Fox is a solar energy solutions provider based in Derdepoort, Pretoria, offering solar installations for homes and businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'sola-fox-reliable-and-affordable-solar-solutions-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar & Security Nerd (Moot Pretoria) is an online retailer of solar and security equipment based in Mayville, Pretoria, supplying solar panels, batteries and hybrid inverters from brands including Longi, DEYE and SunSynk, alongside magnetic locks and door security accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-security-nerd-pty-ltd-moot-pretoria-mp-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Comes First is a solar energy business based in Mayville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-comes-first-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Europe (Pty) Ltd is a solar equipment importer and wholesaler based in Onderstepoort, Pretoria, distributing solar panels, inverters, lithium batteries and related components from brands including Deye, Dyness, LuxPower and Longi, as well as EV chargers, generators and solar pumps.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 08:00-14:00'
WHERE slug = 'solar-europe-pty-ltd-onderstepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Europe (Pty) Ltd is a solar equipment importer and wholesaler based in Onderstepoort, Pretoria, distributing solar panels, inverters, lithium batteries and related components from brands including Deye, Dyness, LuxPower and Longi, as well as EV chargers, generators and solar pumps.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30, Sat 08:00-14:00'
WHERE slug = 'solar-europe-pty-ltd-solar-product-importer-manufacturer-distributor-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar For Sale is a solar, electrical and construction services business based in Silverton, Pretoria, also trading industrial lubricants and engine oils through its Silverton Lubricates division, and offering 24/7 customer support.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-for-sale-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Hub SA - BESS is a solar energy and battery storage company based in Kameeldrift, Pretoria, providing off-grid and on-grid solar installations, battery energy storage systems, power purchase agreements, and full regulatory and maintenance support for businesses.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-hub-sa-bess-kameeldrift' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Power Experts (Pty) Ltd. is a solar energy solutions provider based in Villieria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-power-experts-pty-ltd-villieria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar SA Solutions is a solar energy business based in Waverley, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-sa-solutions-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Select Africa is a solar energy solutions provider based in Theresapark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-select-africa-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Solutions 4 Everyone PTY LTD is a solar energy solutions provider based in Leeuwfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-solutions-4-everyone-pty-ltd-leeuwfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Suppliers SA is a solar equipment supplier based in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-suppliers-sa-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Solar Systems SA Johannburg Pretoria is a solar energy business based in Wierdapark, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'solar-systems-sa-johannburg-pretoria-wierdapark' AND description_enriched_at IS NULL;
