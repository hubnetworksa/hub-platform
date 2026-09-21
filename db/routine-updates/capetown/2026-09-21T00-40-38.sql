UPDATE businesses
SET description = 'Coricraft Clearance Centre is a factory clearance outlet for the Coricraft furniture brand in Montague Gardens, selling discounted and clearance-line furniture.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun 09:00-13:00',
    source_urls = '["https://za.readymap.info/4/27232", "https://za.africabz.com/western-cape/coricraft-cape-town-clearance-centre-26477", "https://www.furnitureforall.co.za/coricraft-factory-shop/"]'
WHERE slug = 'coricraft-clearance-centre-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Creative Sweets Factory Shop is a confectionery importer and distributor''s factory outlet in Montague Gardens, selling sweets, chocolate and discounted damaged-stock confectionery.',
    description_enriched_at = datetime('now')
WHERE slug = 'creative-sweets-factory-shop-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Decofurn Furniture Montague Gardens is a discount furniture warehouse at Montague Business Park, part of the Decofurn retail chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'decofurn-furniture-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Diamond''s Discount Liquor is a bottle store on Summer Greens Drive in Summer Greens, stocking a range of wines, spirits and beers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:30, Sat 09:00-19:00, Sun Closed'
WHERE slug = 'diamonds-discount-liquor-summer-greens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Tableview is a branch of the Dis-Chem pharmacy and health chain inside Table View Shopping Centre, offering a dispensary and health, beauty and wellness retail.',
    description_enriched_at = datetime('now')
WHERE slug = 'dis-chem-tableview-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Carl Ensil Table View Dental Studio Inc is a general dentistry practice in Table View offering consultations, fillings, crowns, root canal treatment, implants and braces.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/dr-carl-ensil-table-view-dental-studio-inc-153754", "https://www.cybo.com/ZA-biz/dr-carl-ensil-table-view-dental-studio", "https://www.medpages.info/sf/index.php?page=person&personcode=144004", "https://thedentistworld.com/dr-carl-ensil-table-view-dental-studio-inc/"]'
WHERE slug = 'dr-carl-ensil-table-view-dental-studio-table-view' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fish on the Rocks is a seafood restaurant on Harbour Road in Hout Bay, serving prawns, calamari, snoek and seasonal crayfish with halaal-certified seafood and harbour views.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-20:30',
    source_urls = '["https://za.africabz.com/western-cape/fish-on-the-rocks-4979", "https://www.tripadvisor.com/Restaurant_Review-g469392-d1996396-Reviews-Fish_on_the_Rocks-Hout_Bay_Western_Cape.html", "https://fishontherocks.com/"]'
WHERE slug = 'fish-on-the-rocks-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food Lover''s Market Parklands is a branch of the Food Lover''s Market fresh produce and grocery chain inside the Emporium Centre in Parklands.',
    description_enriched_at = datetime('now')
WHERE slug = 'food-lovers-market-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Golden River Spur is a branch of the Spur Steak Ranches family restaurant chain on the first floor of Town Square Centre in Fish Hoek.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri-Sat 09:00-22:00, Sun 09:00-20:00'
WHERE slug = 'golden-river-spur-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Westridge is a branch of the KFC fast food chain in Westridge, Mitchells Plain, serving fried chicken, burgers and wings.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-westridge-westridge' AND description_enriched_at IS NULL;
