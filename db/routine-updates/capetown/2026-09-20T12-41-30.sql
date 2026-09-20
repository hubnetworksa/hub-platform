UPDATE businesses
SET description = 'Zone Fitness is a gym on the 2nd floor of Capricorn Square, Muizenberg, offering group and individual fitness training.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:30-21:00, Fri 05:30-20:00, Sat-Sun 07:00-15:00'
WHERE slug = 'zone-fitness-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness is a gym inside Cape Quarter, De Waterkant, offering group and individual fitness training.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 06:00-21:00, Fri 06:00-20:00, Sat-Sun 07:00-15:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://zonefitness.co.za/cape-quarter-timetable/"]'
WHERE slug = 'zone-fitness-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness is a gym on the 2nd floor of Rondebosch Main Centre, offering group and individual fitness training to the Rondebosch community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 06:00-21:00, Fri 06:00-20:00, Sat-Sun 07:00-15:00',
    source_urls = '["https://www.rondeboschmain.co.za/divi_overlay/the-zone-fitness/", "https://www.cybo.com/ZA-biz/zone-fitness-rondebosch", "https://zonefitness.co.za/rondebosch-timetables/"]'
WHERE slug = 'zone-fitness-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zoo Park Motors is a Shell fuel station in Kraaifontein with a convenience shop and car wash, open 24 hours.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.yellosa.co.za/location/kraaifontein/2", "https://find.shell.com/za/fuel/10042563-zoo-park-motors/en_ZA"]'
WHERE slug = 'zoo-park-motors-kraaifontein' AND description_enriched_at IS NULL;
