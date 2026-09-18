-- Job 4: description enrichment sweep, checkpoint 2 of 2 (records 11-15)

UPDATE businesses
SET description = 'The Queen Pet Shop (Thornhill) is a pet supply store inside Thornhill Shopping Centre stocking food and accessories for dogs, cats, reptiles, birds and fish.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:00-17:00, Sat 09:00-14:00, Sun 09:00-18:00',
    source_urls = '["https://queenpets.co.za/pages/store-locator", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "https://nutribyte.co.za/store/the-queen-pet-shop-thornhill/"]'
WHERE slug = 'the-queen-pet-shop-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trappers Trading Co is a camping and outdoor equipment store inside Palm Centre, part of the Trappers chain that has sold outdoor apparel, footwear and equipment since 1977.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-15:00, Sun Closed',
    source_urls = '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/moregloed/camping-equipment/trappers-trading-co", "https://www.trappers.co.za/", "https://www.shopshours.co.za/trappers/polokwane"]'
WHERE slug = 'trappers-trading-co-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Uys PG Attorney is a Polokwane law firm offering family, labour, divorce, corporate and commercial law services, as well as immigration law and conveyancing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed',
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/uys%20pg", "https://www.procompare.co.za/providers/uys-pg-attorney"]'
WHERE slug = 'uys-pg-attorney-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vivo Vleismark (Thornhill) is a butchery inside Thornhill Shopping Centre, Thornhill.',
    description_enriched_at = datetime('now')
WHERE slug = 'vivo-vleismark-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wildman Hunting & Outdoor Polokwane is a hunting and outdoor equipment store inside Thornhill Shopping Centre, stocking firearms, ammunition and outdoor clothing; run by a qualified gunsmith and professional hunter, it opened at Thornhill in March 2019.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.guncommunity.co.za/listing/wildman-hunting-outdoor-polokwane/", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "https://www.facebook.com/wildmanPolokwane/", "https://reviewonline.co.za/488298/ultimate-hunting-outdoor-experience-at-wildman-polokwane"]'
WHERE slug = 'wildman-hunting-outdoor-thornhill-estate' AND description_enriched_at IS NULL;
