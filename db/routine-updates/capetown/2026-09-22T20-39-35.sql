UPDATE businesses
SET description = 'Afrox is an industrial gas and welding equipment supplier in Epping Industria, offering regulators, cutting torches, flashback arrestors and complete gas and welding outfits alongside a broad range of accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 09:00-13:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/afrox-cape-town-gas-and-gear-in-cape-town", "https://za.africabz.com/western-cape/afrox-epping-gas-and-gear-635351", "https://magicpin.com/south-africa/Cape-Town/Epping-Industria/Other/Afrox-Epping-Gas-And-Gear/store/2431687"]'
WHERE slug = 'afrox-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Northgate is a branch of CTM, South Africa''s largest tile retailer, stocking tiles and related home-improvement products from Northgate Estate in Brooklyn.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:30-17:00, Thu-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-14:00'
WHERE slug = 'ctm-northgate-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Market is a long-established fresh produce market on Gunners Circle in Epping, one of South Africa''s oldest and largest, connecting thousands of producers with market agents who supply produce to restaurants and retailers across the city.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 04:00-10:00, Sat 04:00-17:00, Sun Closed',
    source_urls = '["http://www.ctmarket.co.za/contact-us/", "https://www.brabys.com/business/5857904/south-africa/western-cape/cape-town/epping/gunners-cir/fresh-produce-market/fresh-produce-agents/cape-town-market", "https://opening-hours.co.za/0633026/Cape_Town_Market,_Epping"]'
WHERE slug = 'cape-town-market-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Distell operates a Green Park distribution facility in Epping Industria, part of the group''s national network for distributing its wine, spirits and cider brands such as Amarula, Bain''s Cape Mountain Whisky and Nederburg.',
    description_enriched_at = datetime('now')
WHERE slug = 'distell-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Elvey Security Technologies is a distributor of electronic security equipment, supplying intruder detection, access control, surveillance and fire detection products from its Brooklyn branch as part of a nationwide network established in 1946.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/", "https://elvey.co.za/overview/"]'
WHERE slug = 'elvey-security-technologies-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hybrid Composite is a composites manufacturer based in Ndabeni, producing custom parts for the marine industry, including deck-access equipment for superyachts, alongside work for the oil & gas, automotive and other sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html", "https://hybridcomposite.co.za/about-us/"]'
WHERE slug = 'hybrid-composite-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Merrypak & Print is a packaging manufacturer in Ndabeni with its own factory shop and copy-and-print counter, supplying packaging along with wedding, party and arts-and-crafts supplies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:30, Sat 08:00-12:30'
WHERE slug = 'merrypak-and-print-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nestle Purina Petcare runs an industrial premises in Ndabeni, Cape Town, under the Nestle Purina pet-food business.',
    description_enriched_at = datetime('now')
WHERE slug = 'nestle-purina-petcare-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Metal Group is a scrap metal recycling business in Epping, collecting and processing ferrous and non-ferrous metals for recycling.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/sa-metal-group-cape-town-in-cape-town", "https://mra.co.za/member-locator/listing/sa-metal-group-pty-ltd/", "https://sametal.co.za/"]'
WHERE slug = 'sa-metal-group-epping' AND description_enriched_at IS NULL;
