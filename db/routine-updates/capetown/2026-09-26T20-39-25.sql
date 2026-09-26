UPDATE businesses
SET description = 'Kleinberg Primary School is a public, no-fee primary school in Ocean View serving Grade R to Grade 7 learners, with a large enrolment of over 1,000 pupils.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/ocean-view/primary-school/kleinberg-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/KLEINBERG_PRIMARY_SCHOOL/7239", "https://schoolsdigest.co.za/listings/kleinberg-primary-school/"]'
WHERE slug = 'kleinberg-primary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masiphumelele High School is a public, no-fee secondary school in Masiphumelele offering the NSC (CAPS) curriculum from Grade 8 to Grade 12.',
    description_enriched_at = datetime('now')
WHERE slug = 'masiphumelele-high-school-masiphumelele' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ocean View Secondary School is a public secondary school in Ocean View offering the NSC (CAPS) curriculum, with over 1,300 learners enrolled.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.school-register.co.za/school/ocean-view-secondary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/ocean-view-secondary-school?to=place.ChIJM7WdNERrzB0ReTK5YKZFJso", "https://www.mycomlink.co.za/organisation.php?i=137"]'
WHERE slug = 'ocean-view-secondary-school-ocean-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Station & Bakery is a café within The Village Hub in Scarborough, a food destination trading since 2015, serving fresh coffee and baked goods alongside the Hub''s deli, restaurant and ice-cream vendors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thevillagehub.co.za/coffee-station/", "https://www.findmy.co.za/food/category-detail/the-hub-caf-/22653", "https://wanderlog.com/place/details/3562567/village-hub-scarborough"]'
WHERE slug = 'the-coffee-station-and-bakery-scarborough' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ukhanyo Primary School is a public primary school in Masiphumelele serving Grade R to Grade 7 learners aged 6 to 14, with dedicated learning labs for English, Mathematics and Science.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/10689987_3", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/UKHANYO_PRIMARY_SCHOOL/7925", "https://www.westerncape.gov.za/education/facility/ukhanyo-primary-school", "https://masicorp.org/education/ukhanyo-primary-school-and-masiphumelele-inspire-uk-school/"]'
WHERE slug = 'ukhanyo-primary-school-masiphumelele' AND description_enriched_at IS NULL;
