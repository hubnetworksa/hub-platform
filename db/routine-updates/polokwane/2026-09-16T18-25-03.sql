UPDATE businesses
SET description = 'Fairplay Hardware Lebowakgomo is a branch of the Fairplay Hardware Boards & Decor chain, which began in Mokopane and has since expanded across Limpopo, stocking building materials, hardware, home improvement and DIY supplies from its Lebowakgomo Central store behind Mall @ Lebo.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:00-14:00, Thu 08:00-13:00, Fri-Sun 08:00-17:00',
    source_urls = '["https://www.jojo.co.za/distributor/fairplay-hardware-lebowakgomo/", "https://www.top-rated.online/cities/Lepelle-Nkumpi+Local+Municipality/place/p/8041974/Fairplay+Hardware+Lebowakgomo", "https://fairplay.co.za/store-locator.php"]'
WHERE slug = 'fairplay-hardware-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mankweng Midas is the Paledi Mall branch of the Midas automotive parts chain, supplying spares, tools, batteries and vehicle accessories from Shop 39 in Mankweng.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 07:30-13:30, Sun 08:30-13:30',
    source_urls = '["https://sabusinesslistings.co.za/listings/mankweng-midas-2/", "https://www.brabys.com/za/limpopo/sovenga/mankweng/motor-spares-accessories/mankweng-midas", "https://www.tiendeo.co.za/stores/polokwane/midas-shop-paledi-mall-r-street/76133"]'
WHERE slug = 'mankweng-midas-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Supa-Roof Lebowakgomo is a branch of the national Supa-Roof chain, a specialist roofing retailer supplying IBR, corrugated and tile-profile roofing sheeting and accessories from its shop next to Fairplay Hardware.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 07:30-13:00, Sun Closed',
    source_urls = '["https://suparoof.co.za/lebowakgomo/", "https://www.datanyze.com/people/Supa--Roof-Lebowakgomo/9469272657", "https://shop.suparoof.co.za/storefinder/store/index/id/264/"]'
WHERE slug = 'supa-roof-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fix Paledi Mall is the Mankweng branch of The Fix, a fast-fashion clothing brand of the Foschini Group aimed at young adults, trading from Shop 69 in Paledi Mall.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://south-africa.searchinafrica.com/business/6121125/south-africa/limpopo/sovenga/mankweng/r71/clothing-retailers/the-fix", "https://saypro.online/saypro-the-fix-shop-69-paledi-mall-1-r71-mankweng-sovenga-%C2%B7-015-286-0509/", "https://www.sayellow.com/view/south-africa/the-fix-paledi-mall-in-mankweng", "https://tfglimited.co.za/our-brands/ladies-and-family/"]'
WHERE slug = 'the-fix-paledi-mall-mankweng' AND description_enriched_at IS NULL;
