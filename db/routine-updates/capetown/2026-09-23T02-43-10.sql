UPDATE businesses
SET description = 'Big Boy Crockery is a homeware retailer and importer/wholesaler of glassware in Lansdowne, stocking cutlery, crockery, cookware, dinnerware, serving platters and general kitchenware.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/big-boy-crockery-77777", "https://www.facebook.com/bigboycrockery/posts/big_boy_crockery355-imam-haron-rd-lansdowne-%EF%B8%8Ftel-0216968445-dm-for-more-info-wha/444172396192699/", "https://bigboycrockery.co.za/"]'
WHERE slug = 'big-boy-crockery-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cashbuild is a South African hardware and building materials retailer chain; its Delft Mall branch stocks building supplies, tools and home-improvement essentials for local trade and DIY customers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-18:00, Fri 08:00-15:00, Sat 07:00-16:00, Sun 08:00-14:00',
    source_urls = '["https://locations.cashbuild.co.za/Retail-DelftMall-CashbuildDelft", "https://za.africabz.com/western-cape/cashbuild-368376", "https://stores.cashbuild.co.za/za/delft/shop-v1-delft-mall"]'
WHERE slug = 'cashbuild-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Duinefontein Service Station is a Caltex-branded fuel station on Duinefontein Road in Manenberg, offering fuel and forecourt services to the surrounding community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fueldirectory.co.za/listing-contact.php?listings_id=8365", "https://www.yep.co.za/biz/store/iyp/16272852_2", "https://caltex.co.za/forecourt-details.html?location=duinefonteinservicestation"]'
WHERE slug = 'duinefontein-service-station-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'E-Kem Pharmacy is a community pharmacy trading from the Rose Centre on the corner of Norman and Plein Street in Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'e-kem-pharmacy-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Going Under Clothing is a South African fashion retailer offering affordable, on-trend clothing; this branch trades from Nyanga Junction Shopping Centre in Manenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'going-under-clothing-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Going Under Clothing is a South African fashion retailer offering affordable, on-trend clothing; this branch trades from Induland Avenue in Lansdowne.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/going-under-clothing-lansdowne", "https://za.africabz.com/western-cape/going-under-clothing-lansdowne-451885", "https://www.goingunder.co.za/find-our-stores/"]'
WHERE slug = 'going-under-clothing-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Honest Hardware is a hardware store on Pooke Road in Athlone stocking electrical supplies, plumbing materials, solar and inverter equipment, tiles, sanitaryware, roofing and ceiling products, paint and tools.',
    description_enriched_at = datetime('now')
WHERE slug = 'honest-hardware-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hungry Lion is a South African fast-food chicken chain; its Delft Mall branch serves chicken, chips, burgers, family meals and buckets.',
    description_enriched_at = datetime('now')
WHERE slug = 'hungry-lion-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'JAM Clothing is a national discount fashion retailer that has traded for over 20 years; its Gugulethu Square branch stocks clothing and fashion brands from around the world at value prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'jam-clothing-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jawitz Properties Pinelands is an estate agency branch that has served the Pinelands, Thornton and Maitland areas for over a decade, handling residential property sales and rentals.',
    description_enriched_at = datetime('now')
WHERE slug = 'jawitz-properties-central-square-pinelands' AND description_enriched_at IS NULL;
