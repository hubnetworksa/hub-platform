UPDATE businesses
SET description = 'AVBOB Khayelitsha is a funeral parlour and insurance branch of the AVBOB Mutual Assurance Society, offering funeral policies and funeral services to the Ilitha Park community in Khayelitsha.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:30-12:00, Sun Closed',
    source_urls = '["https://www.avbob.co.za/our-branches/branch-details?loc=AVBOB+Funeral+Service+Khayelitsha&locationid=ed34c35f-6ebf-4f0c-aa16-4acdab34ac17", "https://nfda.org.za/business-directory/775/avbob-khayelitsha/", "https://openhours-southafrica.com/en/khayelitsha/avbob-funeral-parlour-52"]'
WHERE slug = 'avbob-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets Richmond Corner is a pet store in Richmond Corner shopping centre, Richwood.',
    description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Barrs Pharmaceutical Industries is a Level 1 BEE South African-owned pharmaceutical manufacturer based in Ndabeni, producing cost-effective pharmaceutical products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat-Sun Closed'
WHERE slug = 'barrs-pharmaceutical-industries-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beacon Sweets and Chocolates is a South African confectionery manufacturer founded in 1931, with a production facility on Inyoni Street in Ndabeni, Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/beacon-sweets-chocolates-pty-ltd-197123", "https://www.cylex.net.za/company/beacon-sweets-and-chocolates--pty--ltd-15454175.html", "https://www.sajr.co.za/sweet-memories-of-a-beacon-of-a-business/"]'
WHERE slug = 'beacon-sweets-and-chocolates-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bluefin Restaurant is a seafood restaurant in Plattekloof Village Shopping Centre, Plattekloof.',
    description_enriched_at = datetime('now')
WHERE slug = 'bluefin-restaurant-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank Grand Central is a bank branch in Grand Central Shopping Centre, Eerste River, offering everyday banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-12:00, Sun Closed'
WHERE slug = 'capitec-bank-grand-central-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Car Smart Service Centre is an independent vehicle service and repair centre in Ndabeni, founded in 2009, and is a Tata approved service centre and independent Renault specialist registered with the Retail Motor Industry organisation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/16204768_3", "https://www.snupit.co.za/cape-town/ndabeni/car-smart-service-centre/371304", "https://car-smart.co.za/"]'
WHERE slug = 'car-smart-service-centre-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cattle Baron Plattekloof is a steakhouse in Plattekloof Shopping Centre that has served the area for more than 20 years, with a buffet offered on Wednesdays and Fridays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:30-15:30 & 17:30-23:30, Fri 11:30-15:30 & 17:30-24:00, Sat 17:30-24:00, Sun 11:30-15:30 & 18:00-22:30'
WHERE slug = 'cattle-baron-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Eerste River Mall is a pharmacy and health, beauty and homeware retailer in Eerste River Mall, Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-eerste-river-mall-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Gugulethu Square is a pharmacy and health, beauty and homeware retailer in Gugulethu Square shopping centre, Gugulethu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;
