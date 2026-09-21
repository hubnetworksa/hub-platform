UPDATE businesses
SET description = 'Azura Health and Beauty is a health and beauty spa in Westlake Shopping Centre, offering skincare and beauty treatments in Westlake.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:30, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'azura-health-and-beauty-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BOA Beauty Bar is a beauty and hair salon on the ground floor of Westlake Shopping Centre, offering hair, beauty and grooming services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:30-18:30, Sat-Sun 09:00-18:30'
WHERE slug = 'boa-beauty-bar-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Black Oak Computers is a computer and IT hardware store in Sunnydale selling desktops, laptops, notebooks, tablets and components, and providing hardware and software support with Microsoft and ESET partner accreditation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/black-oak-computers", "https://blackoakcomputers.co.za/", "https://www.facebook.com/BlackOakComputers"]'
WHERE slug = 'black-oak-computers-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cattle Baron Westlake is a branch of the Cattle Baron steakhouse chain, on the 1st floor of Westlake Shopping Centre, serving grills, steaks and family dining.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-21:30',
    source_urls = '["https://www.cattlebaron.co.za/cattle-baron-westlake/", "https://www.facebook.com/CattlebaronWestlake/", "https://www.dining-out.co.za/md/Cattle-Baron-Westlake/11644"]'
WHERE slug = 'cattle-baron-westlake-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chapman''s Hardware is a hardware store on Irene Way in Sunnydale, stocking general hardware, tools, paint and home improvement supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun 09:00-12:00',
    source_urls = '["https://za.africabz.com/western-cape/chapmans-hardware-45222", "https://2pos.co.za/2/17964", "https://valleycommunity.co.za/businessdirectory/chapmans-hardware/", "https://www.chapmanshardware.co.za/"]'
WHERE slug = 'chapmans-hardware-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chas Everitt Cape Town South is a franchise branch of the Chas Everitt International property group, based in Westlake Shopping Centre, offering residential property sales and letting services and registered with the PPRA.',
    description_enriched_at = datetime('now')
WHERE slug = 'chas-everitt-cape-town-south-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy, health, beauty and homeware retailer located in Westlake Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-19:00, Sun and public holidays 09:00-13:00'
WHERE slug = 'clicks-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio GO Westlake is a click-and-collect pizzeria of the Col''Cacchio chain, based in Westlake Shopping Centre and offering pizza for collection and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:30-21:30'
WHERE slug = 'colcacchio-go-westlake-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dentalwize Sun Valley is a dental practice at the corner of Longboat Road and Ou Kaapse Weg in Sun Valley, offering general dentistry with after-hours emergency care.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/15702443_2", "https://www.cybo.com/ZA-biz/dentalwize-sun-valley", "https://dentalwize.com/sun-valley/"]'
WHERE slug = 'dentalwize-sun-valley-sun-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fourways Veterinary Clinic is an appointment-based veterinary clinic on Jangada Street in Sun Valley, providing small animal healthcare.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:40-18:20, Sat 08:00-13:00, Sun 10:00-11:00',
    source_urls = '["https://www.infurmation.co.za/vet/fourways-veterinary-clinic/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=196942", "https://fourwaysvetcapetown.com/contactus/"]'
WHERE slug = 'fourways-veterinary-clinic-sun-valley' AND description_enriched_at IS NULL;
