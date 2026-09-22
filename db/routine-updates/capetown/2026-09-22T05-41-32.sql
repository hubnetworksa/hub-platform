-- Job 4: description enrichment sweep, batch 1/2 this run (10 records)

UPDATE businesses
SET description = 'Cash Crusaders Tokai is a second-hand goods store and pawnbroker in Kirstenhof Shopping Centre, Kirstenhof, buying, selling and trading used electronics, tools and other goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/cash-crusaders-tokai-162482", "https://www.tiendeo.co.za/stores/cape-town/cash-crusaders-pick-n-pay-centre-main-and-tokai-roads-tokai/22215", "https://cashcrusaders.co.za/locate-a-store/store/68/Cash%20Crusaders%20Tokai", "https://www.cybo.com/ZA-biz/cash-crusaders-tokai"]'
WHERE slug = 'cash-crusaders-tokai-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McGregor Take Aways is a fish and chips takeaway in Meadowridge Shopping Centre, Meadowridge, known for its hake and chips.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/western-cape/mc-gregor-46656", "https://www.thinklocal.co.za/biz/mcgregor-take-aways-cape-town", "https://yellowpages.co.za/business/6623027_2"]'
WHERE slug = 'mcgregor-take-aways-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shakespeare''s Restaurant is a fine-dining restaurant in Heritage Square, Durbanville, reimagining a decades-old Durbanville establishment with an Elizabethan theatre-of-dining theme, offering breakfast, lunch, dinner and high tea.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 12:00-22:00, Sat 09:00-22:00, Sun-Mon Closed',
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/shakespeares/", "https://www.capetownmagazine.com/shakespeares", "https://www.shakespeares.co.za/"]'
WHERE slug = 'shakespeares-restaurant-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tafelberg Furnishers is an appliance and furniture retailer in Diep River, part of a Western Cape chain founded in the early 1960s in Bellville, stocking major appliance brands such as Smeg, AEG, Defy, Samsung and Whirlpool.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-16:00, Sun 10:00-14:00',
    source_urls = '["https://za.polomap.com/cape-town/163555", "https://www.tiendeo.co.za/stores/cape-town/tafelberg-furnishers", "https://za.africabz.com/western-cape/tafelberg-furnishers-diep-river-31526"]'
WHERE slug = 'tafelberg-furnishers-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Alphen Boutique Hotel & Spa is a boutique country hotel in Constantia built around an 18th-century manor house that originally formed part of the Groot Constantia estate, offering 19 luxury suites set across 11.5 acres of gardens on a Provincial Heritage site.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.alphen.co.za/contact/", "https://www.sa-venues.com/visit/alphenboutiquehotel/map.php", "https://www.alphen.co.za/our-story/"]'
WHERE slug = 'alphen-boutique-hotel-and-spa-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Barber''s Range is a barbershop in 3Arts Village, Plumstead, part of a Cape Town chain, offering haircuts, beard trims, shaves and head shaves.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-19:00, Fri 08:00-13:00, 14:00-19:00, Sat 08:00-17:00, Sun 08:00-15:00'
WHERE slug = 'the-barbers-range-3arts-village-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Book Shoppe is an independent bookstore in 3Arts Village, Plumstead, specialising in restored second-hand, rare and antiquarian books alongside new titles, art and coffee, in a cosy setting with reading nooks.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Thu 09:00-18:00, Fri 10:00-15:00, Sat 09:00-17:00, Sun 10:00-15:00',
    source_urls = '["https://za.africabz.com/western-cape/the-book-shoppe-370489", "https://hombaze.co.za/the-book-shoppe-62500522065320304/", "https://opening-hours.co.za/02022880/The_Book_Shoppe"]'
WHERE slug = 'the-book-shoppe-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Brasserie is a French-Italian restaurant in Tokai, serving French classics such as fillet au poivre alongside Italian dishes like housemade spaghetti carbonara and salt-and-pepper squid, plus a dedicated breakfast menu.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://brasseriect.co.za/contact/", "https://insideguide.co.za/cape-town/specials/brasserie-lunch-club/", "https://brasseriect.co.za/about/"]'
WHERE slug = 'the-brasserie-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Clarendon Bantry Bay is a boutique hotel on the slopes of Lion''s Head in Bantry Bay, with sea-view rooms, a restaurant, bar, spa and two swimming pools, within walking distance of Clifton beach.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.clarendon.co.za/", "https://www.tripadvisor.com/Hotel_Review-g312654-d1450363-Reviews-The_Clarendon_Bantry_Bay-Bantry_Bay_Western_Cape.html", "https://www.clarendon.co.za/bantry-bay/"]'
WHERE slug = 'the-clarendon-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a discount variety store in 3Arts Village, Plumstead, part of South Africa''s largest discount variety chain and one of the centre''s anchor tenants.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-12:00',
    source_urls = '["https://www.biznizdirectory.co.za/crazy-store-3art-village-gift-store-retailers-retail-trade-in-plumstead-cape-town-western-cape-72341.html", "https://www.tiendeo.co.za/stores/cape-town/crazy-store-main-rd-plumstead-cape-town-south-africa/73331", "https://www.cylex.net.za/company/the-crazy-store---3art-village-23815895.html"]'
WHERE slug = 'the-crazy-store-3arts-village-plumstead' AND description_enriched_at IS NULL;
