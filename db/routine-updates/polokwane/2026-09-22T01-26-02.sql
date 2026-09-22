-- Job 4: description enrichment sweep, checkpoint 2/3 (10 businesses)
UPDATE businesses
SET description = 'Italtile Polokwane is a tile, bathroomware and home-improvement retailer in Baobab Gardens, Thornhill Estate.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:30, Wed 08:30-17:30, Thu-Fri 08:00-17:30, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'italtile-polokwane-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jaguar Land Rover Polokwane is a dealership in Baobab Gardens, Thornhill Estate, offering new and used vehicle sales, service and parts for the Jaguar and Land Rover brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-18:00, Fri 07:30-17:30, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'jaguar-land-rover-polokwane-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kay Medical Centre is a multi-practitioner medical facility in Polokwane Central, housing a number of specialist practices under one roof.',
    description_enriched_at = datetime('now')
WHERE slug = 'kay-medical-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'LEDA Lebowakgomo is a branch of the Limpopo Economic Development Agency, providing enterprise development, industrial investment and business support services to the Capricorn District from its Lebowakgomo offices.',
    description_enriched_at = datetime('now')
WHERE slug = 'leda-lebowakgomo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Limpopo Toyota is a Toyota dealership on the corner of Munnik and Veldspaat Street in Thornhill, offering new and used vehicle sales, servicing, parts and finance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://www.cars.co.za/groups/CFAO-Mobility/Limpopo-Toyota/2902/", "https://za.africabz.com/limpopo/limpopo-toyota-35420", "https://www.openhours-southafrica.com/en/polokwane/limpopo-toyota-automark"]'
WHERE slug = 'limpopo-toyota-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Makgongoana Secondary School is a public secondary school in Ga-Mothapo village near Sovenga, within the Capricorn South education district.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/makgongoana/", "https://www.callupcontact.com/b/Public_High_Secondary_Schools/Makgongoana_High_School/19180", "https://www.school-register.co.za/school/makgongoana/"]'
WHERE slug = 'makgongoana-secondary-school-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Metropolitan Polokwane (Market Street) is a Metropolitan Life branch in Polokwane Central, offering long-term insurance and financial-planning products from its Market Street office.',
    description_enriched_at = datetime('now')
WHERE slug = 'metropolitan-market-street-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palm Health Medi Centre is a general practice in Palm Centre, Moregloed, offering women''s and men''s health, child healthcare, 4D ultrasound and occupational health services, operating since 2013.',
    description_enriched_at = datetime('now')
WHERE slug = 'palm-health-medi-centre-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pentagon College is a private further-education college in Mankweng, next to the University of Limpopo, offering courses in fields including business management, and civil, electrical and mechanical engineering.',
    description_enriched_at = datetime('now')
WHERE slug = 'pentagon-college-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Quest Staffing Solutions is a white-collar recruitment and staffing agency in Bendor, part of the Quest Group under Adcorp Holdings, placing permanent and flexible staff for South African employers.',
    description_enriched_at = datetime('now')
WHERE slug = 'quest-staffing-solutions-bendor' AND description_enriched_at IS NULL;
