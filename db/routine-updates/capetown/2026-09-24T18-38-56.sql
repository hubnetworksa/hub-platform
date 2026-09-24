UPDATE businesses
SET description = 'Synergy Pharmacy is an independent pharmacy at Tokai Junction, on the corner of Tokai and Main Roads in Kirstenhof, offering prescription dispensing and everyday health and wellness products to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/synergy-pharmacy-103115", "https://pharmasa.co.za/store-locator/synergy-pharmacy-tokai/", "https://opening-hours.co.za/04113058/Synergy_Pharmacy"]'
WHERE slug = 'synergy-pharmacy-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Tokai Junction is a branch of the national variety and discount store chain, stocking homeware, stationery, toys, and everyday household items inside the Kirstenhof shopping centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-tokai-junction-kirstenhof' AND description_enriched_at IS NULL;
