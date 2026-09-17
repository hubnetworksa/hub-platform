UPDATE businesses
SET description = 'TopT is a budget-focused tile and bathroomware retailer, part of the Italtile Group, stocking floor and wall tiles, taps, basins, paint and blinds at its store in Madiba Park Shopping Centre, Seshego.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-14:00, Sun 09:00-13:00',
    source_urls = '["https://www.topt.co.za/storefinder/store/seshego", "https://www.waze.com/live-map/directions/za/lp/polokwane/topt-seshego", "https://www.topt.co.za/"]'
WHERE slug = 'topt-seshego' AND description_enriched_at IS NULL;
