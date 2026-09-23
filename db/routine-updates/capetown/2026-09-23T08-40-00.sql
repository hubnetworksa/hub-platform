-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)
UPDATE businesses
SET description = 'Chamomile Farming is a poultry and vegetable farm in the Philippi Horticultural Area, supplying retailers such as Shoprite and Checkers with produce including coriander, chillies, lettuce and peppers in the warmer months and spinach, cabbage and turnips in the cooler months.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://chamomilefarming.co.za/", "https://www.facebook.com/chamomilefarmingsa/", "https://iol.co.za/capeargus/news/2022-01-19-first-generation-farmers-expand-their-egg-farming-operation-in-philippi/"]'
WHERE slug = 'chamomile-farming-philippi-horticultural' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy Ottery is a retail pharmacy inside Ottery Hyper (Pick n Pay Hyper), dispensing prescription and over-the-counter medicines in Ottery.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-pharmacy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Durrheim Post Office is a South African Post Office branch inside Charlesville Mall, providing postal and mail services to Matroosfontein and the surrounding area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-16:30, Wed 08:30-16:30, Thu-Fri 08:00-16:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'durrheim-post-office-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fairfield Meat Centre Ottery is a Halaal butchery counter inside Food Lover''s Market at Ottery Hyper, part of a long-established Halaal meat retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'fairfield-meat-centre-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Holy Trinity RC Primary School is a public Roman Catholic primary school on St Dominic Street, Matroosfontein, with around 786 learners and 25 teachers, part of the Western Cape Education Department''s Metro North district.',
    description_enriched_at = datetime('now')
WHERE slug = 'holy-trinity-rc-primary-school-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jafmed Pharmacy is a family-owned pharmacy in Ottery dispensing acute and chronic prescription medicine, offering a delivery service and contracted to all major medical aids.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-22:00, Sat 09:00-22:00, Sun Closed',
    source_urls = '["https://jafmed.co.za/", "https://www.thinklocal.co.za/biz/jafmed-pharmacy-cape-town", "https://www.openhours-southafrica.com/en/cape-town/jafmed-pharmacy"]'
WHERE slug = 'jafmed-pharmacy-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Marian RC Secondary School is a public Roman Catholic secondary school on St Dominic Street, Matroosfontein, classified as a quintile 4 Section 21 school responsible for its own stationery, textbook and maintenance budgets.',
    description_enriched_at = datetime('now')
WHERE slug = 'marian-rc-secondary-school-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Matroosfontein Primary School is a public primary school on Yorkweg, Matroosfontein, with around 507 learners and 21 teachers, classified as a quintile 4 fee-paying school.',
    description_enriched_at = datetime('now')
WHERE slug = 'matroosfontein-primary-school-matroosfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s Ottery is a PERi-PERi chicken restaurant with a drive-thru inside Ottery Hyper on Servitude Road, Ottery.',
    description_enriched_at = datetime('now')
WHERE slug = 'nandos-ottery' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Opulence Events & Function Venue is an event and function venue in Schaapkraal, Philippi Horticultural Area, hosting weddings and private functions.',
    description_enriched_at = datetime('now')
WHERE slug = 'opulence-events-function-venue-philippi-horticultural' AND description_enriched_at IS NULL;
