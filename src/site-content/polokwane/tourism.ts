// Tourism content — hand-authored from the CSC "Tourism Page — Content Update
// Package" brief (6 Sep 2026). Overview page at /tourism/, one sub-page per
// attraction at /tourism/<slug>/ driven by src/pages/tourism/[slug].astro.
//
// Data status (2026-09-06): the five original attractions' addresses, opening
// hours and entry fees are owner-confirmed and in both the on-page copy and
// the JSON-LD. Polokwane Golf Club and The Ranch Golf Course were added later
// and still need green fees + seasonal tee-off hours confirmed (see their
// `beforeYouGo`) — kept out of the JSON-LD until then. STILL OUTSTANDING for
// all: exact `geo` coordinates (values below are approximate — source from
// Google Maps) and the real photos (each page carries an `imageNeeded` note).

export type { PracticalRow, TieIn, Attraction } from '../attraction-types';
import type { Attraction } from '../attraction-types';

export const TOURISM_OVERVIEW = {
  pageTitle: 'Things to Do in Polokwane | Attractions, Nature & Day Trips',
  metaDescription:
    "Discover Polokwane's top attractions, nature reserves, museums and nearby day trips — from Bakone Malapa to Magoebaskloof. Plan your visit to Limpopo's capital.",
  intro:
    "Polokwane is the capital of Limpopo Province and the gateway to some of South Africa's best-kept travel secrets — from Big Five game reserves on the city's doorstep to the mist-covered forests of Magoebaskloof less than an hour away. As the largest city between Johannesburg and the Zimbabwean border, it combines everyday city convenience — malls, restaurants, accommodation — with genuine bushveld and cultural experiences you won't find closer to Gauteng. Whether you're passing through on the N1 towards Kruger National Park, or staying to explore Limpopo properly, this guide covers the attractions, nature spots, and day trips worth your time, plus practical details on when to go and how to get there.",
  practical: [
    {
      heading: 'Best time to visit',
      body: "Polokwane sits on the Highveld/Bushveld transition, with a summer rainfall pattern: warm, wet summers (Nov–Mar, afternoon thunderstorms common) and dry, mild winters (Jun–Aug, cold mornings, warm days). May–October is generally best for game viewing (reserves); November–March is best for waterfalls and greenery (Magoebaskloof).",
    },
    {
      heading: 'Getting around',
      body: 'Most attractions are reachable by car within 20 minutes of the CBD; day trips to Magoebaskloof/Debengeni add roughly an hour each way. Public transport options are limited — car hire or a shuttle/tour operator is the practical option for visitors without their own vehicle. Polokwane International Airport has direct flights from Johannesburg.',
    },
    {
      heading: 'Safety basics',
      body: "Standard South African travel precautions apply: don't leave valuables visible in parked cars, stick to marked trails in reserves, and confirm current road conditions before self-driving to more remote falls/forest areas after heavy rain.",
    },
  ],
};

