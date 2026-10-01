UPDATE businesses
SET description = 'Barksole Sea Point is the Main Road branch of the Barksole shoe repair and shoe care chain, in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 09:00-13:00, Sun Closed'
WHERE slug = 'barksole-sea-point-sea-point' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Bellagio is a Mediterranean restaurant in a converted warehouse in De Waterkant, known for its risotto and seafood dishes and a pergola-shaded courtyard.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dineplan.com/restaurants/bellagio-cape-town", "https://triptap.com/places/za/western-cape/cape-town/bellagio-mediterranean-restaurant-t037e6e3", "https://insideguide.co.za/cape-town/restaurants/bellagio/"]'
WHERE slug = 'bellagio-de-waterkant' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Cattle Baron De Waterkant is a steakhouse grill room and bar in the Mirage Building on the corner of Chiappini and Strand Street, in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:30, Sun 12:00-21:30'
WHERE slug = 'cattle-baron-de-waterkant-de-waterkant' AND description_enriched_at IS NULL;
UPDATE businesses SET email = 'grillroom@cattlebaron.co.za'
WHERE slug = 'cattle-baron-de-waterkant-de-waterkant' AND (email IS NULL OR email = '');
UPDATE businesses
SET description = 'Coronation Bazaar is a long-running family-run general store in Walmer Estate, trading from a building dated 1935 and stocking everything from sweets and toiletries to hardware, plumbing and electrical supplies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://voicemap.me/tour/cape-town/changing-neighbourhoods-walmer-estate-and-upper-woodstock/sites/coronation-bazaar", "https://wego.here.com/south-africa/cape-town/24-7-convenience-store/coronation-bazaar--710k3vng-3a0ac4c14483467f9f314c010a4a3ce1?lang=en-us", "https://www.foodandthefabulous.com/travel/show-me-the-way-to-the-next-corner-store/"]'
WHERE slug = 'coronation-bazaar-walmer-estate' AND description_enriched_at IS NULL;
UPDATE businesses
SET description = 'Ocean Basket Sea Point is the St Johns Piazza branch of the Ocean Basket seafood restaurant chain, on the first floor in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 12:00-21:00, Fri-Sun 11:00-21:00'
WHERE slug = 'ocean-basket-sea-point' AND description_enriched_at IS NULL;
