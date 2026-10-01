-- Job 4: description enrichment sweep -- full backlog (10 businesses)
UPDATE businesses
SET description = 'Agrimark Philippi is an agricultural and farming supplies retailer on Olieboom Road, serving the Philippi farming community as part of the wider Agrimark retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.agrimark.co.za/store/agrimark-philippi", "https://www.cybo.com/ZA-biz/agrimark-philippi", "https://www.kimbino.co.za/stores/philippi-agrimark-olieboom-rd/"]'
WHERE slug = 'agrimark-philippi-horticultural' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bloomberg Gym is a fitness and health club on the 1st floor of Ottery Centre, offering gym facilities and group exercise classes to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 06:00-21:00, Fri 06:00-20:00, Sat 08:00-16:00, Sun 10:00-14:00'
WHERE slug = 'bloomberg-gym-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hazeldene Primary School is a public, no-fee primary school in Portland, Mitchells Plain, educating close to 900 learners from the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-15:30, Sat-Sun Closed',
    source_urls = '["https://www.westerncape.gov.za/education/facility/hazeldene-primary-school", "https://schoolsdigest.co.za/listings/hazeldene-primary-school/", "https://hazeldeneps.co.za/contact-us/"]'
WHERE slug = 'hazeldene-primary-school-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jumbo Cash & Carry in Ottery is a bulk wholesale store, part of the Massmart-owned Jumbo chain, stocking groceries, household goods and general merchandise for independent traders and the public.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/jumbo-cash-and-carry/old-ottery-road-ottery", "https://www.eeziads.co.za/p/504175/jumbo-cash-&-carry-ottery", "https://www.sayellow.com/view/south-africa/jumbo-cash-and-carry-ottery-in-cape-town"]'
WHERE slug = 'jumbo-cash-and-carry-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philippi Groente Verpakkers is a fresh produce packing and distribution business in the Philippi Horticultural Area, supplying fruit and vegetables to retailers and traders while also selling directly to the public from its premises.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 07:00-13:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/schaapkraal/vegetable-farmers/philippi-groente-verpakkers", "https://www.netpages.co.za/Cape+Town/Philippi+Groente+Verpakkers-122703.html", "https://www.dnb.com/business-directory/company-profiles.philippi_groente_verpakkers_(pty)_ltd.67d52d599370c036bbe7a68624d1eff1.html"]'
WHERE slug = 'philippi-groente-verpakkers-philippi-horticultural' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portland Secondary School is a public secondary school serving the Portland area of Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'portland-secondary-school-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Ottery Road is a self-storage facility on John Tyres Close offering individual storage units for households and businesses in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-ottery-road-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Springfield Road is a self-storage facility on Springfield Street offering individual storage units for households and businesses in Ottery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-springfield-road-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Usave Ottery is a budget supermarket in the Shoprite Holdings group, stocking everyday grocery essentials at low prices for the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-14:00',
    source_urls = '["https://southafricafirm.com/western-cape/usave-ottery-46380", "https://www.africabizinfo.com/ZA/usave-ottery-021-703-5042", "https://www.tiendeo.co.za/stores/cape-town/usave-ottery-road/61994"]'
WHERE slug = 'usave-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Ottery Centre is a branch of the Wimpy restaurant chain inside Ottery Centre, serving breakfasts, burgers and other casual family dining fare.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:30-15:00'
WHERE slug = 'wimpy-ottery-centre-ottery' AND description_enriched_at IS NULL;