export const ATTRACTIONS: Attraction[] = [
  {
    slug: 'bakone-malapa-open-air-museum',
    name: 'Bakone Malapa Open-Air Museum',
    pageTitle: 'Bakone Malapa Open-Air Museum | Polokwane Tourism',
    metaDescription:
      'Visit a reconstructed Northern Sotho village near Polokwane — traditional huts, fire-making and beer-brewing demonstrations, and guided cultural tours.',
    teaser: 'A living Northern Sotho cultural village on the R37, about 15 minutes from the city centre.',
    whatItIs:
      "Bakone Malapa Open-Air Museum is a living cultural village on the R37 (Chuenespoort Road), roughly 9–15 km from Polokwane's city centre. It's the only reconstructed Northern Sotho (Bakone) village of its kind in Limpopo, built on the original site of an ancient settlement to show how the Bakone people lived roughly 250 years ago.",
    whatToDo:
      'Guided tours take visitors through traditional huts and communal areas while guides demonstrate fire-making, maize-grinding, pottery, and traditional beer-brewing. Craft displays and beadwork are on show throughout the village, and guides — often members of the Bakone community — answer questions on daily life, social structure, and survival skills of the period. A full guided visit takes around an hour, longer if your guide goes in-depth. It\'s well suited to families, school groups, and anyone wanting a genuine cultural (not just scenic) introduction to Limpopo.',
    practical: [
      { label: 'Address', value: 'R37, Chuenespoort Road, Polokwane, 0700' },
      { label: 'Hours', value: 'Monday–Friday, 08:00–15:30 (closing may extend to 16:00). Closed on Saturdays, Sundays and public holidays, except by prior arrangement for groups.' },
      { label: 'Entry fee', value: 'R18 adults / R12 children.' },
      { label: 'Booking', value: 'Walk-ins possible on weekdays; groups, guided tours and any weekend visit must be arranged in advance.' },
      { label: 'Getting there', value: 'Tarred road, easily accessible by car; no 4x4 needed.' },
    ],
    beforeYouGo: [],
    openingHours: ['Mo-Fr 08:00-15:30'],
    priceRange: 'R12 – R18',
    nearby:
      "Combine with a visit to Polokwane Game Reserve, roughly 15–20 minutes away, for a full cultural-plus-wildlife day. Pair with a meal from the Bendor or city-centre restaurant listings.",
    tieIns: [
      { label: 'Polokwane Game Reserve', href: '/tourism/polokwane-game-reserve/' },
      { label: 'Bendor', href: '/suburb/bendor/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'R37 (Chuenespoort Road)', addressLocality: 'Polokwane', addressRegion: 'Limpopo', postalCode: '0700', addressCountry: 'ZA' },
    geo: { lat: -23.9930, lng: 29.5320 },
    imageNeeded: 'Real photo of the reconstructed village / traditional huts, or a guide demonstrating a craft — not a generic "African village" stock image.',
  },
  {
    slug: 'polokwane-game-reserve',
    name: 'Polokwane Game Reserve',
    pageTitle: 'Polokwane Game Reserve | Wildlife & Hiking in Polokwane',
    metaDescription:
      'One of the only municipally-run game reserves inside a South African city — white lions, giraffe, zebra, and hiking or mountain-biking trails minutes from Polokwane CBD.',
    teaser: 'Self-drive game viewing and trails — including white lions — about 10 minutes from the CBD.',
    whatItIs:
      "Polokwane Game Reserve sits inside the city itself — a rare case of a functioning game reserve, known especially for its white lions, within a South African metro's boundaries. It's roughly a 10-minute drive from the CBD, making it the easiest \"real bushveld\" experience for visitors on a tight schedule.",
    whatToDo:
      "Self-drive game viewing on well-maintained gravel roads, plus marked hiking and mountain-biking trails (a popular 4 km trek among locals). Species include white lions, cheetah, hyena, giraffe, zebra and a range of antelope, with over 300 recorded bird species making it a strong birding spot too. There's a braai (BBQ) area near a small dam, popular for weekend outings, picnics, and even functions like birthday parties or baby showers.",
    practical: [
      { label: 'Address', value: 'Polokwane Game Reserve, off the R71, Polokwane' },
      { label: 'Hours', value: 'Daily, 06:00–18:00 (gates close promptly).' },
      { label: 'Entry fee', value: 'Standard entry approx. R50 per adult / R30 per child; hiking-trail access around R35 per adult. Nominal municipal fees, revised periodically.' },
      { label: 'Best time to visit', value: 'Dry season (May–October) for easier wildlife viewing at water sources.' },
      { label: 'Getting there', value: 'Sedan-accessible on main routes; 4x4 recommended only for off-road sections after rain.' },
    ],
    beforeYouGo: [],
    openingHours: ['Mo-Su 06:00-18:00'],
    priceRange: 'R30 – R50',
    nearby:
      'Easy to combine with Bakone Malapa Open-Air Museum (15–20 minutes away). For visitors who would rather stay near the reserve than day-trip from the CBD, browse the accommodation listings.',
    tieIns: [
      { label: 'Bakone Malapa Open-Air Museum', href: '/tourism/bakone-malapa-open-air-museum/' },
      { label: 'Accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'Off the R71', addressLocality: 'Polokwane', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -23.9430, lng: 29.4720 },
    imageNeeded: 'Real photo of wildlife in the reserve (white lion, giraffe or zebra) or the hiking trail — avoid unrelated Kruger/generic safari stock photos.',
    imageUrl: '/media/tourism/polokwane-game-reserve.jpg',
    imageCredit: 'Photo: Derek Keats / Wikimedia Commons, CC BY 2.0 — a Marico flycatcher photographed in the reserve',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Marico_flycatcher,_Bradornis_mariquensis_at_Polokwane_Nature_Reserve,_Polokwane,_Limpopo,_South_Africa_(14678516682).jpg',
  },
  {
    slug: 'hugh-exton-photographic-museum',
    name: 'Hugh Exton Photographic Museum',
    pageTitle: 'Hugh Exton Photographic Museum | Polokwane History',
    metaDescription:
      'See Polokwane\'s history through the lens of pioneer photographer Hugh Exton — early 20th-century photographs documenting the growth of the city, formerly Pietersburg.',
    teaser: "Early 1900s photographs charting the growth of Pietersburg/Polokwane, in the city centre.",
    whatItIs:
      "The Hugh Exton Photographic Museum, in Polokwane's city centre, houses the archive of Hugh Exton, a photographer who documented the town — then known as Pietersburg — from the early 1900s onward. It's a compact but genuinely unique record of how the city grew.",
    whatToDo:
      "Exhibits walk through decades of black-and-white photography covering street scenes, early buildings, transport, and daily life in early Pietersburg/Polokwane. It's a quick visit (30–45 minutes) but rewarding for anyone interested in local history or photography.",
    practical: [
      { label: 'Address', value: 'Civic Square, corner of Church Street & Bodenstein Street, Polokwane Central, 0700.' },
      { label: 'Hours', value: 'Monday–Friday, 09:00–15:30. Closed on weekends and public holidays.' },
      { label: 'Entry fee', value: 'Free — Polokwane Municipality does not charge admission to the collection.' },
      { label: 'Getting there', value: 'Central and walkable from CBD parking and other city-centre attractions.' },
    ],
    beforeYouGo: [],
    openingHours: ['Mo-Fr 09:00-15:30'],
    isAccessibleForFree: true,
    nearby:
      'Pair with the Polokwane Art Museum, usually nearby in the same civic precinct, for a combined half-day "museum walk". City-centre restaurants are a short walk away.',
    tieIns: [
      { label: 'Polokwane Central', href: '/suburb/polokwane-central/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Civic Square, Cnr Church Street & Bodenstein Street, Polokwane Central', addressLocality: 'Polokwane', addressRegion: 'Limpopo', postalCode: '0700', addressCountry: 'ZA' },
    geo: { lat: -23.9008, lng: 29.4530 },
    imageNeeded: 'A real archive photograph (if usage rights allow) or a current photo of the museum building / exhibit space — check copyright before using any Exton archive image.',
    imageUrl: '/media/tourism/hugh-exton-photographic-museum.jpg',
    imageCredit: 'Photo: JasonMoe289 / Wikimedia Commons, CC BY-SA 4.0 — Polokwane city centre, where the museum is located',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Polokwane_(Pietersbrug)_City_Centre_and_Part_of_CBD.jpg',
  },
  {
    slug: 'meropa-casino-entertainment-world',
    name: 'Meropa Casino & Entertainment World',
    pageTitle: 'Meropa Casino & Entertainment World | Polokwane Nightlife',
    metaDescription:
      'Polokwane\'s main casino and entertainment complex — gaming floor, restaurants, cinema, and event venue in one location on the N1.',
    teaser: "Polokwane's biggest entertainment complex — casino, cinema, restaurants and events on the N1.",
    whatItIs:
      "Meropa Casino & Entertainment World is Polokwane's largest entertainment complex, combining a casino floor with restaurants, a cinema, and event/conference facilities. It's a common stop for visitors wanting evening entertainment beyond nature and heritage sites.",
    whatToDo:
      'Gaming tables and slot machines, a cinema, several restaurant options under one roof, and regular live entertainment or events. It works best as the "evening / rainy day" option rather than a daytime nature activity.',
    practical: [
      { label: 'Address', value: 'Meropa Casino & Entertainment World, Plot 59, Sterkloop, Polokwane, 0700.' },
      { label: 'Hours', value: 'Slot machines: open 24 hours on Fridays and Saturdays; Sunday to Thursday 08:00–03:00. Gaming tables: daily from 11:00, closing according to player demand. Restaurants and cinema keep their own hours.' },
      { label: 'Entry', value: 'The casino floor is restricted to persons aged 18 and older; valid ID may be required.' },
      { label: 'Getting there', value: 'On the N1, well signposted, with ample parking.' },
    ],
    beforeYouGo: [],
    openingHours: ['Su-Th 08:00-03:00', 'Fr-Sa 00:00-23:59'],
    nearby:
      'Several hotels cluster around this area — see the nearby accommodation listings — and the complex\'s own restaurants are covered under the dining listings.',
    tieIns: [
      { label: 'Accommodation', href: '/category/accommodation/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Plot 59, Sterkloop', addressLocality: 'Polokwane', addressRegion: 'Limpopo', postalCode: '0700', addressCountry: 'ZA' },
    geo: { lat: -23.8730, lng: 29.4990 },
    imageNeeded: 'Real exterior or interior photo of the complex — do not use generic casino stock imagery.',
  },
  {
    slug: 'polokwane-golf-club',
    name: 'Polokwane Golf Club',
    pageTitle: 'Polokwane Golf Club | Golf in Polokwane',
    metaDescription:
      "One of South Africa's oldest golf clubs (est. 1863) and Retief Goosen's home club — an 18-hole, par-72 championship parkland course near central Polokwane.",
    teaser: "An 18-hole par-72 parkland course dating to 1863 — Retief Goosen's home club, near the CBD.",
    whatItIs:
      "Polokwane Golf Club, on Voortrekker Street near the city centre, is one of the oldest golf clubs in South Africa — founded in 1863, when both the town and the club were still called Pietersburg. It is best known as the club where two-time US Open champion Retief Goosen learned the game while growing up in the city.\n\nThe 18-hole, par-72 championship parkland course runs about 6,240 metres off the back tees, with three tee options for different levels of player. The layout was reworked by course architect Peter Matkovich in 1992, and the club hosted a Sunshine Tour event for nine years running (1998–2006).",
    whatToDo:
      '18 holes of parkland golf, a practice area, and a clubhouse with a bar and restaurant. Visitors and societies are welcome — book a tee time ahead, especially on weekends and public holidays. Green fees, cart hire and club rental are arranged at the pro shop.',
    practical: [
      { label: 'Address', value: 'Voortrekker Street, Polokwane, 0699' },
      { label: 'Hours', value: 'Open daily from early morning; tee-off times and pro-shop hours vary seasonally — confirm when booking.' },
      { label: 'Green fees', value: 'Vary by day and season — confirm current visitor green fees, cart and club hire with the pro shop.' },
      { label: 'Booking', value: 'Book tee times in advance through the pro shop, particularly for weekends, public holidays and society days.' },
      { label: 'Getting there', value: 'Central, just off Voortrekker Street; a few minutes from the CBD.' },
    ],
    beforeYouGo: [
      'Current visitor green fees, cart hire and club-rental rates.',
      'Seasonal tee-off and pro-shop hours.',
    ],
    nearby:
      'Central enough to combine with a city-centre museum visit or a meal — see the restaurant and accommodation listings.',
    tieIns: [
      { label: 'Polokwane Central', href: '/suburb/polokwane-central/' },
      { label: 'Accommodation', href: '/category/accommodation/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Voortrekker Street', addressLocality: 'Polokwane', addressRegion: 'Limpopo', postalCode: '0699', addressCountry: 'ZA' },
    geo: { lat: -23.9130, lng: 29.4460 },
    imageNeeded: 'Real photo of the Polokwane Golf Club course or clubhouse — no generic golf stock imagery.',
    imageUrl: '/media/tourism/polokwane-golf-club.jpg',
    imageCredit: 'Photo: South African Tourism / Wikimedia Commons, CC BY 2.0 — illustrative (Legends Golf Estate, Limpopo — not Polokwane Golf Club itself)',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Golf_course,_Legends_Golf_Estate,_Limpopo,_South_Africa_(6252687015).jpg',
  },
  {
    slug: 'the-ranch-golf-course',
    name: 'The Ranch Golf Course',
    pageTitle: 'The Ranch Golf Course | Golf near Polokwane',
    metaDescription:
      'A 12-hole executive par-3 course and academy at The Ranch Resort, 25 km south of Polokwane on the N1 — bushveld views bordering a private game conservancy.',
    teaser: 'A 12-hole executive par-3 course and academy at The Ranch Resort, 25 km south on the N1.',
    whatItIs:
      "The Ranch Golf Course is a 12-hole executive par-3 course and golf academy at The Ranch Resort, roughly 25 km south of Polokwane just off the N1. The course opened in May 2010 and looks out over open bushveld, with a 1,000-hectare private conservancy and the resort's lion park bordering the fairways.\n\nThe Ranch Resort itself was founded by the Shearer family in 1960 and now operates as a Protea Hotel, so the golf pairs naturally with a stay, a meal, or a game drive.",
    whatToDo:
      'A quick, walkable 12-hole par-3 round suited to beginners, families and anyone wanting a short game rather than a full 18, plus a golf academy for lessons. The wider resort offers game drives, horseback safaris and birding (25+ game species, 250+ birds recorded), and day visitors can usually use the restaurant and grounds.',
    practical: [
      { label: 'Address', value: 'The Ranch Resort, off the N1 (R101), approx. 25 km south of Polokwane' },
      { label: 'Hours', value: 'Daytime golf; confirm current tee-off times and day-visitor access with the resort.' },
      { label: 'Green fees', value: 'Confirm current green fees, academy/lesson rates and any day-visitor charge with The Ranch Resort.' },
      { label: 'Booking', value: 'Book through The Ranch Resort, particularly at weekends and school holidays.' },
      { label: 'Getting there', value: 'About 25 km south of Polokwane on the N1 towards Mokopane; tarred road, well signposted.' },
    ],
    beforeYouGo: [
      'Current green fees and any day-visitor / facility-access charge.',
      'Tee-off times and whether non-guests can play.',
    ],
    nearby:
      'The course is part of a resort — see the accommodation listings for staying over rather than driving out and back.',
    tieIns: [
      { label: 'Accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'The Ranch Resort, N1 South', addressLocality: 'Polokwane', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -24.0870, lng: 29.3660 },
    imageNeeded: 'Real photo of The Ranch golf course or resort grounds — no generic golf/resort stock imagery.',
    imageUrl: '/media/tourism/the-ranch-golf-course.jpg',
    imageCredit: 'Photo: Heribert Bechen / Wikimedia Commons, CC BY-SA 2.0 — illustrative bushveld lodge grounds (Bongani Lodge — not The Ranch itself)',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:DSC04833_L4_BONGANI_LODGE_(49739470122).jpg',
  },
  {
    slug: 'magoebaskloof-debengeni-falls',
    name: 'Magoebaskloof & Debengeni Falls',
    pageTitle: 'Magoebaskloof & Debengeni Falls | Day Trip from Polokwane',
    metaDescription:
      'Mist forests, canopy tours and waterfalls less than an hour from Polokwane — the Magoebaskloof day trip covers Debengeni Falls, forestry drives and mountain views.',
    teaser: 'Mist forest, an escarpment pass and an 80 m waterfall — about an hour east on the R71.',
    whatItIs:
      'Magoebaskloof is a mountain pass and forestry region roughly 50 km (45–60 minutes) from Polokwane on the R71 towards Tzaneen, known for indigenous and plantation forest, mist, and a cluster of waterfalls. Debengeni Falls, inside the region, is the best-known and most accessible of these.',
    whatToDo:
      'The drive itself is a highlight — the R71 climbs through switchbacks with viewpoints over the escarpment. Debengeni Falls drops around 80 metres into a pool with designated swimming and picnic areas, reached via a short walk from the parking area. The wider Magoebaskloof area also offers canopy tours through the forest canopy, hiking trails, and trout fishing at nearby lodges. It works best as a half-day-to-full-day trip rather than a quick stop.',
    practical: [
      { label: 'Distance from Polokwane', value: 'Approx. 50 km via the R71 (45–60 min drive).' },
      { label: 'Debengeni Falls hours', value: 'Daily, 08:00–17:00.' },
      { label: 'Entry fee', value: 'R50 per person for South African citizens (ID required); R75 per person for SADC and other foreign nationals (passport required); children aged 10 and under free. Parking is included with entry.' },
      { label: 'Best time to visit', value: 'Year-round, but water levels (and swimming conditions) are strongest after the summer rainy season (Nov–Mar); mist and cooler temperatures are common on winter mornings.' },
      { label: 'Getting there', value: 'Tarred road (R71) the whole way; a standard sedan is fine.' },
    ],
    beforeYouGo: [],
    openingHours: ['Mo-Su 08:00-17:00'],
    priceRange: 'R50 – R75',
    isAccessibleForFree: false,
    nearby:
      'This is the "escape the city for a day" trip — visitors staying in Polokwane can do it as a day trip from their city accommodation. Magoebaskloof lodges will be flagged separately once they are added as directory listings.',
    tieIns: [
      { label: 'Polokwane accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'R71, Magoebaskloof Pass', addressLocality: 'Magoebaskloof', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -23.8710, lng: 29.9650 },
    imageNeeded: 'Real photo of Debengeni Falls or the misty forest / canopy — one of the more photogenic assets for the whole site; prioritise if only one new photo can be sourced.',
    imageUrl: '/media/tourism/magoebaskloof-debengeni-falls.jpg',
    imageCredit: 'Photo: South African Tourism / Wikimedia Commons, CC BY 2.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Magoebaskloof,_Limpopo,_South_Africa_(2417714031).jpg',
  },
  {
    slug: 'mapungubwe-national-park',
    name: 'Mapungubwe National Park',
    pageTitle: 'Mapungubwe National Park | World Heritage Site near Polokwane',
    metaDescription:
      'A UNESCO World Heritage Site at the Limpopo–Shashe confluence, where three countries meet — Iron Age ruins, the golden rhino story, and Big Five game viewing on the Zimbabwe/Botswana border.',
    teaser: 'World Heritage site at the Limpopo–Shashe confluence, home of the golden rhino — a full day out from Polokwane.',
    whatItIs:
      "Mapungubwe National Park sits at the confluence of the Limpopo and Shashe rivers, where South Africa, Zimbabwe and Botswana meet — roughly a 3–3.5 hour drive north of Polokwane via Musina. It protects the site of the Mapungubwe Kingdom, a sophisticated Iron Age trading civilisation that flourished here from around 1220 to 1290 AD, and was declared a UNESCO World Heritage Site in 2003 for the archaeological evidence of southern Africa's earliest known class-based society.\n\nThe park is best known for the small gold rhino figurine excavated from a royal grave on Mapungubwe Hill in the 1930s — now one of South Africa's most significant archaeological finds, on display at the University of Pretoria's Mapungubwe Museum (a cast is shown at the park's own interpretive centre).",
    whatToDo:
      "Guided heritage tours of Mapungubwe Hill and the K2 archaeological site explain the kingdom's rise and the gold-rhino discovery — these must be booked through the park, as the hill itself is not open to unguided visitors. Beyond the heritage side, this is also a proper game park: self-drive routes and a treetop walkway along the Limpopo River floodplain give views over ancient baobabs, elephant, eland and a wide range of riverine birdlife, with the option of spotting all three countries from a single viewpoint. Most visitors combine the heritage tour with a half-day game drive.",
    practical: [
      { label: 'Distance from Polokwane', value: 'Approx. 280 km via the N1 through Musina (3–3.5 hour drive).' },
      { label: 'Conservation fee', value: 'Standard SANParks daily conservation fee applies (South African citizens/residents pay a lower rate with ID) — confirm the current rate on the SANParks website before travelling.' },
      { label: 'Heritage tours', value: 'Guided Mapungubwe Hill / K2 tours run on a set daily schedule and should be booked in advance, either online or at the gate on arrival.' },
      { label: 'Getting there', value: 'Tarred road via the N1 to Musina, then a signposted gravel/tar approach road; a sedan is generally fine outside the wet season.' },
    ],
    beforeYouGo: [
      'Current SANParks conservation fees and heritage-tour booking times, which change periodically.',
      'Fuel up in Musina — there is limited fuel between there and the park gate.',
    ],
    nearby:
      "This is a full-day (or overnight) trip from Polokwane, not a quick stop — most visitors either do a long day trip or stay over at the park's own rest camps. Pair with a stop in Musina on the way up or back.",
    tieIns: [
      { label: 'Polokwane accommodation', href: '/category/accommodation/' },
    ],
    address: { streetAddress: 'Mapungubwe National Park, off the N1 via Musina', addressLocality: 'Musina', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -22.2020, lng: 29.3450 },
    imageNeeded: 'Real photo of the Limpopo/Shashe confluence, the treetop walkway, or Mapungubwe Hill — not a generic gold-artefact or unrelated safari stock image.',
    imageUrl: '/media/tourism/mapungubwe-national-park.jpg',
    imageCredit: 'Photo: Petrus Potgieter / Wikimedia Commons, CC BY-SA 3.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Landscape_in_the_Mapungubwe_National_Park,_with_zebras.jpg',
  },
  {
    slug: 'modjadji-cycad-reserve',
    name: 'Modjadji Cycad Reserve',
    pageTitle: 'Modjadji Cycad Reserve | Rain Queen\'s Valley near Polokwane',
    metaDescription:
      "The world's largest concentration of a single cycad species, in the valley of South Africa's Rain Queen — hiking trails through an ancient forest about an hour from Polokwane.",
    teaser: "The largest concentration of a single cycad species on earth, in the Rain Queen's valley.",
    whatItIs:
      "Modjadji Cycad Reserve protects a forest of Modjadji cycads (Encephalartos transvenosus) on the slopes above Modjadjiskloof, roughly 65–70 km (about an hour) east of Polokwane on the way to Tzaneen. Some of these cycads are estimated to be several hundred years old and can reach over 10 metres tall, making this the largest single stand of one cycad species anywhere in the world.\n\nThe reserve takes its name from the Balobedu royal line's Rain Queen, Modjadji, whose royal kraal lies in the same valley — the cycads have long held ceremonial significance for the Balobedu people, and the reserve sits within their traditional territory.",
    whatToDo:
      "A network of walking trails winds through the cycad forest and up onto the hillside, with viewpoints over the valley — most visitors walk the main loop in 1–2 hours. Interpretive signage covers the cycads' age and ecology, and guides are sometimes available at the entrance to explain both the plants and the cultural history of the Rain Queen. It's a quiet, shaded walk rather than an adrenaline activity, and works well combined with a broader Magoebaskloof-area day out.",
    practical: [
      { label: 'Distance from Polokwane', value: 'Approx. 65–70 km via the R36 towards Tzaneen/Modjadjiskloof (roughly 1 hour drive).' },
      { label: 'Entry fee', value: 'A modest per-person conservation/entry fee applies — confirm the current amount with Limpopo Tourism or the reserve gate before travelling.' },
      { label: 'Best time to visit', value: 'Year-round — the cycad forest is evergreen — though the drive and views are at their best in the dry winter months (May–August) with clearer air.' },
      { label: 'Getting there', value: 'Tarred road most of the way, with a short signposted approach road to the reserve gate; a standard sedan is fine.' },
    ],
    beforeYouGo: [
      'Current entry fee and gate hours, which are set locally and change from time to time.',
    ],
    nearby:
      'Combine with a Magoebaskloof/Debengeni Falls day out, since both are on the same eastward route out of Polokwane.',
    tieIns: [
      { label: 'Magoebaskloof & Debengeni Falls', href: '/tourism/magoebaskloof-debengeni-falls/' },
    ],
    address: { streetAddress: 'Modjadji Cycad Reserve, R36', addressLocality: 'Modjadjiskloof', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -23.6360, lng: 30.1720 },
    imageNeeded: 'Real photo of the cycad forest or the valley viewpoint — not a generic palm-tree/cycad stock image.',
    imageUrl: '/media/tourism/modjadji-cycad-reserve.jpg',
    imageCredit: 'Photo: Krzysztof Ziarnek, Kenraiz / Wikimedia Commons, CC BY-SA 4.0 — Encephalartos transvenosus, the Modjadji cycad',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Encephalartos_transvenosus_kz01.jpg',
  },
  {
    slug: 'peter-mokaba-stadium',
    name: 'Peter Mokaba Stadium',
    pageTitle: 'Peter Mokaba Stadium | Sport & Events in Polokwane',
    metaDescription:
      'The baobab-shaped 2010 World Cup stadium in Polokwane — home to PSL football and occasional concerts and events, a short drive from the city centre.',
    teaser: 'World Cup stadium shaped after the baobab, hosting PSL fixtures through the season.',
    whatItIs:
      "Peter Mokaba Stadium, on the northern edge of Polokwane, was built for the 2010 FIFA World Cup and is one of the tournament's most recognisable venues for its roof design, modelled on the shape of a baobab tree in reference to Limpopo's iconic trees. It holds roughly 45,000 spectators and is named after Peter Mokaba, the Limpopo-born anti-apartheid activist and ANC Youth League leader.",
    whatToDo:
      "The stadium is the home ground for Premier Soccer League fixtures involving Polokwane's top-flight clubs, and hosts occasional concerts, rugby matches and other large events through the year — check current fixtures before planning a visit, since it isn't generally open for casual walk-in tours outside event days. On a match day it's the biggest atmosphere in the city; supporters typically arrive well before kickoff for parking and the pre-match build-up around the grounds.",
    practical: [
      { label: 'Address', value: 'Peter Mokaba Stadium, Bram Fischer Street, Polokwane' },
      { label: 'Access', value: 'Open on match days and event days; ticketed entry via the relevant event promoter or PSL club.' },
      { label: 'Getting there', value: 'A short drive from the CBD, well signposted; expect heavier traffic and parking demand on match days.' },
    ],
    beforeYouGo: [
      'Current match/event schedule and ticket prices, which depend entirely on the fixture or event in question.',
    ],
    nearby:
      'Combine a match day with dinner in the city centre or at Savannah Mall on the way back.',
    tieIns: [
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Bram Fischer Street', addressLocality: 'Polokwane', addressRegion: 'Limpopo', addressCountry: 'ZA' },
    geo: { lat: -23.8560, lng: 29.4680 },
    imageNeeded: 'Real photo of the stadium exterior (baobab-shaped roof) or a match-day crowd — not a generic stadium stock image.',
    imageUrl: '/media/tourism/peter-mokaba-stadium.jpg',
    imageCredit: 'Photo: Brieuc Saffré / Wikimedia Commons, CC BY 2.0',
    imageSourceUrl: 'https://commons.wikimedia.org/wiki/File:Mokaba_stadium_(4739619696).jpg',
  },
];

export const attractionBySlug = (slug: string): Attraction | undefined =>
  ATTRACTIONS.find((a) => a.slug === slug);
