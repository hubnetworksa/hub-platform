UPDATE businesses
SET description = 'Amazing Store is a general retailer inside Colorado City Centre offering kitchenware, toys and snacks to shoppers in Colorado Park, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:30, Fri 09:00-20:00, Sat 09:00-18:00, Sun 09:00-13:30'
WHERE slug = 'amazing-store-colorado' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Crossroads 1 Clinic is a City of Cape Town primary healthcare facility in the Nyanga Health District, serving the Crossroads community with primary care services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf", "https://www.westerncape.gov.za/facility/crossroads-1-clinic", "https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Crossroads%201%20Clinic"]'
WHERE slug = 'crossroads-1-clinic-crossroads' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hood Road Medical Centre is a multi-practice medical centre in Crawford that has served Sunnyside, Belgravia, Rondebosch East and the greater Rylands and Southern Suburbs area for over a decade, offering physiotherapy, psychology, speech therapy and occupational therapy alongside its general practice and dental rooms.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-18:00, Wed-Thu 09:00-19:00, Fri 09:00-18:00, Sat 09:00-13:30, Sun Closed',
    source_urls = '["https://hoodmed.co.za/", "https://www.fresha.com/lvp/hood-road-medical-centre-hood-road-cape-town-15ZoPE", "https://heyhealthclinics.co.za/01297807/Hood_Road_Medical_Centre"]'
WHERE slug = 'hood-road-medical-centre-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Usave Colorado is a discount grocery store on the corner of Highlands Drive and Weltevreden Parkway in Colorado Park, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'usave-colorado-colorado' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vitacare Pharmacy is a pharmacy operating inside the Kromboom Medi-Centre in Crawford, offering dispensing and other retail pharmacy services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'vitacare-pharmacy-crawford' AND description_enriched_at IS NULL;
