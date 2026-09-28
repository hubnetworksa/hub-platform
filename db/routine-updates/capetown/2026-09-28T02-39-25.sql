UPDATE businesses
SET description = 'Bella Casa is a home décor and gifting store in Plattekloof Village Shopping Centre, stocking and manufacturing cushions, tablecloths and wall art for the home, alongside gift items such as candles, glassware and jewellery, plus wool and knitting supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'bella-casa-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Calamari Fisheries is a fish and chips takeaway at Richmond Corner in Richwood, part of a Cape Town seafood franchise serving fried and grilled fish, chips and other seafood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-13:00',
    source_urls = '["https://www.calamarifisheries.co.za/lockdown-menu-stores/richmond", "https://restaurantguru.com/Calamari-Fisheries-Cape-Town-12", "https://www.calamarifisheries.co.za/our-stores"]'
WHERE slug = 'calamari-fisheries-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chinook Spur is a branch of the Spur Steak Ranches family restaurant chain in Plattekloof Village Shopping Centre, serving burgers, steaks and the chain''s Wild West-themed menu for families.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri-Sat 09:00-21:30, Sun 09:00-21:00'
WHERE slug = 'chinook-spur-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Famous Kalahari Biltong is a branch of the biltong and droëwors retailer at Richmond Corner in Richwood, selling a range of dried meats, snacks and biltong-related products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'famous-kalahari-biltong-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hoghouse Brewing Company is a craft brewery, smokehouse and bakery in Ndabeni, brewing small-batch beers on-site — including kölsch, pilsner, saison and IPA styles — alongside wood-fired barbecue such as brisket and ribs, and artisanal bread.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownmagazine.com/restaurants-cape-town/texan-barbeque-grub-at-hoghouse-brewing-co-and-restaurant-in-cape-town/27_22_19848", "https://www.eatout.co.za/venue/hoghouse-brewing-company/", "https://hoghouse.co.za/"]'
WHERE slug = 'hoghouse-brewing-company-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Joe Fish Seafood Cafe is a small, popular seafood restaurant in Howard Centre, Pinelands, known for its mussels, fish pie and daily specials, with booking recommended as it is often fully booked.',
    description_enriched_at = datetime('now')
WHERE slug = 'joe-fish-seafood-cafe-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Livecopper is an electrical, lighting and plumbing supplies retailer with a showroom in Northgate Estate, Brooklyn, offering light fittings, switches, taps and sanitaryware for click & collect or delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:30, Fri 08:00-15:30, Sat 09:00-14:00, Sun 09:00-12:00',
    source_urls = '["https://www.livecopper.co.za/pages/contact-us", "https://www.facebook.com/livecopper.co.za/", "https://www.livecopper.co.za/pages/our-stores"]'
WHERE slug = 'livecopper-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lotter Attorneys is a law firm in Panorama offering family law, conveyancing, debt collection, wills and estates, and civil litigation services, established in 2007.',
    description_enriched_at = datetime('now')
WHERE slug = 'lotter-attorneys-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Neovision Welgemoed is an optometry practice in Welgemoed Forum offering eye tests, glaucoma screening and a range of designer frames and contact lenses.',
    description_enriched_at = datetime('now')
WHERE slug = 'neovision-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New Balance Outlet is a branch of the sportswear and footwear brand''s outlet store in Access Park, Kuils River, selling New Balance running shoes, sneakers and apparel.',
    description_enriched_at = datetime('now')
WHERE slug = 'new-balance-outlet-kuils-river' AND description_enriched_at IS NULL;
