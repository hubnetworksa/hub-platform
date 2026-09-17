-- Job 4: description enrichment sweep (batch of 4 -- full backlog this run)
UPDATE businesses
SET description = 'Ackermans is a national value-fashion retailer, and this branch in Mankweng Shopping Centre sells clothing for women, kids and babies alongside cellular products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/ackermans-mankweng_11", "https://za.africabz.com/limpopo/ackermans-mankweng-471258", "https://www.ackermans.co.za/"]'
WHERE slug = 'ackermans-mankweng-shopping-centre-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jet is a national fashion retailer, and this Mall@Lebo branch stocks clothing, footwear and homeware for men, women, teens, kids and babies, alongside cellular products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/business-directory/jet/", "https://www.jetonline.co.za/directory/jet-mall-lebowakgomo/", "https://www.jetonline.co.za/"]'
WHERE slug = 'jet-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a national value-fashion retailer, and this Mall@Lebo branch sells apparel, footwear, accessories and homeware at everyday low prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallatlebo.co.za/business-directory/mr-price/", "https://www.mrp.com/en_za/store/mr-price-lebowakgomo", "https://mrpricegroup.com/about-us/"]'
WHERE slug = 'mr-price-mall-lebo-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Russells is a Pepkor Lifestyle furniture and appliance retailer, and this Mankweng Shopping Centre branch sells furniture, appliances and electronics on affordable payment terms.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://www.russells.co.za/storelocator/store/index/id/491", "https://my-catalogue.co.za/stores/mankweng/russells/mankweng-shopping-centre", "https://www.russells.co.za/about-us"]'
WHERE slug = 'russells-mankweng-shopping-centre-mankweng' AND description_enriched_at IS NULL;
