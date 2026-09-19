-- Job 4: description enrichment sweep, checkpoint 1/2 (10 businesses)

UPDATE businesses
SET description = 'Clicks Cape Quarter is a pharmacy and health, beauty and homeware retailer inside the Cape Quarter lifestyle centre in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-18:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://clicks.co.za/store/Cape-Quarter/2045"]'
WHERE slug = 'clicks-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Golden Acre is a pharmacy and health, beauty and homeware store inside the Golden Acre shopping centre in central Cape Town, accessible from the Castle Street entrance.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 08:00-14:00'
WHERE slug = 'clicks-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Grassy Park is a pharmacy and health, beauty and homeware retailer on 3rd Avenue in Grassy Park Ext 15.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:00-16:00, Sun 09:00-15:00'
WHERE slug = 'clicks-grassy-park-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy (Rondebosch) is a pharmacy and health, beauty and homeware store inside the Rondebosch Main Centre on Main Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-19:30, Wed 09:00-19:30, Thu 08:30-18:00, Fri 08:30-19:30, Sun 09:00-15:00',
    source_urls = '["https://www.rondeboschmain.co.za/stores/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=226170", "https://clicks.co.za/store/Rondebosch/118"]'
WHERE slug = 'clicks-pharmacy-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio GO is a fast-casual, takeaway-focused outpost of the Col''Cacchio pizza chain in the Old Biscuit Mill, serving wood-fired pizzas, pastas and salads for collection or delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:30-21:30',
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/colcacchio-go/", "https://www.colcacchio.co.za/post/old-biscuit-mill-welcomes-brand-new-col-cacchio-go-to-the-neighbourhood", "https://www.colcacchio.co.za/go"]'
WHERE slug = 'colcacchio-go-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Combat Force Cape CC is a security services provider based in Diep River, offering security guarding, alarm installation and monitoring, and CCTV systems, including a dedicated response vehicle for the Marina da Gama area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za", "https://cape-town.infoisinfo.co.za", "https://combatforce.co.za"]'
WHERE slug = 'combat-force-cape-cc-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Constantia Pharmacy is an independent pharmacy inside the Constantia Village shopping centre on Constantia Main Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-17:00, Sun & Public Holidays 09:00-14:00'
WHERE slug = 'constantia-pharmacy-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cotton On is an Australian fashion and lifestyle retailer with a store in the Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'cotton-on-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Craigmore Poultry Farm is a poultry farm and hatchery on Old Paarl Road in Kraaifontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat-Sun Closed',
    source_urls = '["https://www.yellosa.co.za/location/kraaifontein", "https://www.brabys.com/za/western-cape/kraaifontein/poultry-farms/craigmore-poultry-farm"]'
WHERE slug = 'craigmore-poultry-farm-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Curry Club is an Indian restaurant in the Cape Quarter Lifestyle Centre in De Waterkant, serving lunch and dinner menus as well as takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Lunch Tue-Sat 13:00-15:00, Dinner Mon-Sat 17:00-21:30',
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://www.curryclub.co.za/restaurants/"]'
WHERE slug = 'curry-club-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;
