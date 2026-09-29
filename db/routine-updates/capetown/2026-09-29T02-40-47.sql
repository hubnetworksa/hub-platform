-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)

UPDATE businesses
SET description = 'C4 EcoSolutions is a climate change consultancy that designs and implements carbon, conservation and community-focused projects, working on ventures across Africa, Asia and beyond since 2006.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.ecohubmap.com/company/business/c4-ecosolutions/bb1lmlbouarvm", "https://hombaze.co.za/c4-ecosolutions-8494938831676542641/", "https://c4es.co.za/about-us/"]'
WHERE slug = 'c4-ecosolutions-dennendal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Store is a mobile network retailer in Montague Gardens, offering SIM cards, devices, upgrades and account support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-13:00, Sat 08:00-13:00, Sun 09:00-17:00'
WHERE slug = 'mtn-store-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Parklands is a fast-food restaurant in Parklands Junction Shopping Centre with a dedicated drive-thru lane, serving the chain''s full menu to the local community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.polomap.com/cape-town/5925", "https://www.sluurpy.co.za/cape-town/restaurant/5039423/mcdonald-s-parklands", "https://www.mcdonalds.co.za/location/mcdonalds-parklands"]'
WHERE slug = 'mcdonalds-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Metro Organics is a family-run urban organic farm and greengrocer that has operated a shop at Noordhoek Farm Village since 2020, supplying locally grown organic vegetables and produce to the surrounding community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nrpa.org.za/metro-organics/", "https://thefarmvillage.co.za/metro-organics/", "https://www.quaggapropertybrokers.co.za/news/metro-organics-now-in-the-southern-suburbs/"]'
WHERE slug = 'metro-organics-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miladys is a women''s fashion and clothing retailer with a store at Westgate Mall in Mitchells Plain, stocking ladies'' apparel and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'miladys-westgate-mall-westgate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Montague Gardens Hardware & Steel is a hardware and steel fabrication business in Montague Gardens, offering DIY tools, steel fittings, safety gear and custom steel fabrication services, trading since 1976.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:45-16:45, Fri 07:45-16:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://mghw.co.za/contact-us/", "https://www.cylex.net.za/company/montague-gardens-hardware-cc-23748986.html", "https://mghw.co.za/about-us/"]'
WHERE slug = 'montague-gardens-hardware-and-steel-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morris Material Handling is Southern Africa''s largest crane company, supplying and manufacturing overhead travelling cranes, hoists and lifting equipment; its Crane Aid division at this branch provides long-term maintenance, servicing, load testing and refurbishment of cranes and lifting equipment.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://morris.africa/branches/", "https://www.sayellow.com/view/south-africa/crane-aid-cape-town-in-cape-town", "https://morris.africa/services/"]'
WHERE slug = 'morris-material-handling-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mugg & Bean Paddocks is a casual dining restaurant and coffee shop at The Paddocks Shopping Centre in Milnerton, part of the Mugg & Bean chain known for all-day breakfasts, coffee and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:30-18:00, Sun 08:00-16:00',
    source_urls = '["https://locations.muggandbean.co.za/restaurants-PaddocksShoppingCentre-MuggBeanPaddocks", "https://www.thinklocal.co.za/biz/mugg-n-bean-paddocks-shopping-centre-milnerton", "https://location.muggandbean.co.za/paddocks"]'
WHERE slug = 'mugg-bean-paddocks-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Namaste is a gift and curio store at Noordhoek Farm Village stocking African crafts, jewellery, homeware and clothing from local and international designers.',
    description_enriched_at = datetime('now')
WHERE slug = 'namaste-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'News Cafe Table View is a cocktail bar, restaurant and entertainment venue on Beach Boulevard, part of the News Cafe chain known for all-day dining, cocktails and live entertainment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:30-02:00, Fri-Sat 07:30-04:00, Sun 07:30-02:00'
WHERE slug = 'news-cafe-table-view' AND description_enriched_at IS NULL;
