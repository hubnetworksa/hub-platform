-- Job 4: description enrichment sweep (5 businesses, clears the entire backlog)

UPDATE businesses
SET description = 'Kleinberg Primary School is a no-fee, quintile 4 public primary school in Ocean View, serving well over 1,000 learners across the primary phase.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/ocean-view/primary-school/kleinberg-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/KLEINBERG_PRIMARY_SCHOOL/7239", "https://schoolsdigest.co.za/listings/kleinberg-primary-school/"]'
WHERE slug = 'kleinberg-primary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masiphumelele High School is a no-fee, quintile 3 public secondary school offering grades 8 to 12 in Masiphumelele.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-high-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Secondary School is a public secondary school in Ocean View offering the National Senior Certificate (CAPS) curriculum to more than 1,300 learners.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.school-register.co.za/school/ocean-view-secondary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/ocean-view-secondary-school?to=place.ChIJM7WdNERrzB0ReTK5YKZFJso", "https://schoolsdigest.co.za/listings/ocean-view-secondary-school/"]'
WHERE slug = 'ocean-view-secondary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Station & Bakery is a coffee and bakery counter inside The Village Hub in Scarborough, serving freshly brewed coffee and freshly baked pastries alongside the Hub''s deli and grocery store.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-coffee-station-and-bakery-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhanyo Primary School is a no-fee public primary school in Masiphumelele offering Grade R to Grade 7 to the local township''s children.',
    description_enriched_at = datetime('now')
WHERE slug = 'ukhanyo-primary-school-masiphumelele' AND description_enriched_at IS NULL;
