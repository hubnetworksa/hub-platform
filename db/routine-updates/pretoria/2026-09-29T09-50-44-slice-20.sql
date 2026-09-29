-- Description enrichment sweep (job 4) -- slice 20
-- 50 businesses, slugs steers-midstream-estate .. storenet-pty-ltd-klerksoord

UPDATE businesses
SET description = 'Steers Midstream Estate is a Steers fast-food restaurant at Square @ Midstream shopping centre, offering counter service, dine-in, takeaway and delivery through the Steers app.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'steers-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stef''s Catering & Decor is a catering and event decor business based in Amberfield Ridge, Centurion, serving functions and events in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'stef-s-catering-decor-amberfield-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stegmanns Incorporated is a law firm established in 1890, offering legal services across family law, property and conveyancing, commercial law, litigation, labour law, estate administration and intellectual property, serving clients from the Pretoria area.',
    description_enriched_at = datetime('now')
WHERE slug = 'stegmanns-incorporated-weavind-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stele Business Solutions is a software development company operating from the Mlab Innovation Hub in Tileba, Lynnwood, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stele-business-solutions-tileba' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stem Connect is a business connectivity and IT services provider in Waterkloof Park, offering fibre, wireless and LTE internet access alongside managed networks, SD-WAN, managed security, managed WiFi, cloud and hosted-voice solutions for industries such as retail, hospitality, medical and finance.',
    description_enriched_at = datetime('now')
WHERE slug = 'stem-connect-waterkloof-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stems & Things is a florist in Amandasig, Pretoria North, offering flowers and floral arrangements for the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'stems-things-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Step Ahead Irene Village is a shoe store in Irene Village Mall, Irene, part of the Step Ahead footwear retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'step-ahead-irene-village-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stephnie''s is a fine-dining restaurant at Lynnwood Bridge known as a culinary theatre, serving a menu spanning steak, burgers, French-inspired dishes and vegetarian and vegan options across breakfast, lunch and dinner, with a licensed bar and live entertainment.',
    description_enriched_at = datetime('now')
WHERE slug = 'stephnies-lynnwood-manor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steri-Pools is a swimming pool company in Mayville offering pool construction, fibreglass and marbelite finishing, monthly maintenance and chemical balancing, leak detection, and pump and filter repairs, plus surrounding paving work.',
    description_enriched_at = datetime('now')
WHERE slug = 'steri-pools-mayville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sterling Pharmaceuticals (Pty) Ltd is a South African pharmaceutical contract manufacturer operating from a GMP facility commissioned in 2021, offering sachet filling, hard-gelatine and vegicap encapsulation, and capsule counting and containerisation.',
    description_enriched_at = datetime('now')
WHERE slug = 'sterling-pharmaceuticals-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sterns is a jewellery store at Sammy Marks Square in Pretoria Central, part of the Sterns jewellery retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'sterns-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sterns - Wonderpark is a jewellery store in Wonderpark Shopping Centre, Karenpark, offering contemporary and classic bridal and gift jewellery known for its quality, craftsmanship and design.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.sterns.co.za/?utm_source=google&utm_medium=stores&utm_campaign=wonderpark", "https://wonderparkcentre.co.za/storedetail-sterns"]'
WHERE slug = 'sterns-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steval Engineering (Pty) Ltd is a structural steel and mechanical engineering contractor specialising in the fabrication and erection of piping and plating, pressure vessels, tank farms and civil work for engineering, procurement and construction projects.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://enterprise-africa.net/steval-engineering/"]'
WHERE slug = 'steval-engineering-pty-ltd-rooiwal' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stewarts & Lloyds is a steel and tube supplier in East Lynne, part of a nationwide chain stocking steel and tube, pipes and fittings, valves, pumps, water meters, irrigation equipment, fencing and hardware.',
    description_enriched_at = datetime('now')
