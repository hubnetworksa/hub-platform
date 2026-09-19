UPDATE businesses
SET description = 'Kalahari Slaghuis is a butchery in Tropicana Centre, Annadale, Polokwane, specialising in processing game meat alongside a range of fresh meat, crumbed chicken products, fish, biltong, droewors and baked goods from local producers.',
    description_enriched_at = datetime('now')
WHERE slug = 'kalahari-slaghuis-annadale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Baeng Private Residence is a guesthouse in Dalmada, Polokwane, offering accommodation with a garden, swimming pool, terrace and on-site restaurant, plus private parking, free WiFi and a 24-hour front desk.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://royal-baeng-private-residence.business.site/", "https://www.hotelsnearme.co.za/hotels/dalmada-ah/royal-baeng-private-residence.html", "https://www.travelmyth.ie/Dalmada/Hotels/Royal-Baeng-Private-Residence_tmid6268680"]'
WHERE slug = 'royal-baeng-private-residence-dalmada' AND description_enriched_at IS NULL;
