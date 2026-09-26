-- Job 4: description enrichment sweep (5 businesses -- full backlog this run)

UPDATE businesses
SET description = 'Kleinberg Primary School is a public, no-fee primary school in Ocean View with roughly 1,100 learners and a staff of more than 30 teachers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/ocean-view/primary-school/kleinberg-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/KLEINBERG_PRIMARY_SCHOOL/7239", "https://schoolsdigest.co.za/listings/kleinberg-primary-school/"]'
WHERE slug = 'kleinberg-primary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masiphumelele High School is a public, no-fee secondary school in Masiphumelele offering grades 8 to 12.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-high-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Secondary School is a public secondary school in Ocean View offering the NSC (CAPS) curriculum, with a teaching staff of more than 40.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.school-register.co.za/school/ocean-view-secondary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/ocean-view-secondary-school?to=place.ChIJM7WdNERrzB0ReTK5YKZFJso", "https://schoolsdigest.co.za/listings/ocean-view-secondary-school/"]'
WHERE slug = 'ocean-view-secondary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Station & Bakery is a coffee counter and bakery inside The Village Hub in Scarborough, serving coffee and freshly baked croissants and muffins for a quick stop.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:30-17:30 (summer), 08:00-17:30 (winter)'
WHERE slug = 'the-coffee-station-and-bakery-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhanyo Primary School is a public, no-fee primary school in Masiphumelele, teaching learners from Grade R to Grade 7.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/10689987_3", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/UKHANYO_PRIMARY_SCHOOL/7925", "https://www.westerncape.gov.za/education/facility/ukhanyo-primary-school", "https://schoolsdigest.co.za/listings/ukhanyo-primary-school/"]'
WHERE slug = 'ukhanyo-primary-school-masiphumelele' AND description_enriched_at IS NULL;
