-- Job 4: description enrichment sweep (4 businesses, entire backlog cleared this run)

UPDATE businesses
SET description = 'Image Travel and Tours is a Polokwane travel agency offering flight bookings, cruise holiday packages to destinations such as the Mediterranean, Caribbean and Alaska, and safari and hunting tour packages alongside European tour itineraries.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://imagetravel.co.za/", "https://www.yellowpages.co.za/business/17070097_2", "https://imagetravel.co.za/services/"]'
WHERE slug = 'image-travel-and-tours-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mogau Traveling Agency runs shuttle and tour packages out of Polokwane, including day trips to destinations such as Sun City and Mpumalanga, using its own fleet of vehicles for group and individual travel.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mogautravelingagency.co.za/home", "https://www.facebook.com/p/Mogaus-traveling-agency-100083246323166/", "https://www.facebook.com/p/Mogaus-Shuttle-en-Tours-100068992188298/"]'
WHERE slug = 'mogau-traveling-agency-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalapeng Mall@Lebo Pharmacy is a pharmacy inside Mall@Lebo in Lebowakgomo, serving shoppers at the centre with everyday medication and healthcare needs.',
    description_enriched_at = datetime('now')
WHERE slug = 'kalapeng-mall-lebo-pharmacy-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Serumula Optometrists is an optometry practice inside Phasha Shopping Centre in Lebowakgomo, providing eye tests and eyewear to the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'serumula-optometrists-lebowakgomo' AND description_enriched_at IS NULL;
