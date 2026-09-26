UPDATE businesses
SET description = 'BP Wavecrest Motors is a 24-hour fuel station on the corner of Dennegeur Avenue and Agulhas Street in Strandfontein Village, Cape Town, offering round-the-clock fuel and forecourt services.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.fueldirectory.co.za/listing.php?listings_id=5356", "https://vymaps.com/ZA/BP-Wavecrest-Motors-957846340978512/", "https://map.bp.com/en-ZA/ZA/gas-station/strandfontein-village/wavecrest-motors/STRADENA1R"]'
WHERE slug = 'bp-wavecrest-motors-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelsig Secondary School is a public secondary school on Spine Road in Tafelsig, Mitchells Plain, serving the local community with a full secondary education programme.',
    description_enriched_at = datetime('now')
WHERE slug = 'tafelsig-secondary-school-tafelsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Village Harbour & Pizza House is a casual eatery in Strandfontein Village specialising in wood-fired pizza and fresh fish and chips, with sit-down, takeaway and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 15:00-21:00, Tue-Thu 12:00-21:00, Fri-Sat 11:00-21:00, Sun Closed',
    source_urls = '["https://heypizza.co.za/01854024/The_Village_Harbour_&_Pizza_House", "https://www.facebook.com/villageharbourandpizzahouse/", "https://restaurants-in-cape-town.co.za/restaurants/the-village-harbour-pizza-house/"]'
WHERE slug = 'village-harbour-and-pizza-house-strandfontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness Westgate Mall is a gym inside Westgate Mall in Westgate, Mitchells Plain, offering newly upgraded cardio and weights areas as part of the wider Zone Fitness chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:30-21:00, Fri 05:30-20:00, Sat-Sun 07:00-15:00, Public holidays 07:00-15:00',
    source_urls = '["https://zonefitness.co.za/westgate/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1976690", "https://zonefitness.co.za/westgate-timetables/"]'
WHERE slug = 'zone-fitness-westgate-mall-westgate' AND description_enriched_at IS NULL;
