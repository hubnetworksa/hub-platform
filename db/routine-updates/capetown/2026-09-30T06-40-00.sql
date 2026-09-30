UPDATE businesses
SET description = 'Blou Winkel is a motoring and hardware store on Voortrekker Road in Kraaifontein, stocking motor spares and accessories, hardware, plumbing and electrical supplies, and automotive paints, and offering LPG gas refills and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-19:00, Sun 07:00-13:00',
    source_urls = '["https://www.yellosa.co.za/company/594132/blou-winkel-die", "https://www.brabys.com/za/western-cape/kraaifontein/general-dealers/blou-winkel", "https://www.thinklocal.co.za/biz/blou-winkel-kraaifontein"]'
WHERE slug = 'blou-winkel-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Brackenfell Hardware is a hardware store serving the Protea Heights area of Brackenfell.',
    description_enriched_at = datetime('now')
WHERE slug = 'brackenfell-hardware-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bryan Capes Physiotherapy is a sport and spine physiotherapy practice at Panorama Healthcare Centre, offering dry needling and rehabilitation with a focus on sports injuries and neuro-musculoskeletal conditions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri 09:00-18:00, Sat 08:00-14:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/bryan-capes-physiotherapy-marine-drive-cape-town-znJNxn", "https://bcphysiotherapy.co.za/", "https://www.panoramahcc.co.za/tenants/bryan-capes-physiotherapist/"]'
WHERE slug = 'bryan-capes-physiotherapy-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Brackenfell Corner is the buy-sell-trade store''s branch inside Brackenfell Corner Shopping Centre, dealing in second-hand goods with separate retail and buyshop trading hours.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://cashcrusaders.co.za/locate-a-store/store/124/cash-crusaders-brackenfell", "https://opening-hours.co.za/03961472/Cash_Crusaders_Brackenfell"]'
WHERE slug = 'cash-crusaders-brackenfell-corner-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cuthill''s Hair Design is a hair salon on Panorama Road in Panorama, offering cuts, styling, colour and keratin treatments, including specialist curly-hair services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 10:00-17:00, Sat 09:30-13:00, Sun Closed'
WHERE slug = 'cuthills-hair-design-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Brackenfell Corner is a pharmacy and health retailer inside Brackenfell Corner Shopping Centre, with an in-store clinic offering additional healthcare services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.dischem.co.za/brackenfell-corner-shopping-centre", "https://www.recomed.co.za/clinic/cape-town/dis-chem-brackenfell/24993/"]'
WHERE slug = 'dis-chem-brackenfell-corner-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Neovision Brackenfell Corner is an optometry practice inside Brackenfell Corner Shopping Centre, offering eye examinations, glaucoma screening and a range of prescription eyewear.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=400160", "https://www.neovision.co.za/stores/brackenfell-corner/"]'
WHERE slug = 'neovision-brackenfell-corner-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Planet Fitness Brackenfell is a gym at the corner of Bottelary Road and Cecil Morgan Drive, trading from early morning on weekdays into the evening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat 07:00-18:00, Sun 07:00-16:00'
WHERE slug = 'planet-fitness-brackenfell-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Premier Hardware is a hardware supplier in Brackenfell Industria, supplying fittings including shower and bathroom hardware manufactured from brass, zinc and copper alloys.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00'
WHERE slug = 'premier-hardware-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Brackenfell Corner is a supermarket inside Brackenfell Corner Shopping Centre, trading extended hours seven days a week including public holidays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-20:00, Sun 08:00-20:00'
WHERE slug = 'spar-brackenfell-corner-brackenfell' AND description_enriched_at IS NULL;
