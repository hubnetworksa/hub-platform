-- Job 4: description enrichment sweep, batch of 6 (full backlog)
UPDATE businesses
SET description = 'Lavender Hill Clinic is a City of Cape Town municipal health facility, providing primary healthcare services to residents of Lavender Hill.',
    description_enriched_at = datetime('now')
WHERE slug = 'lavender-hill-clinic-lavender-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lavender Hill Community Centre is a City of Cape Town municipal venue at the corner of Hek Street and Grindle Avenue, hired out for weddings, ceremonies, and year-end functions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-recreational-facilities/Community%20centres/Lavender%20Hill%20Community%20Centre", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Rec_and_Parks_Facility_Contact_List.pdf", "https://community-services.blaauwberg.net/halls-venue-hire/halls-and-venues-for-hire-cape-town/Lavender-Hill-Community-Centre"]'
WHERE slug = 'lavender-hill-community-centre-lavender-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lavender Hill High School is a public co-educational secondary school in Lavender Hill, established in 1978 and teaching in both Afrikaans and English. It offers subjects including History, Geography, Consumer Studies and Computer Application Technology, alongside sports facilities such as a hockey astroturf, rugby field and soccer astroturf.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/lavender-hill-high-school/", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/lavender-hill-high-school", "https://en.wikipedia.org/wiki/Lavender_Hill_High_School"]'
WHERE slug = 'lavender-hill-high-school-lavender-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lentegeur Clinic is a City of Cape Town primary health care facility at the corner of Merrydale and Melkbos Roads, serving the Lentegeur area of Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30',
    source_urls = '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Lentegeur%20Clinic", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf", "https://d7.westerncape.gov.za/facility/lentegeur-clinic"]'
WHERE slug = 'lentegeur-clinic-lentegeur' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lentegeur Hospital is the largest of the Western Cape''s four level-2 mental health hospitals, with 722 inpatient beds across Child and Adolescent Psychiatry, Forensic Psychiatry, Intellectual Disability Services and General Adult Psychiatry units. It also serves as a psychiatric training facility for the Universities of Cape Town and Stellenbosch.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.westerncape.gov.za/health-wellness/facility/lentegeur-hospital", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=58779", "https://health.uct.ac.za/department-psychiatry/clinical-services/lentegeur-hospital"]'
WHERE slug = 'lentegeur-hospital-lentegeur' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrydale Primary School is a no-fee public primary school in Lentegeur, Mitchells Plain, that has served the community for more than 40 years. As of a 2023 survey it had around 999 learners and 29 educators, and it stopped offering Grade 8 in 2013 as local high schools took over that intake.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/merrydale-primary-school/", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/merrydale-primary-school", "https://plainsman.co.za/news/2023-06-14-merrydale-primary-looks-back-on-more-than-40-years/"]'
WHERE slug = 'merrydale-primary-school-lentegeur' AND description_enriched_at IS NULL;
