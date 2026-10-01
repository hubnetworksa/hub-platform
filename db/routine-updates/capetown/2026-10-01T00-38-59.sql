UPDATE businesses
SET description = 'Debonairs Pizza in Avonwood Square is a pizza takeaway outlet of the national Debonairs Pizza chain, serving pizza, pasta, chicken wings, submarine sandwiches and desserts in Elsies River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-20:00, Fri-Sat 08:30-21:00, Sun 09:00-20:00',
    source_urls = '["https://foursquare.com/v/debonairs-pizza/5cc745e0c8b2fb002c847167", "https://za.readymap.info/4/37244", "https://app.debonairspizza.co.za/restaurants/avonwood"]'
WHERE slug = 'debonairs-pizza-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eastridge Clinic is a public healthcare clinic serving the Eastridge area of Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'eastridge-clinic-eastridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SIK Liquidation Centre is a discount retailer in Elsies River Industrial stocking electronics, furniture, clothing and household goods at reduced prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun 08:00-14:00',
    source_urls = '["https://legumguide.co.za/sik-liquidation-centre-10110573181593057513/", "https://za.africabz.com/western-cape/sik-liquidation-centre-212109", "https://all-opening-hours.co.za/02059449/Sik_liquidation_centre"]'
WHERE slug = 'sik-liquidation-centre-elsies-river' AND description_enriched_at IS NULL;
