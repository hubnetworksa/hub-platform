-- Job 4: description enrichment sweep, batch 2 of 2 (5 records)
UPDATE businesses
SET description = 'Pick n Pay Welgemoed is a supermarket inside Welgemoed Plaza, on the corner of Kommissaris and Sluysken Street, Welgemoed.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:30-21:00, Sun 07:00-21:00'
WHERE slug = 'pick-n-pay-welgemoed-plaza-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Restore Dental Studio is a dental practice in Panorama Healthcare Centre, Panorama, offering general dentistry including examinations, fillings, gum treatment and dental care for children and adults.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1249493984931840/restore-dental-studio/cape-town/dental-care", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=223591", "https://www.restoredentalstudio.co.za/"]'
WHERE slug = 'restore-dental-studio-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas Okavango Crossing is a gourmet burger restaurant inside Okavango Crossing shopping centre, Kraaifontein, offering dine-in and takeaway burgers, chicken wings and ribs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-22:00, Sun 11:00-21:00'
WHERE slug = 'rocomamas-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza Okavango Crossing is a pizza restaurant inside Okavango Crossing shopping centre, Kraaifontein, offering sit-down, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-21:00',
    source_urls = '["https://romanspizza.co.za/store-locator/7137a1a8-a45d-41fa-adb8-9abd43d70327", "https://za.africabz.com/western-cape/romans-pizza-okavango-73809", "https://www.tiendeo.co.za/stores/Langeberg-Ridge/romans-pizza-langeberg-road/35639"]'
WHERE slug = 'romans-pizza-okavango-crossing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness Kraaifontein is a gym inside Brighton Square Shopping Centre, offering a cardio and weights section plus group fitness classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat-Sun 07:00-15:00'
WHERE slug = 'zone-fitness-brighton-square-kraaifontein' AND description_enriched_at IS NULL;
