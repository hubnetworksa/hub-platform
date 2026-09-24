-- Job 4: description enrichment sweep (backlog of 4, now empty)

UPDATE businesses
SET description = 'Checkers Sitari is a branch of the Checkers supermarket chain, in the Sitari Village Centre, Croydon.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'checkers-sitari-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Sitari Fields is a branch of the Dis-Chem pharmacy chain, offering a dispensary and health, beauty and wellness products from the Sitari Village Centre, Croydon.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.dischem.co.za/sitari-fields-somerset-west", "https://www.cylex.net.za/company/dis-chem-pharmacy-sitari-fields-23699385.html", "https://www.tiendeo.co.za/stores/somerset-west/dischem-shop-sitari-fields-cnr-old-main-road-r-sundarbans-drive-macassar/54321"]'
WHERE slug = 'dis-chem-sitari-fields-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffe Sitari is a branch of the vida e caffe coffee shop chain, serving espresso-based coffee, snacks and baked goods from Shop 25 in the Sitari Village Centre, Croydon.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-18:00',
    source_urls = '["https://vymaps.com/ZA/vida-e-caffe-111449913676684/", "https://wanderlog.com/place/details/3407905/vida-e-caff%C3%A8-sitari", "https://vidaecaffe.com/"]'
WHERE slug = 'vida-e-caffe-sitari-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vredenhof Organic Estate is a farm restaurant and organic produce estate in Firgrove, serving breakfast and lunch with a menu of quiches, pastas and sugar-free desserts alongside organic wines.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-16:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/vredenhof-organic-estate-114092", "https://www.tripadvisor.com/Restaurant_Review-g469396-d4813306-Reviews-Vredenhof_Organic_Estate-Somerset_West_Western_Cape.html", "https://www.wininganddining.co.za/western-cape/somerset-west/vredenhof-organic-estate"]'
WHERE slug = 'vredenhof-organic-estate-firgrove' AND description_enriched_at IS NULL;