WHERE slug = 'stewarts-lloyds-steel-suppliers-in-pretoria-east-lynne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steyn Incorporated is a Valhalla-based law firm practising as attorneys, notaries and conveyancers.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.africanadvice.com/1350297/Attorneys_-_Notaries_-_Conveyancers/Pretoria/Steyn_Incorporated/"]'
WHERE slug = 'steyn-incorporated-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steynbrecht Construction is a building and construction contractor based in Wingate Park, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'steynbrecht-construction-pty-ltd-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stielcon Projects is a Centurion-based building contractor specialising in kitchen renovations and house extensions, along with interior work such as flooring, ceilings and bathrooms.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.stielconprojects.co.za/", "https://www.procompare.co.za/providers/stielcon-projectscenturion"]'
WHERE slug = 'stielcon-projects-centurion-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stillfrontier Training Centre is an education and training provider based in Laudium, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stillfrontier-training-centre-laudium' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sting Wood is a timber and wood-pallet supplier in Rosslyn, selling timber, plywood and wood pallets alongside recycled wood and furniture.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri-Sat 08:00-14:00',
    source_urls = '["https://www.facebook.com/diehoutshop/?ref=bookmarks", "https://m.facebook.com/diehoutshop/photos/a.1358187987592678/2756759121068884/?type=3", "https://yellowpages.co.za/business/5361517_3"]'
WHERE slug = 'sting-wood-rosslyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stinger Electronics is a Meyerspark-based manufacturer of electric fencing and perimeter security systems, including energisers, fence components, climb-detection technology and accessories for residential, game-farm, estate and industrial applications.',
    description_enriched_at = datetime('now')
WHERE slug = 'stinger-electronics-pty-ltd-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stitch Log Cabins builds log cabins, Wendy houses, granny flats, tool sheds, farm houses and guard rooms in Wolmer, Pretoria, along with removal and repair services.',
    description_enriched_at = datetime('now'),
    source_urls = '["scraped:google-places-no-website", "https://www.publicads.co.za/services/wendy-house-for-sale-1"]'
WHERE slug = 'stitch-log-cabins-wolmer' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'StitchOn is an embroidery and corporate clothing business in Waverley, producing branded workwear and embroidered logos using digitised designs built to resist fading and peeling.',
    description_enriched_at = datetime('now')
WHERE slug = 'stitchon-waverley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'StocklinkSA is a marketing and advertising business based in Silverton, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stocklinksa-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stodels is a garden centre in Menlo Park offering a wide range of plants, gardening supplies, pots and garden accessories, along with a garden club offering seasonal tips and trends.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-17:00'
WHERE slug = 'stodels-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stoep Restaurant is a family-friendly restaurant in Candlewoods Estate known for wood-fired pizza alongside comfort dishes such as chicken prego, burgers and breakfasts, with live music on selected Sundays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Thu 11:00-21:00, Fri 08:00-21:00, Sat 08:00-22:00, Sun 08:00-16:00'
WHERE slug = 'stoep-restaurant-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stoep Stories is a restaurant in Magalieskruin, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stoep-stories-magalieskruin' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stoke Logistics (Pty) Ltd is a logistics, courier and transport company based in Eco-Park Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stoke-logistics-pty-ltd-eco-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stols Accountants & Auditors is an accounting and auditing firm based in Pretoria North.',
    description_enriched_at = datetime('now')
WHERE slug = 'stols-accountants-auditors-pretoria-north' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stone Age Manufacturers Gauteng - Head Office is a hardware and building-materials supplier based in Donkerhoek, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stone-age-manufacturers-gauteng-head-office-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stone Sensation Donkerhoek supplies paving and patio tiles, wall cladding and slate strip walling, garden rocks and pebbles, and concrete garden decor and furniture, delivering across Gauteng.',
    description_enriched_at = datetime('now')
WHERE slug = 'stone-sensation-donkerhoek-donkerhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stone Sensation Silverton supplies paving and patio tiles, wall cladding and slate strip walling, garden rocks and pebbles, and concrete garden decor and furniture, delivering across Gauteng and beyond.',
    description_enriched_at = datetime('now')
