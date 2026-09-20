UPDATE businesses
SET description = 'Candy Cartel is a wholesale sweets and confectionery shop in Lentegeur, selling bulk candy direct to the public at discounted prices.',
    description_enriched_at = datetime('now')
WHERE slug = 'candy-cartel-lentegeur' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a pharmacy, health and beauty retailer with a store inside Capricorn Square in Muizenberg, offering a dispensary, personal care products and its ClubCard loyalty programme.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'clicks-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Debonairs Pizza is a pizza takeaway and delivery outlet inside Capricorn Square in Muizenberg, part of the national Debonairs chain.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 10:00-22:00'
WHERE slug = 'debonairs-pizza-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fisherman''s Lane is a fish and chips takeaway inside Capricorn Square in Muizenberg, frying fish to order and serving Gatsbys and grilled seafood seasoned with Mr Royker''s spice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:20, Fri-Sat 09:00-20:00, Sun Closed',
    source_urls = '["https://www.capricornsquare.co.za/stores/", "https://za.africabz.com/western-cape/fishermans-lane-83135", "https://www.fishermanslane.co.za/"]'
WHERE slug = 'fishermans-lane-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a value clothing and homeware retailer with a store inside Capricorn Square in Muizenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:30, Fri 09:00-18:00, Sat 09:00-16:00, Sun 10:00-13:00'
WHERE slug = 'pep-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay is a supermarket and one of the anchor tenants at Capricorn Square in Muizenberg, trading seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'pick-n-pay-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Liquors is a liquor store inside Capricorn Square in Muizenberg, next to the Pick n Pay supermarket, selling wine, beer and spirits.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-liquors-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Lentegeur is a supermarket on the corner of Merrydale Road and Lavender Street in Lentegeur, Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-lentegeur-lentegeur' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a variety store inside Capricorn Square in Muizenberg, selling homeware, stationery, toys and gifts at low prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-13:00',
    source_urls = '["https://www.capricornsquare.co.za/stores/", "https://www.cylex.net.za/company/the-crazy-store---muizenberg-23762356.html", "https://www.tiendeo.co.za/stores/cape-town/crazy-store-prince-george-dr-muizenberg-cape-town-south-africa/7463"]'
WHERE slug = 'the-crazy-store-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Vet Store is a South African, vet-owned pet store inside Capricorn Square in Muizenberg, stocking pet food and accessories with staff trained as Veterinary Nutritional Advisors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:00-14:00',
    source_urls = '["https://www.capricornsquare.co.za/stores/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=290669", "https://thevetstoreonline.com/pages/our-team-capricorn-square-2"]'
WHERE slug = 'the-vet-store-muizenberg' AND description_enriched_at IS NULL;
