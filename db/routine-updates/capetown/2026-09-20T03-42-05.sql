UPDATE businesses
SET description = 'Steers is a South African fast-food chain specialising in flame-grilled burgers; this branch trades from the Golden Acre Shopping Centre in Cape Town''s CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'steers-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stellenberg Vissery is a fish shop in Stellenberg, Bellville, serving the local community from Haarlem Street.',
    description_enriched_at = datetime('now')
WHERE slug = 'stellenberg-vissery-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Step Brothers Restaurant & Bar is an Italian bistro in Three Anchor Bay known for its pasta, wood-fired pizzas and prawn dishes, and is Halal-friendly.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.restaurants10.com/ZA/Cape-Town/294186254279330/Step-Brothers-Restaurant-&-Bar", "https://www.stepbrothers.co.za/", "https://restaurants-in-cape-town.co.za/restaurants/step-brothers-restaurant-and-bar/"]'
WHERE slug = 'step-brothers-restaurant-bar-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sterns is a South African jewellery retailer known for diamonds, watches and gifts; this branch trades from the Golden Acre Shopping Centre in Cape Town''s CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'sterns-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steven Johnson Cars is a used-car dealership established in 1983, relocating several times before settling on Marine Drive in Paarden Eiland in 2002; it specialises in pre-owned Land Rover, BMW and MINI vehicles.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://stevenjohnsoncars.co.za/contact/", "https://za.africabz.com/western-cape/steven-johnson-cars-cc-66596", "https://www.cars.co.za/groups/Individual-Dealers/Steven-Johnson-Cars/2265/"]'
WHERE slug = 'steven-johnson-cars-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio 88 is South Africa''s largest branded fashion, sneaker and streetwear retailer, founded in 2001 and headquartered in Johannesburg; this branch trades from the Golden Acre Shopping Centre in Cape Town''s CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/studio-88-shop-c-golden-acre-shopping-centre-corner-strand-and-addreley-streets-foreshore/17409", "https://startupmag.co.za/2025/02/the-rise-of-studio-88-how-a-retail-giant-conquered-south-africas-sneaker-and-streetwear-market/"]'
WHERE slug = 'studio-88-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio Isobel Sippel is a textile design studio inside The Old Biscuit Mill in Woodstock, hand-crafting objects from old-world fabrics and materials.',
    description_enriched_at = datetime('now'),
    hours = 'Sat 09:30-15:30',
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/studio-isobel-sippel/", "https://www.findglocal.com/ZA/Cape-Town/490990247663964/Studio-Isobel-Sippel", "https://www.isobelsippel.com/en-us/pages/about-us"]'
WHERE slug = 'studio-isobel-sippel-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunglass Hut is an international sunglasses and eyewear retailer; this branch trades from the Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-21:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/sunglass-hut-victoria-wharf/21991", "https://www.cybo.com/ZA-biz/sunglass-hut_156O", "https://www.waterfront.co.za/stores/sunglass-hut/"]'
WHERE slug = 'sunglass-hut-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SuperSpar Edgemead is a full-range SPAR supermarket trading from the Edgemead Village Centre, offering groceries, fresh produce and everyday essentials to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:30-20:00, Sun 08:00-20:00',
    source_urls = '["https://www.thinklocal.co.za/biz/superspar-edgemead-cape-town", "https://www.edgemeadvillagecentre.co.za/store-directory/", "https://vymaps.com/ZA/Edgemead-Superspar-165873/"]'
WHERE slug = 'superspar-edgemead-village-centre-edgemead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superdry is a British fashion brand founded in 2003 by Julian Dunkerton and James Holder, blending Japanese-inspired graphics with vintage Americana styling; this branch trades on the upper level of the Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://stores.superdry.com/za/cape-town/victoria-wharf-shopping-centre", "https://www.waterfront.co.za/stores/superdry-store/", "https://corporate.superdry.com/about-superdry/our-history/"]'
WHERE slug = 'superdry-va-waterfront' AND description_enriched_at IS NULL;