WHERE slug = 'stone-sensation-silverton-silverton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stone Villa North is a commercial property and office space in Heuwelsig Estate, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stone-villa-north-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stoner is an industrial supplies business based in Doringkloof, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'stoner-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stonewall Building is a building and construction contractor based in La Montagne, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'stonewall-building-la-montagne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stonewolf Supply Co. is a firearms and tactical-gear distributor in Derdepoort, stocking rifles and handguns, optics, ammunition and reloading equipment, air rifles, knives and tactical accessories from an armoury facility with direct forklift access for bulk handling.',
    description_enriched_at = datetime('now')
WHERE slug = 'stonewolf-supply-co-derdepoort-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Self Storage Centurion (Lyttelton) offers personal, business, student and vehicle self-storage in over 40 unit sizes, plus packaging materials, van hire and parcel collection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-self-storage-centurion-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Self Storage Centurion, Midstream offers personal and business self-storage in over 40 unit sizes along with vehicle storage, van rental, parcel collection and a packaging shop, with rentals from a minimum of one month.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-self-storage-centurion-midstream-louwlardia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Self Storage Hennopspark offers individually alarmed self-storage units in over 40 sizes, plus van rental, a packaging shop and parcel collection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-self-storage-hennopspark-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Self Storage Rooihuiskraal offers individually alarmed self-storage units from 2m2 to 30m2, vehicle parking bays, a packaging shop, van rental and parcel collection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-self-storage-rooihuiskraal-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stor-Age Self Storage Zwartkop offers personal and business self-storage in over 40 unit sizes, plus vehicle storage, van rental, a packaging shop and parcel collection.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:00, Sat-Sun 08:00-17:00'
WHERE slug = 'stor-age-self-storage-zwartkop-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Genie Pretoria North offers Half, Single and Double self-storage units for residential and business customers, with 24/7 armed-guard security, controlled gate access and no long-term contracts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'storage-genie-storage-units-pretoria-north-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Genie Olympus is a self-storage facility at Olympus Village Shopping Centre, Olympus, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-genie-olympus-olympus' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage King Pretoria offers self-storage units in a range of sizes for household, business and document storage, along with climate-controlled wine storage, vehicle, caravan, trailer, boat and motorcycle storage, and moving and packing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-king-sa-pretoria-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Management Systems (Pty) Ltd is an Irene-based intralogistics provider with 30 years'' experience, specialising in automated and semi-automated pallet storage and retrieval systems, high-capacity sortation and warehouse control software.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-management-systems-pty-ltd-irene' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Pretoria East is a self-storage facility in Willow Park Manor with over 300 brick-and-mortar units in three sizes, insulated under the roof sheeting to stay cool in summer and warm in winter, suited to household contents, caravans and boats.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-pretoria-east-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Raslouw Centurion is a self-storage facility in Raslouw, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-raslouw-centurion-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage Spaces is a self-storage facility in Monavoni offering monitored, secure storage units from 13m2 to 53m2, carport units and large storage spaces up to 325m2 for mid- to long-term storage.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-spaces-monavoni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storage- Moving and Trailer Rent is a storage and trailer-hire business based in Kameeldrift East, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'storage-moving-and-trailer-rent-kameeldrift-east-pretoria-eldorette' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Store4U is a self-storage facility in Sunderland Ridge, Centurion, offering double and single garages, a single container unit and a carport for storage.',
    description_enriched_at = datetime('now')
WHERE slug = 'store4u-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Storenet is a self-storage facility in Klerksoord, Akasia, offering 10m2 to 40m2 units in brick buildings with roller-shutter doors, 24/7 CCTV monitoring, electrified fencing and armed response.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 06:00-18:00'
WHERE slug = 'storenet-pty-ltd-klerksoord' AND description_enriched_at IS NULL;
