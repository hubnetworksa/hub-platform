UPDATE businesses
SET description = 'Kleinberg Primary School is a public, no-fee primary school in Ocean View, teaching Grade R to Grade 7 to around 1,100 learners.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/ocean-view/primary-school/kleinberg-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/KLEINBERG_PRIMARY_SCHOOL/7239", "https://schoolsdigest.co.za/listings/kleinberg-primary-school/"]'
WHERE slug = 'kleinberg-primary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masiphumelele High School is a public secondary school in Masiphumelele offering Grade 8 to Grade 12 education, including subjects such as History, to around 1,400 learners.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-high-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Secondary School is a public secondary school in Ocean View offering the NSC curriculum to around 1,300 learners across Grades 8 to 12.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.school-register.co.za/school/ocean-view-secondary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/ocean-view-secondary-school?to=place.ChIJM7WdNERrzB0ReTK5YKZFJso", "https://www.mycomlink.co.za/organisation.php?i=137"]'
WHERE slug = 'ocean-view-secondary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Station & Bakery is a café inside The Village Hub in Scarborough, serving freshly brewed coffee alongside home-baked pastries, croissants and muffins.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-17:30'
WHERE slug = 'the-coffee-station-and-bakery-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhanyo Primary School is a public primary school in Masiphumelele teaching Grade R to Grade 7, and is the only primary school in the area to offer isiXhosa as a first-language subject.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/10689987_3", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/UKHANYO_PRIMARY_SCHOOL/7925", "https://www.westerncape.gov.za/education/facility/ukhanyo-primary-school", "https://masicorp.org/education/ukhanyo-primary-school-and-masiphumelele-inspire-uk-school/"]'
WHERE slug = 'ukhanyo-primary-school-masiphumelele' AND description_enriched_at IS NULL;
