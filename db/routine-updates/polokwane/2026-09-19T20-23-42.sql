UPDATE businesses
SET description = 'Kalahari Slaghuis is a butchery in Tropicana Centre, Annadale, offering a wide variety of fresh meat, crumbed chicken products, fish, biltong and droewors, plus baked goods from local producers, with a specialty in processing game meat.',
    description_enriched_at = datetime('now')
WHERE slug = 'kalahari-slaghuis-annadale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Baeng Private Residence is a guesthouse in Dalmada set on a garden property, offering rooms with private bathrooms and air conditioning, a terrace, an on-site restaurant, free private parking, free WiFi and a 24-hour front desk.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://royal-baeng-private-residence.business.site/", "https://www.hotelsnearme.co.za/hotels/dalmada-ah/royal-baeng-private-residence.html", "https://infohotels.co.za/dalmada-ah/royal-baeng-private-residence-and-gallery-guest-house/"]'
WHERE slug = 'royal-baeng-private-residence-dalmada' AND description_enriched_at IS NULL;
