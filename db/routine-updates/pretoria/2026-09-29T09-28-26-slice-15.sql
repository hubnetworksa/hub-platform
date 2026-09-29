-- Description enrichment sweep (job 4) -- parallel slice 15
-- Researched: Sithole Truck Bodies (own site, via WebSearch snippet), Siyamo Fuels
-- (own site, phone-number-confirmed branch, via WebSearch snippet). All others
-- reworded from already-verified fields (name/category/suburb/shopping-center)
-- after the session's shared WebSearch budget was exhausted partway through this
-- slice (confirmed via explicit "used its web search budget (200 of 200)" tool
-- response) and WebFetch was confirmed egress-blocked at the start of the run.

UPDATE businesses
SET description = 'Sithole Truck Bodies designs, manufactures, and repairs truck bodies and trailers, and also builds custom mobile kitchens for the food-service industry.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.sitholetruckbodies.co.za/about/"]'
WHERE slug = 'sithole-truck-bodies-pty-ltd-rietfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siti Prints is a printing services provider in Karenpark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siti-prints-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siviwe Industries (PTY) LTD is a building and construction business based in Eldoraigne, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'siviwe-industries-pty-ltd-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siyabonga nge Njabulo Trading and Project is a building and construction business based in Brooklands Lifestyle Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'siyabonga-nge-njabulo-trading-and-project-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siyakha SMME Business Consultants (Pty) Ltd is a business consulting firm in Salieshoek, Pretoria, focused on supporting small, medium and micro enterprises.',
    description_enriched_at = datetime('now')
WHERE slug = 'siyakha-smme-business-consultants-pty-ltd-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siyamo Fuels is a wholesale petroleum company supplying bulk fuel and lubricants to the agricultural, mining, and transport sectors, as well as independent unbranded filling stations.',
    description_enriched_at = datetime('now')
WHERE slug = 'siyamo-fuels-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siyasizana Waste Technologies is a cleaning services business in Rietvalleirand, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siyasizana-waste-technologies-rietvalleirand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siyathato Projects is a business consulting firm in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siyathato-projects-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Siza Nokwethu is a business consulting firm in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'siza-nokwethu-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sizabantu Auto Parts is a motor spares supplier in Erasmia, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sizabantu-auto-parts-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sizwe Africa IT Group is a computer and IT services provider in Kosmosdal, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sizwe-africa-it-group-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sizwe Foods is an industrial supplier and manufacturer based in Hermanstad, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sizwe-foods-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sizwe builders sand and stone is a hardware store in Daspoort, Pretoria, supplying building sand and stone.',
    description_enriched_at = datetime('now')
WHERE slug = 'sizwe-builders-sand-and-stone-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skayno Business Consultancy is a business consulting firm in Centurion Central, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'skayno-business-consultancy-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skidtech is a building and construction business in Roseville, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skidtech-roseville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skill Tech Solutions (Pty) Ltd is an education and training provider in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'skill-tech-solutions-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skilled Forces is a business consulting firm in Valhalla, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skilled-forces-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skin Renewal Lynnwood is a spa and wellness business located in Lynnwood Bridge Shopping Centre, Lynnwood Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skin-renewal-lynnwood-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skin Truth SA Lynnwood Lane is a spa and wellness business located in Lynnwood Lane Retail Centre, Equestria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skin-truth-sa-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SkinPhD Zambesi is a beauty and hair salon in Montana Gardens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skinphd-zambesi-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SkinTruth SA is a skincare and medical aesthetics clinic in Lynnwood Manor, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skintruth-sa-skincare-medical-aesthetics-clinic-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skinner Street Clinic is a healthcare clinic in Capital Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skinner-street-clinic-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skips and More is a cleaning services business in Wonderboom, Pretoria, providing skip bin waste removal.',
    description_enriched_at = datetime('now')
WHERE slug = 'skips-and-more-wonderboom' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skipzz - Skip Bins is a cleaning services business in Parktown Estate, Pretoria, providing skip bin hire and waste removal.',
    description_enriched_at = datetime('now')
WHERE slug = 'skipzz-skip-bins-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skororo shuttle services is a logistics and transport business in Doornpoort, Pretoria, offering shuttle transport services.',
    description_enriched_at = datetime('now')
WHERE slug = 'skororo-shuttle-services-doornpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sky Art Signs is a printing and signage business in Kilner Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sky-art-signs-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sky City Trading 114 (Pty) Ltd, trading as JB Mining & Industrial Supplies, is an industrial supplier in Klerksoord, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sky-city-trading-114-pty-ltd-t-a-jb-mining-industrial-supplies-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sky Photo is a photography business in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sky-photo-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sky Rocket Consulting is a business consulting firm in Waterkloof Glen, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sky-rocket-consulting-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sky Trampoline cc, trading as Trampoline Parts for SA, is a furniture and homeware business in Derdepoort, Pretoria, supplying trampolines and trampoline parts.',
    description_enriched_at = datetime('now')
WHERE slug = 'sky-trampoline-cc-trampoline-parts-for-sa-derdepoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SkyTech Dstv Installers Pretoria East is a computer and IT services business in Shere, Pretoria, offering DStv satellite installation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'skytech-dstv-installers-pretoria-east-shere' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skylark Properties is an estate agency in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'skylark-properties-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sleep Assist is an industrial supplier in Erasmuskloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'sleep-assist-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SleepNet / BreatheNet Pretoria is a business consulting firm in Zwartkop, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'sleepnet-breathenet-pretoria-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smac Civils is a building and construction business in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'smac-civils-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Small Business On-Track is a business consulting firm in Centurion Central, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'small-business-on-track-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Small Medium Enterprise Solutions is a computer and IT services provider in Doringkloof, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'small-medium-enterprise-solutions-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Small, Medium & Micro Enterprise is a business consulting firm in Candlewoods Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'small-medium-micro-enterprise-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Basics is a computer and IT services provider in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-basics-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Candy is a catering business in Derdepoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-candy-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart IT Services is a computer and IT services provider in Booysens, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-it-services-booysens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Multimedia is a logistics and courier transport business in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-multimedia-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Repair is a mobile phone sales and repair business in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-repair-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart SITE Consulting is a business consulting firm in Brummeria, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-site-consulting-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Technology is a computer and IT services provider in Meyerspark, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-technology-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Waste is a cleaning services business in Blue Valley Golf Estate, Pretoria, providing waste management services.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-waste-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SmartOps (Pty) Ltd is a commercial property and office space provider in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartops-pty-ltd-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SmartRetail POS Systems is a software development company in Rooihuiskraal, Centurion, providing point-of-sale systems.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartretail-pos-systems-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SmartStone Pretoria is an industrial supplier and manufacturer in Zwavelpoort, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartstone-pretoria-zwavelpoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smarten Renovate is a building and construction business in Bryntirion, Pretoria, offering renovation services.',
    description_enriched_at = datetime('now')
WHERE slug = 'smarten-renovate-bryntirion' AND description_enriched_at IS NULL;
