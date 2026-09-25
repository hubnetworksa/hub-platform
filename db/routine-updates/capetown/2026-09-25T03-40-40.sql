UPDATE businesses
SET description = '4x4 Mega World is a specialist 4x4 and overlanding accessories store in Paarden Eiland, fitting out vehicles with gear from brands such as ARB, Old Man Emu, Engel and Alu-Cab, including winches, refrigeration units and canopy fitments.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/4x4-mega-world-cape-town-103224", "https://www.4x4megaworldonline.com/stores/4x4-mega-world-paarden-eiland/", "https://arbeurope.com/dealers/4x4-mega-world-paarden-eiland/"]'
WHERE slug = '4x4-mega-world-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'African Oils & Vinegar is a specialty retailer in Paarden Eiland selling extra virgin olive oils, infused oils and natural balsamic vinegars, including organic and Karoo-sourced ranges, with in-store pickup and nationwide delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat-Sun 08:30-16:00',
    source_urls = '["https://africanoils.co.za/pages/contact", "https://za.africabz.com/western-cape/african-oils-539931", "https://africanoils.co.za/products/organic-extra-virgin-olive-oil"]'
WHERE slug = 'african-oils-and-vinegar-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Atlantic Meat is a butchery on Voortrekker Road in Maitland offering a range of quality meat cuts, part of a small chain of butcheries with branches across Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00, Sun 08:00-14:00',
    source_urls = '["https://www.foodbevg.com/ZA/Cape-Town/387922421366077/Atlantic-Meat", "https://www.thinklocal.co.za/biz/atlantic-meat-maitland", "https://www.atlanticmeat.co.za/"]'
WHERE slug = 'atlantic-meat-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'EHIRE is an event and party equipment hire showroom in Paarden Eiland, operating under Ignite Events, offering furniture, decor, cutlery, crockery and glassware hire along with a bookable showroom space for planning events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://ehire.co.za/contact/", "https://www.property24.com/property-values/25-natal-street/paardeneiland/milnerton/western-cape/ph7krgqwm4lcvollp5ed4xjzlbycfxosgix5et27biqqwvaweubaoufwyaxascwokathiub45t6d2", "https://ehire.co.za/about/"]'
WHERE slug = 'ehire-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ergonomics Direct is a specialist supplier of ergonomic office and home-office equipment in Paarden Eiland, with a showroom on Carlisle Street as well as a virtual showroom for remote consultations.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat-Sun Closed',
    source_urls = '["https://www.cybo.com/ZA-biz/ergonomicsdirect", "https://za.africabz.com/western-cape/ergonomicsdirect-304472", "https://ergonomicsdirect.co.za/pages/contact"]'
WHERE slug = 'ergonomics-direct-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sasol Maitland is a 24-hour fuel station and convenience forecourt at the corner of 5th Avenue and Voortrekker Road in Maitland.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'sasol-maitland-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Trenton is South Africa''s official retailer for UGG, Hunter Boots and Loci sneakers, with a showroom at 82 Marine Drive in Paarden Eiland stocking these and other international footwear brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-16:30, Fri-Sat 09:00-16:00, Sun Closed',
    source_urls = '["https://trenton.co.za/pages/our-stores", "https://www.waze.com/live-map/directions/za/wc/cape-town/trenton-paarden-eiland", "https://trenton.co.za/"]'
WHERE slug = 'trenton-paarden-eiland' AND description_enriched_at IS NULL;
