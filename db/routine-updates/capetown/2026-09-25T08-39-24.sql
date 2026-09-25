UPDATE businesses
SET description = 'KFC Eerste Rivier is a branch of the KFC fast-food chain, serving fried chicken, burgers, and wings inside Eerste Rivier Mall in Eerste River.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-eerste-rivier-mall-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Russells is a furniture and homeware retailer with a branch inside Grand Central Shopping Centre in Eerste River, offering household furniture and appliances.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun 09:00-13:00',
    source_urls = '["https://www.russells.co.za/storelocator/store/index/id/692", "https://www.tiendeo.co.za/stores/eerste-river/russells-joshua-doore-shop-grand-central-shopping-centreeerste-river/13881", "https://my-catalogue.co.za/stores/cape-town/russells/grand-central-shopping-centre-eerste-river"]'
WHERE slug = 'russells-grand-central-shopping-centre-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a supermarket chain outlet inside Grand Central Shopping Centre in Eerste River, offering groceries and household essentials for the surrounding community.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-grand-central-shopping-centre-eerste-river' AND description_enriched_at IS NULL;
