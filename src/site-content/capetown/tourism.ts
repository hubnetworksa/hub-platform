// Tourism detail-page content for Cape Town, matching the shape/tone of
// src/site-content/polokwane/tourism.ts. Overview page at /tourism/, one
// sub-page per attraction at /tourism/<slug>/ via src/pages/tourism/[slug].astro.
//
// Data status: prices, hours and fees below are well-documented public
// figures for these landmarks but should still be confirmed against the
// operator's own site before launch — see each entry's `beforeYouGo`.
// STILL OUTSTANDING: exact `geo` coordinates (approximate below — source
// from Google Maps) and real photos (each entry carries an `imageNeeded` note).

import type { Attraction } from '../attraction-types';

export const ATTRACTIONS: Attraction[] = [
  {
    slug: 'table-mountain-cableway',
    name: 'Table Mountain Cableway',
    pageTitle: 'Table Mountain Cableway | Cape Town\'s Iconic Summit',
    metaDescription:
      'Ride the rotating cable car to the top of Table Mountain — walking routes across the plateau, views over the whole peninsula, and tips on when the cableway actually runs.',
    teaser: 'A rotating cable car to the flat summit plateau, with walking routes and the best view in the city.',
    whatItIs:
      "The Table Mountain Aerial Cableway carries visitors from the lower station on Tafelberg Road up 1,067 metres to the flat plateau at the top of Table Mountain, the flat-topped peak that gives Cape Town its skyline. The cars rotate 360 degrees during the ride, so everyone gets the full view on the way up. The mountain and the cableway are Cape Town's single most-visited attraction and a genuine natural landmark, not a built one — the plateau itself is part of Table Mountain National Park.",
    whatToDo:
      "At the top, a network of paved and gravel paths lead to different viewpoints over the City Bowl, Camps Bay, Robben Island and the Atlantic seaboard, plus a café and gift shop at the upper station. Fit visitors can walk down via Platteklip Gorge (2–3 hours) instead of taking the cableway back, or hike up one of several routes (Platteklip Gorge is the most direct, roughly 2–3 hours to the top) and ride down. The cableway itself does not run in high wind or low cloud, so it's worth checking conditions before setting out rather than after arriving at the base.",
    practical: [
      { label: 'Address', value: 'Tafelberg Road, Table Mountain National Park, Cape Town' },
      { label: 'Hours', value: 'Typically 08:00–18:00 in winter and 08:00–19:00/20:00 in summer, weather dependent — the cableway closes entirely in strong wind or low cloud, sometimes for the whole day.' },
      { label: 'Ticket price', value: 'Around R420–R440 return for adults, R210–R220 for children, cheaper one-way — book online in advance where possible, especially in peak season, since walk-up queues can run to hours.' },
      { label: 'Getting there', value: 'Self-drive with paid parking at the lower station, or the hop-on-hop-off bus / MyCiti route from the City Bowl.' },
    ],
    beforeYouGo: [
      'Current cableway operating status — it closes for wind/cloud with little notice, so check the live status on the operator\'s website on the morning of your visit.',
      'Current ticket prices and whether online booking is required that day.',
    ],
    openingHours: ['Mo-Su 08:00-18:00'],
    priceRange: 'R220 – R440',
    isAccessibleForFree: false,
    nearby:
      'Combine with a walk through Kirstenbosch on the other side of the mountain, or head down to the City Bowl for the Bo-Kaap and the Company\'s Garden. The V&A Waterfront is a short drive away for the evening.',
    tieIns: [
      { label: 'Kirstenbosch Botanical Garden', href: '/tourism/kirstenbosch-botanical-garden/' },
      { label: 'V&A Waterfront', href: '/tourism/va-waterfront/' },
      { label: 'Accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'Tafelberg Road', addressLocality: 'Cape Town', addressRegion: 'Western Cape', postalCode: '8001', addressCountry: 'ZA' },
    geo: { lat: -33.9575, lng: 18.4030 },
    imageNeeded: 'Real photo of the cable car in motion or the summit plateau view — not a generic mountain/cable-car stock image.',
    imageUrl: '/media/tourism/table-mountain-cableway.jpg',
    imageCredit: 'Photo: Dietmar Rabich / Wikimedia Commons, CC BY-SA 4.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Cape_Town_(ZA),_Table_Mountain,_Seilbahn_--_2024_--_2846.jpg',
  },
  {
    slug: 'va-waterfront',
    name: 'V&A Waterfront',
    pageTitle: 'V&A Waterfront | Shopping, Dining & Harbour in Cape Town',
    metaDescription:
      'A working harbour turned shopping, dining and entertainment precinct — Zeitz MOCAA, the Two Oceans Aquarium, the Robben Island ferry and Table Mountain views, all in one place.',
    teaser: 'Working harbour with the Zeitz MOCAA museum, Two Oceans Aquarium and the Robben Island ferry.',
    whatItIs:
      "The Victoria & Alfred (V&A) Waterfront is Cape Town's harbourfront precinct, built around the still-working Victoria and Alfred Basins at the foot of Table Mountain. It combines a large open-air and indoor shopping centre with restaurants, hotels, a marina, and several of the city's major attractions in one walkable area, making it the default first stop for most visitors.",
    whatToDo:
      "Zeitz Museum of Contemporary Art Africa (Zeitz MOCAA), housed in a converted 1920s grain silo, is the largest museum of contemporary African art in the world. The Two Oceans Aquarium covers marine life from the cold Atlantic and warm Indian Ocean sides of the Cape. Ferries to Robben Island depart from the Nelson Mandela Gateway here. Beyond the attractions, there's harbour-side dining, live buskers, a Ferris wheel, and boat trips ranging from short harbour cruises to sunset cruises. It's easily a full day, and works in most weather since much of it is under cover.",
    practical: [
      { label: 'Address', value: 'V&A Waterfront, Dock Road, Cape Town, 8001' },
      { label: 'Hours', value: 'The precinct and shops are generally open 09:00–21:00 daily; individual attractions (Zeitz MOCAA, the aquarium) keep their own hours, typically 09:00–18:00 or 21:00.' },
      { label: 'Entry', value: 'Free to enter and walk around; individual attractions charge separately (Zeitz MOCAA and the aquarium are both paid entry).' },
      { label: 'Getting there', value: 'Self-drive with paid parking, MyCiti bus, or a short taxi/rideshare from the City Bowl.' },
    ],
    beforeYouGo: [
      'Current Zeitz MOCAA and Two Oceans Aquarium ticket prices and hours, which are set independently of the precinct.',
    ],
    nearby:
      'Robben Island ferries leave from here — book that separately and in advance. Table Mountain Cableway is a short drive away.',
    tieIns: [
      { label: 'Robben Island Museum', href: '/tourism/robben-island-museum/' },
      { label: 'Table Mountain Cableway', href: '/tourism/table-mountain-cableway/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Dock Road', addressLocality: 'Cape Town', addressRegion: 'Western Cape', postalCode: '8001', addressCountry: 'ZA' },
    geo: { lat: -33.9036, lng: 18.4197 },
    imageNeeded: 'Real photo of the harbour, the Ferris wheel, or Zeitz MOCAA\'s silo building — not a generic waterfront stock image.',
    imageUrl: '/media/tourism/va-waterfront.jpg',
    imageCredit: 'Photo: Dietmar Rabich / Wikimedia Commons, CC BY-SA 4.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Cape_Town_(ZA),_Waterfront,_Kran_--_2024_--_2907.jpg',
  },
  {
    slug: 'cape-point-chapmans-peak',
    name: 'Cape Point & Chapman\'s Peak',
    pageTitle: 'Cape Point & Chapman\'s Peak Drive | Cape Peninsula Day Trip',
    metaDescription:
      'The classic Cape Peninsula drive — Chapman\'s Peak toll road, Boulders Beach penguins, and the cliffs of Cape Point and the Cape of Good Hope.',
    teaser: 'The peninsula drive — Hout Bay, Chapman\'s Peak toll road, Boulders penguins and the Cape of Good Hope.',
    whatItIs:
      "Cape Point and the Cape of Good Hope form the southernmost tip of the Cape Peninsula, inside a dedicated section of Table Mountain National Park roughly an hour's drive from the City Bowl. Chapman's Peak Drive is the scenic toll road that hugs the cliffs between Hout Bay and Noordhoek en route, widely rated one of the most dramatic coastal drives in the world. Together they make up the classic full-day \"peninsula loop\" almost every visitor does at least once.",
    whatToDo:
      "The drive itself is the main event: Hout Bay's harbour, then Chapman's Peak Drive's switchbacks along the cliff face, then on to Cape Point, where a funicular (the Flying Dutchman) or a walking path leads up to the old lighthouse with views over both oceans meeting. The reserve has short walking trails, beaches, and troops of resident baboons — keep car windows closed and never feed them. On the way back, Boulders Beach at Simon's Town is the place to see the African penguin colony up close via boardwalks. Budget the better part of a day for the full loop with stops.",
    practical: [
      { label: 'Cape Point park fee', value: 'Around R400–R450 for foreign adults, cheaper for SADC nationals and South African residents with ID — set by SANParks and revised periodically.' },
      { label: 'Chapman\'s Peak toll', value: 'A separate toll fee applies per vehicle (a day pass is common) — the road can close in high wind, rockfall risk or bad weather, sometimes at short notice.' },
      { label: 'Boulders Beach entry', value: 'A separate, smaller SANParks conservation fee applies for the penguin viewing boardwalks.' },
      { label: 'Getting there', value: 'Self-drive is the practical option — public transport doesn\'t cover the full loop — or book a half-/full-day peninsula tour.' },
    ],
    beforeYouGo: [
      'Chapman\'s Peak Drive\'s current open/closed status — it closes periodically for weather and maintenance, so check before setting out.',
      'Current SANParks fees for Cape Point and Boulders Beach.',
    ],
    priceRange: 'R400 – R450',
    isAccessibleForFree: false,
    nearby:
      'This is a full-day loop combining several stops — Hout Bay, Chapman\'s Peak, Cape Point and Boulders Beach are typically all done in one trip rather than separately.',
    tieIns: [
      { label: 'Accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'Cape Point Road, Table Mountain National Park', addressLocality: 'Cape Town', addressRegion: 'Western Cape', addressCountry: 'ZA' },
    geo: { lat: -34.3568, lng: 18.4970 },
    imageNeeded: 'Real photo of Chapman\'s Peak Drive\'s cliff road or the Cape Point lighthouse — not a generic coastal-drive stock image.',
    imageUrl: '/media/tourism/cape-point-chapmans-peak.jpg',
    imageCredit: 'Photo: kallerna / Wikimedia Commons, CC BY-SA 4.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Chapmans_Peak_Drive_2.jpg',
  },
  {
    slug: 'kirstenbosch-botanical-garden',
    name: 'Kirstenbosch Botanical Garden',
    pageTitle: 'Kirstenbosch National Botanical Garden | Cape Town',
    metaDescription:
      'A fynbos garden on the slopes of Table Mountain, with the Boomslang canopy walkway and the famous summer Sunset Concerts — one of the world\'s great botanical gardens.',
    teaser: 'Fynbos garden on the eastern slope, with the canopy Boomslang walkway and summer sunset concerts.',
    whatItIs:
      "Kirstenbosch National Botanical Garden sits on the eastern slopes of Table Mountain in Newlands, and is consistently rated among the finest botanical gardens in the world. It's dedicated to South Africa's indigenous flora, especially the fynbos of the Cape Floral Kingdom — one of only six floral kingdoms on Earth, and the smallest and richest per square metre.",
    whatToDo:
      "Wide lawns and themed sections (fynbos, cycads, a fragrance garden, a medicinal-plant garden) make for an easy half-day walk, and the Centenary Tree Canopy Walkway (\"the Boomslang\") gives an elevated view over the forest canopy. From November to April the garden hosts the Kirstenbosch Summer Sunset Concerts on the main lawn — a Cape Town institution, bring a picnic and blanket. There are also guided walks, a well-regarded restaurant, and a shop, and the gardens back directly onto hiking trails up Table Mountain's eastern slope for those wanting to continue further.",
    practical: [
      { label: 'Address', value: 'Rhodes Drive, Newlands, Cape Town, 7735' },
      { label: 'Hours', value: 'Daily, typically 08:00–19:00 in summer (Sep–Mar) and 08:00–18:00 in winter (Apr–Aug); the gates close earlier than the garden itself, so check current times.' },
      { label: 'Entry fee', value: 'Around R220–R250 for adult non-residents, discounted for South African residents/pensioners/students with ID — set by SANBI and revised periodically.' },
      { label: 'Getting there', value: 'Self-drive with on-site parking, or a short taxi/rideshare from the Southern Suburbs.' },
    ],
    beforeYouGo: [
      'Current entry fees and seasonal gate times.',
      'Sunset Concert dates and ticket prices, which are announced separately each summer season.',
    ],
    priceRange: 'R220 – R250',
    isAccessibleForFree: false,
    nearby:
      'Directly below Table Mountain\'s eastern slope — some visitors hike up from Kirstenbosch rather than driving to the cableway. Newlands and the Southern Suburbs\' restaurants are a short drive away.',
    tieIns: [
      { label: 'Table Mountain Cableway', href: '/tourism/table-mountain-cableway/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Rhodes Drive', addressLocality: 'Newlands', addressRegion: 'Western Cape', postalCode: '7735', addressCountry: 'ZA' },
    geo: { lat: -33.9881, lng: 18.4322 },
    imageNeeded: 'Real photo of the Boomslang canopy walkway or the fynbos lawns — not a generic botanical-garden stock image.',
    imageUrl: '/media/tourism/kirstenbosch-botanical-garden.jpg',
    imageCredit: 'Photo: Axxter99 / Wikimedia Commons, CC BY-SA 3.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Boomslang_Kirstenbosch_1.jpg',
  },
  {
    slug: 'robben-island-museum',
    name: 'Robben Island Museum',
    pageTitle: 'Robben Island Museum | Nelson Mandela\'s Prison Island',
    metaDescription:
      'Ferry from the V&A Waterfront to the island where Nelson Mandela was imprisoned for 18 years — tours led by former political prisoners, a UNESCO World Heritage Site.',
    teaser: 'Ferry from the Waterfront to the prison island, with tours led by former political prisoners.',
    whatItIs:
      "Robben Island lies about 7 km off the Cape Town coast in Table Bay, and served as a prison for political dissidents under apartheid — most famously Nelson Mandela, who spent 18 of his 27 years of imprisonment here. It became a museum after 1994 and was declared a UNESCO World Heritage Site in 1999, and remains one of South Africa's most significant heritage sites.",
    whatToDo:
      "The standard tour combines a roughly 30-minute ferry crossing from the Nelson Mandela Gateway at the V&A Waterfront with a guided bus tour of the island (the limestone quarry, the leper graveyard, the village) and a walking tour of the maximum-security prison itself, including Mandela's actual cell — this part is led by former political prisoners, which makes it one of the more powerful heritage experiences in the country. The full round trip typically takes 3.5–4.5 hours including the crossings, and sailings can be cancelled in rough seas, so it's worth allowing flexibility in your schedule.",
    practical: [
      { label: 'Departure point', value: 'Nelson Mandela Gateway, V&A Waterfront, Cape Town' },
      { label: 'Ticket price', value: 'Around R600–R650 for adults including the return ferry, discounted for children — book online in advance, ideally several days to weeks ahead in peak season, as tours regularly sell out.' },
      { label: 'Duration', value: 'Approximately 3.5–4.5 hours round trip, including both ferry crossings and the island tour.' },
      { label: 'Weather', value: 'Ferry sailings can be cancelled or delayed in rough sea conditions — build in a buffer day if this is a must-do on a short visit.' },
    ],
    beforeYouGo: [
      'Current ticket prices and sailing schedule — book directly through the official Robben Island Museum site to avoid resale mark-ups.',
      'Sea conditions can cancel sailings with little notice; check the operator\'s status before travelling to the departure point.',
    ],
    priceRange: 'R600 – R650',
    isAccessibleForFree: false,
    nearby:
      'Departs directly from the V&A Waterfront — combine with a morning or afternoon at the Waterfront\'s other attractions either side of your sailing.',
    tieIns: [
      { label: 'V&A Waterfront', href: '/tourism/va-waterfront/' },
    ],
    address: { streetAddress: 'Nelson Mandela Gateway, V&A Waterfront', addressLocality: 'Cape Town', addressRegion: 'Western Cape', postalCode: '8001', addressCountry: 'ZA' },
    geo: { lat: -33.8065, lng: 18.3708 },
    imageNeeded: 'Real photo of the prison building, Mandela\'s cell, or the ferry crossing — not a generic island/harbour stock image, and be mindful of the site\'s significance when choosing an image.',
    imageUrl: '/media/tourism/robben-island-museum.jpg',
    imageCredit: 'Photo: Moheen Reeyad / Wikimedia Commons, CC BY-SA 4.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:B-Section_courtyard,_Maximum_Security_Prison,_Robben_Island_(01).jpg',
  },
  {
    slug: 'stellenbosch-winelands',
    name: 'Stellenbosch Winelands',
    pageTitle: 'Stellenbosch Winelands | Cape Town Day Trip',
    metaDescription:
      'Oak-lined university town at the heart of the Cape Winelands, forty-five minutes from Cape Town, with hundreds of wine estates, tastings and cellar tours.',
    teaser: 'Oak-lined town forty-five minutes out, with several hundred estates on the surrounding routes.',
    whatItIs:
      "Stellenbosch is South Africa's second-oldest town (founded 1679) and the historic heart of the Cape Winelands, roughly 45 minutes east of Cape Town. Its oak-lined streets and Cape Dutch architecture are a draw in their own right, and it sits at the centre of one of the country's most concentrated wine-producing regions, with several hundred estates spread across the surrounding Stellenbosch, Franschhoek and Paarl routes.",
    whatToDo:
      "The town centre rewards an hour or two of walking — Dorp Street's historic facades, the Village Museum, and a student-town café scene from the University of Stellenbosch. Most visitors' main reason to come, though, is the wine: estates range from historic names with formal tasting rooms and cellar tours to smaller boutique producers, many with restaurants attached, and a wine tram/shuttle service links several without needing a designated driver. A single day can realistically cover the town plus 2–3 estates; a proper winelands trip (adding Franschhoek and/or Paarl) is worth two days.",
    practical: [
      { label: 'Distance from Cape Town', value: 'Approx. 45 km via the N1/R310 (about 45 minutes drive).' },
      { label: 'Tastings', value: 'Typically R100–R200+ per person per estate for a standard tasting, often waived with a purchase — prices vary widely by estate.' },
      { label: 'Getting there', value: 'Self-drive (note: driving after tastings — arrange a designated driver, shuttle or tour), or a wine-tram/tour operator from Cape Town.' },
      { label: 'Best time to visit', value: 'Harvest season (Feb–Apr) is the most atmospheric, with picking and cellar activity visible; the region is pleasant most of the year.' },
    ],
    beforeYouGo: [
      'Individual estate tasting fees and opening hours, which vary by producer and season.',
      'If self-driving between estates, arrange a designated driver or a shuttle service in advance.',
    ],
    nearby:
      'Often combined with Franschhoek (a scenic wine-tram town) and Paarl on a longer winelands trip.',
    tieIns: [
      { label: 'Accommodation', href: '/category/accommodation/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Stellenbosch', addressLocality: 'Stellenbosch', addressRegion: 'Western Cape', postalCode: '7600', addressCountry: 'ZA' },
    geo: { lat: -33.9321, lng: 18.8602 },
    imageNeeded: 'Real photo of Dorp Street, an oak-lined avenue, or a vineyard on one of the estate routes — not a generic vineyard stock image.',
    imageUrl: '/media/tourism/stellenbosch-winelands.jpg',
    imageCredit: 'Photo: South African Tourism / Wikimedia Commons, CC BY 2.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Stellenbosch_Wine_Route,_Western_Cape,_South_Africa_(20317525878).jpg',
  },
];

export const attractionBySlug = (slug: string): Attraction | undefined =>
  ATTRACTIONS.find((a) => a.slug === slug);
