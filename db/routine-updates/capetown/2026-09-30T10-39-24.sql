-- Job 4: description enrichment sweep (batch 1 of 2, 10 records)
UPDATE businesses
SET description = 'Ackermans is a South African value-fashion retailer selling clothing, footwear and homeware, with a branch in Mitchells Plain Town Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:30, Sun 09:00-15:00'
WHERE slug = 'ackermans-town-centre-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a South African health, beauty and pharmacy retail chain, with a branch inside Khayelitsha Mall (KCT Mall) offering pharmacy services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'clicks-kct-mall-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a South African health, beauty and pharmacy retail chain, with a branch at Sanbury Square Shopping Centre in Eerste River offering pharmacy services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.tiendeo.co.za/stores/eerste-river/clicks-sanbury-square-shop-sanbury-square-shopping-centre/75603", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1784786", "https://clicks.co.za/store/Sanbury-Square/2007"]'
WHERE slug = 'clicks-sanbury-square-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a South African health, beauty and pharmacy retail chain, with a branch inside Mitchells Plain Town Centre offering pharmacy services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun 09:00-13:00'
WHERE slug = 'clicks-town-centre-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a South African value fashion and homeware retail chain, with a branch inside Khayelitsha Mall.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-price-khayelitsha-mall-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Much Asphalt is the largest commercial asphalt producer in Southern Africa, and this Eerste River plant in Penhill serves as its head office, supplying hot and cold asphalt products to the road construction industry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30',
    source_urls = '["https://www.sayellow.com/view/south-africa/much-asphalt-eerste-river-in-cape-town", "https://tlb.co.za/company/much-asphalt-eerste-river/", "https://www.muchasphalt.com/about-us/locations/eerste-river/"]'
WHERE slug = 'much-asphalt-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a South African value retailer selling clothing, footwear, homeware and cellular products, with a branch at Sanbury Square Shopping Centre in Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'pep-sanbury-square-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay is a South African supermarket chain, with a branch at Sanbury Square Shopping Centre in Eerste River selling groceries and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-18:00'
WHERE slug = 'pick-n-pay-sanbury-square-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Prima Hire Builders Plant hires out building and construction plant and machinery, including TLBs, from its yard in Eerste River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:45, Sat 07:30-11:45, Sun Closed',
    source_urls = '["https://www.cylex.net.za/company/prima-hire-builders-plant-23702210.html", "https://tlb.co.za/company/prima-hire-builders-plant/", "https://www.yellosa.co.za/company/171157/prima-hire-builders-plant"]'
WHERE slug = 'prima-hire-builders-plant-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a South African supermarket chain, with a branch in Mitchells Plain Town Centre selling groceries and household goods, plus an attached liquor store.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:00-18:00, Tue 08:00-17:00, Wed-Fri 08:00-18:30, Sat 08:00-18:00, Sun 07:00-17:00'
WHERE slug = 'shoprite-town-centre-mitchells-plain' AND description_enriched_at IS NULL;
