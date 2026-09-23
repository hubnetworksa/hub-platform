UPDATE businesses
SET description = 'Mitchells Plain Community Health Centre is a public primary healthcare facility providing free clinical services, including maternity care, to Eastridge and surrounding communities such as Philippi, Samora Machel, Weltevrede Park, Mandalay and Marikana.',
    description_enriched_at = datetime('now')
WHERE slug = 'mitchells-plain-community-health-centre-eastridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Silulo Ulutho Technologies at Khayelitsha Mall is a one-stop technology outlet offering internet access, computer training, phone and computer sales and repairs, and printing, scanning and CV-writing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://siluloulutho.co.za/branches/", "https://www.yellosa.co.za/company/786478/silulo-ulutho-technologieskhayelitsha-mall", "https://siluloulutho.co.za/"]'
WHERE slug = 'silulo-ulutho-technologies-khayelitsha-mall-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Silulo Ulutho Technologies in Khayelitsha''s Town 1 Village 1 is a one-stop technology outlet offering internet access, computer training, phone and computer sales and repairs, and printing, scanning and CV-writing services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://siluloulutho.co.za/branches/", "https://www.thinklocal.co.za/biz/silulo-ulutho-technologies-khayelitsha", "https://siluloulutho.co.za/"]'
WHERE slug = 'silulo-ulutho-technologies-town-1-village-1-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sleepmasters at Vangate Mall in Athlone is a bedding and furniture retailer specialising in mattresses and bedroom furniture.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'sleepmasters-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spaces Century City is a coworking and serviced office centre in the Bridgeways Precinct, offering private offices, dedicated desks and meeting rooms, with 24-hour access for private-office and dedicated coworking members.',
    description_enriched_at = datetime('now'),
    hours = 'Reception Mon-Fri 08:00-17:30',
    source_urls = '["https://www.regus.com/en-gb/south-africa/cape-town/1-bridgeway-road-4411", "https://www.myspacesworks.com/centre/4411/details", "https://www.spacesworks.com/cape-town/century-city/"]'
WHERE slug = 'spaces-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Local Choice Pharmacy - Chemcare Mitchells Plain is a retail pharmacy serving the Beacon Valley community in Mitchells Plain.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-local-choice-pharmacy-chemcare-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Milk Restaurant & Champagne Bar is a multi-storey restaurant and lounge in Khayelitsha serving breakfast, lunch and dinner, from linefish and seafood pasta to burgers and grills, alongside a rooftop Champagne Lounge for private events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bizcommunity.com/Article/196/436/224148.html", "https://insideguide.co.za/cape-town/restaurants/the-milk-restaurant-bar/", "https://www.eatout.co.za/venue/milk-restaurant-bar/"]'
WHERE slug = 'the-milk-restaurant-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports at The Junxion Mall in Philippi is a branch of the national sportswear retail chain, part of the TFG group, stocking footwear, apparel and equipment across football, running and fitness.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.jamii.co.za/totalsports-phillipi-junxion-mall-philippi-east", "http://www.thejunxionmall.co.za/", "https://en.wikipedia.org/wiki/TFG_Limited"]'
WHERE slug = 'totalsports-the-junxion-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports at Vangate Mall in Athlone is a branch of the national sportswear retail chain, part of the TFG group, stocking footwear, apparel and equipment across football, running and fitness.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-15:00, Tue-Sat 09:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://www.cybo.com/ZA-biz/totalsports-vangate-mall", "https://za.polomap.com/cape-town/79395", "https://www.tiendeo.co.za/stores/cape-town/totalsports-vangate-mall-jakes-gerwel-drive/72799", "https://en.wikipedia.org/wiki/TFG_Limited"]'
WHERE slug = 'totalsports-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths at The Junxion Mall in Philippi is a branch of the Cape Town-founded fashion retail chain, offering women''s leisurewear, formalwear, lingerie, jewellery, shoes and accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://jamii.co.za/7002-philippi-clothing-fashion-truworths-philippi-junxion-mall", "http://www.thejunxionmall.co.za/", "https://en.wikipedia.org/wiki/Truworths"]'
WHERE slug = 'truworths-the-junxion-mall-philippi' AND description_enriched_at IS NULL;
