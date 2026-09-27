-- Job 4: description enrichment sweep, batch 3 of 3 (1 business) -- clears this run's backlog
UPDATE businesses
SET description = 'Zonnebloem Boys Primary School is a public primary school in Zonnebloem on Cambridge Street, dating back to 1858 and one of the oldest schools in Cape Town, serving boys from Grade R to Grade 7.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/zonnebloem-boys-primary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/zonnebloem-boys-primary-school?to=place.ChIJlb2G9XZdzB0RFf7mdfmvJsQ", "https://zonnebloembps.co.za/contact", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/zonnebloem-boys-primary-school"]'
WHERE slug = 'zonnebloem-boys-primary-school-zonnebloem' AND description_enriched_at IS NULL;
