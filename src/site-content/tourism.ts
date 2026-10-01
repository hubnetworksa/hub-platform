// Content for the mockup's "Things to do" page (/tourism/), one block per city.
// Ported from the mockup's tourismVals(). Prices and times are the mockup's own
// figures and should be confirmed with each operator before launch. `sponsored`
// is demo placement only: the page shows the Sponsored badge in the dev preview
// (DEMO_PREMIUM build) and never on a production build.
//
// Picks with a `slug` link to a full detail page authored in
// src/site-content/<city>/tourism.ts (via src/pages/tourism/[slug].astro).
// Itinerary stops with a `slug` link the same way; a stop without one (a
// district, a drive, a meal) is just text — there's no page for it.

export const TOUR_CATEGORIES = ['All', 'Landmark', 'Heritage', 'Outdoors', 'Family', 'Day trip'] as const;

export interface TourPick {
  name: string;
  cat: string;
  suburb: string;
  price: string;
  time: string;
  sponsored: boolean;
  blurb: string;
  /** Internal page for this attraction, when one exists (/tourism/<slug>/). */
  slug?: string;
}

export interface ItineraryStop {
  name: string;
  /** Links to /tourism/<slug>/ when this stop has its own detail page. */
  slug?: string;
  /** When in the day/trip this happens, e.g. "07:30" or "Day 2, morning". */
  time: string;
  /** What to actually do here as part of this itinerary — 1–3 sentences. */
  description: string;
}

export interface Itinerary {
  /** Its own page at /tourism/itineraries/<slug>/. */
  slug: string;
  name: string;
  stops: ItineraryStop[];
  time: string;
  /** One-line summary shown on the overview page row. */
  teaser: string;
  /** One or two paragraphs introducing the day on the itinerary's own page. */
  intro: string;
  /** Practical tips — booking, timing, what to bring — shown as a callout on the itinerary page. */
  tips: string[];
}

export interface Season {
  name: string;
  when: string;
  note: string;
}

export interface TourContent {
  blurb: string;
  picks: TourPick[];
  itineraries: Itinerary[];
  seasons: Season[];
}

export const TOURISM: Record<string, TourContent> = {
  pretoria: {
    blurb: 'Jacaranda streets, Union Buildings, the Voortrekker Monument and a working game reserve inside the city limits.',
    picks: [
      { name: 'Union Buildings & Gardens', cat: 'Landmark', suburb: 'Arcadia', price: 'Free', time: '1–2 hours', sponsored: true, blurb: 'Herbert Baker’s terraced gardens above the city, with the Mandela statue and the best skyline view in Pretoria.', slug: 'union-buildings-gardens' },
      { name: 'Voortrekker Monument', cat: 'Heritage', suburb: 'Groenkloof', price: 'R110 adults', time: 'Half day', sponsored: false, blurb: 'Granite monument and heritage site on a ridge, with a museum, walking trails and a viewing dome.', slug: 'voortrekker-monument' },
      { name: 'Rietvlei Nature Reserve', cat: 'Outdoors', suburb: 'Rietvallei', price: 'R92 per adult', time: 'Half day', sponsored: true, blurb: 'Self-drive Big-Five-minus-lion reserve twenty minutes from Menlyn — rhino, buffalo, cheetah and 300 bird species.', slug: 'rietvlei-nature-reserve' },
      { name: 'National Zoological Garden', cat: 'Family', suburb: 'Pretoria Central', price: 'R145 adults', time: 'Full day', sponsored: false, blurb: 'One of the largest zoos in the world by species count, with an aerial cableway over the enclosures.', slug: 'national-zoological-garden' },
      { name: 'Freedom Park', cat: 'Heritage', suburb: 'Salvokop', price: 'R150 guided', time: '2–3 hours', sponsored: false, blurb: 'Memorial and museum tracing 3.6 billion years of the region, opposite the Voortrekker Monument.', slug: 'freedom-park' },
      { name: 'Cullinan Diamond Mine Tour', cat: 'Day trip', suburb: 'Cullinan', price: 'R220 surface tour', time: 'Full day', sponsored: false, blurb: 'Surface and underground tours of the mine that produced the largest gem diamond ever found.', slug: 'cullinan-diamond-mine-tour' },
    ],
    itineraries: [
      {
        slug: 'one-day-in-pretoria',
        name: 'One day in Pretoria',
        teaser: 'The classic first-timer’s day — gardens, a heritage monument, and dinner in Menlyn.',
        intro:
          "This is the day to do if you only have one in Pretoria — it covers the two big free/cheap landmarks either side of the CBD, with a proper lunch break built in, and ends somewhere you can eat well and unwind. Start early: Pretoria gets hot fast in summer, and the Union Buildings' gardens are at their best before the heat and the crowds arrive.",
        stops: [
          { name: 'Union Buildings & Gardens', slug: 'union-buildings-gardens', time: '07:30 – 09:00', description: "Arrive as close to opening as you can manage. Walk the terraced gardens down toward the Mandela statue, and take in the view over the city while it's still cool. It's free, so there's no reason to rush." },
          { name: 'Church Square', time: '09:30 – 10:30', description: "A short drive or rideshare into the CBD. This is Pretoria's original civic square, ringed by Edwardian-era government and bank buildings and anchored by a statue of Paul Kruger. Grab a coffee at one of the surrounding cafés and take a slow lap." },
          { name: 'Voortrekker Monument', slug: 'voortrekker-monument', time: '11:00 – 14:00', description: "About 15 minutes' drive south. Go inside for the Hall of Heroes frieze and the Cenotaph, then use the museum and the surrounding nature reserve trails to fill out the visit. There's a restaurant on site, or bring a picnic for the gardens outside." },
          { name: 'Menlyn for dinner', time: '18:00 onward', description: "Head east to Menlyn Park or Menlyn Maine for the evening — a wide choice of restaurants, plus shopping if you want to fill the gap between the monument and dinner." },
        ],
        time: '8 hours',
        tips: [
          'Nothing on this route needs advance booking — it\'s all walk-up.',
          'Wear comfortable shoes; the Voortrekker Monument involves a fair amount of stair climbing to the viewing platform.',
          'Traffic between the CBD and Menlyn builds from about 16:00 on weekdays — leave a buffer if you\'re cutting it close for a dinner booking.',
        ],
      },
      {
        slug: 'weekend-with-kids-pretoria',
        name: 'Weekend with kids',
        teaser: 'A two-day split so nobody is dragging tired children through a fourth stop.',
        intro:
          "Trying to fit the zoo, a science centre, a game drive and a food market into one day with children is how weekends go wrong. Splitting it over two days — one big full-day attraction, then a lighter, more flexible second day — works far better and leaves room to bail early if energy runs out.",
        stops: [
          { name: 'National Zoological Garden', slug: 'national-zoological-garden', time: 'Day 1, full day', description: "Treat this as the whole day. Buy tickets online beforehand to skip the queue, do the aerial cableway early while the enclosures below are calmest, and build in a proper lunch break at one of the on-site restaurants rather than trying to power through." },
          { name: 'Sci-Enza', time: 'Day 2, 09:00 – 11:00', description: "The University of Pretoria's hands-on science centre — interactive exhibits that work well for a shorter morning slot before the kids' attention starts to fade." },
          { name: 'Rietvlei game drive', slug: 'rietvlei-nature-reserve', time: 'Day 2, 11:30 – 14:00', description: "A self-drive loop through the reserve, ideally in the cooler part of the morning when animals are more active. Bring a picnic — there are braai and picnic sites near the dam." },
          { name: 'Hazel Food Market', time: 'Day 2, from 16:00', description: "A relaxed way to end the weekend — food stalls, often live music, and space for kids to run around. Confirm it's running on the day you're planning, since food markets like this typically only operate on specific afternoons/weekends, not daily." },
        ],
        time: '2 days',
        tips: [
          'Book zoo tickets online in advance — it materially cuts queue time at the gate on weekends.',
          'Rietvlei\'s gates close promptly at the posted time, so don\'t plan to linger past it.',
          'Check Hazel Food Market\'s current operating days before building your Sunday around it — it doesn\'t run every day of the week.',
        ],
      },
      {
        slug: 'jacaranda-season-walk',
        name: 'Jacaranda season walk',
        teaser: 'A short self-guided walk through the city’s best jacaranda-lined streets — only worth it in bloom.',
        intro:
          "This one only makes sense during the jacaranda bloom (mid-October to mid-November — see \"When to come\" below); outside that window it's just an ordinary suburban walk. In flower, it's one of the most photographed things about Pretoria. It's a short, flat, self-guided route rather than a full day out.",
        stops: [
          { name: 'Herbert Baker St', time: '08:00 – 08:45', description: "Start here for one of the most consistently photographed jacaranda avenues in the city — best light is early, before traffic and heat haze build up." },
          { name: 'Bourke St', time: '09:00 – 09:30', description: "A short drive or walk over. Another classic canopy street, usually quieter than Herbert Baker Street." },
          { name: 'Loftus', time: '09:45 – 10:15', description: "A quick stop near Loftus Versfeld stadium — more jacarandas along the surrounding streets, and a chance to see the stadium itself if there's nothing on." },
          { name: 'Brooklyn', time: '10:30 – 11:00', description: "Finish in Brooklyn for a coffee — several tree-lined streets here too, and plenty of cafés to end the walk properly." },
        ],
        time: '3 hours',
        tips: [
          'Peak bloom rarely lasts more than two to three weeks within the mid-October to mid-November window, so check reports closer to the time rather than fixing a date months ahead.',
          'Early morning gives the best light for photos and the least traffic on these residential streets.',
        ],
      },
    ],
    seasons: [
      { name: 'Jacaranda bloom', when: 'Mid-October to mid-November', note: 'Seventy thousand trees; Herbert Baker and Bourke streets are the classic routes. Peak bloom rarely lasts more than two to three weeks, so timing is tight.' },
      { name: 'Dry winter game viewing', when: 'May to August', note: 'Best time for Rietvlei — thin bush, animals at the waterholes, and cold mornings that warm up fast by midday.' },
      { name: 'Summer thunderstorms', when: 'November to March', note: 'Warm, green and lush, with reliable late-afternoon Highveld storms — plan outdoor stops for the morning and keep an eye on the sky after 3pm.' },
    ],
  },
  polokwane: {
    blurb: 'Limpopo’s gateway city — game reserves, the Bushveld, and the road to Mapungubwe and the Kruger north.',
    picks: [
      { name: 'Polokwane Game Reserve', cat: 'Outdoors', suburb: 'Polokwane', price: 'R60 per adult', time: 'Half day', sponsored: true, blurb: 'Three thousand hectares on the edge of town with white rhino, sable and twenty-one game species.', slug: 'polokwane-game-reserve' },
      { name: 'Bakone Malapa Open-Air Museum', cat: 'Heritage', suburb: 'Chuenespoort Rd', price: 'R40 adults', time: '2 hours', sponsored: false, blurb: 'Living Northern Sotho village museum showing traditional building, cooking and iron smelting.', slug: 'bakone-malapa-open-air-museum' },
      { name: 'Mapungubwe National Park', cat: 'Day trip', suburb: 'Musina road', price: 'R120 conservation fee', time: 'Full day', sponsored: false, blurb: 'World Heritage site at the Limpopo–Shashe confluence, home of the golden rhino.', slug: 'mapungubwe-national-park' },
      { name: 'Modjadji Cycad Reserve', cat: 'Outdoors', suburb: 'Modjadjiskloof', price: 'R45 per adult', time: 'Half day', sponsored: false, blurb: 'The largest concentration of a single cycad species on earth, in the Rain Queen’s valley.', slug: 'modjadji-cycad-reserve' },
      { name: 'Peter Mokaba Stadium', cat: 'Landmark', suburb: 'Polokwane', price: 'Match dependent', time: '3 hours', sponsored: false, blurb: 'World Cup stadium shaped after the baobab, hosting PSL fixtures through the season.', slug: 'peter-mokaba-stadium' },
      { name: 'Tzaneen & the Magoebaskloof', cat: 'Day trip', suburb: 'R71 east', price: 'Free drive', time: 'Full day', sponsored: true, blurb: 'Mist-belt forest, waterfalls and tea estates an hour east on one of the best drives in the province.', slug: 'magoebaskloof-debengeni-falls' },
      { name: 'Hugh Exton Photographic Museum', cat: 'Heritage', suburb: 'Polokwane', price: 'See page', time: '1 hour', sponsored: false, blurb: 'Early 1900s photographs charting the growth of Pietersburg/Polokwane, in the city centre.', slug: 'hugh-exton-photographic-museum' },
      { name: 'Meropa Casino & Entertainment World', cat: 'Family', suburb: 'N1', price: 'See page', time: 'Evening', sponsored: false, blurb: 'Polokwane’s biggest entertainment complex — casino, cinema, restaurants and events on the N1.', slug: 'meropa-casino-entertainment-world' },
      { name: 'Polokwane Golf Club', cat: 'Outdoors', suburb: 'Polokwane', price: 'See page', time: 'Half day', sponsored: false, blurb: 'An 18-hole par-72 parkland course dating to 1863 — Retief Goosen’s home club, near the CBD.', slug: 'polokwane-golf-club' },
      { name: 'The Ranch Golf Course', cat: 'Outdoors', suburb: 'N1 south', price: 'See page', time: 'Half day', sponsored: false, blurb: 'A 12-hole executive par-3 course and academy at The Ranch Resort, 25 km south on the N1.', slug: 'the-ranch-golf-course' },
    ],
    itineraries: [
      {
        slug: 'one-day-in-polokwane',
        name: 'One day in Polokwane',
        teaser: 'Wildlife at dawn, culture mid-morning, a quick heritage stop, and the mall for the afternoon heat.',
        intro:
          "A single day covering the two attractions worth prioritising in Polokwane itself, timed around the heat rather than against it — the game reserve first thing, indoors by the time the afternoon sun is at its worst.",
        stops: [
          { name: 'Polokwane Game Reserve', slug: 'polokwane-game-reserve', time: '06:00 – 09:00', description: "Gates open at 06:00 — get there for opening. Animals are noticeably more active in the first couple of hours, and it's still cool enough for a proper self-drive loop." },
          { name: 'Bakone Malapa Open-Air Museum', slug: 'bakone-malapa-open-air-museum', time: '10:00 – 11:00', description: "About 15–20 minutes from the game reserve. A guided walk through the reconstructed village — fire-making, grinding and beadwork demonstrations, roughly an hour with a guide." },
          { name: 'Irish House Museum', time: '11:30 – 12:30', description: "A short, easy heritage stop in the city centre — one of Polokwane's older buildings, worth a quick look if you're already downtown." },
          { name: 'Savannah Mall', time: 'From 13:00', description: "Lunch and air conditioning for the hottest part of the day, plus shopping if you need it before heading back to accommodation." },
        ],
        time: '7 hours',
        tips: [
          'None of these stops require advance booking for an individual visitor — only groups need to arrange Bakone Malapa ahead.',
          'The game reserve\'s gates close as promptly as they open — don\'t plan to linger past your allotted window.',
        ],
      },
      {
        slug: 'kruger-gateway-run',
        name: 'Kruger gateway run',
        teaser: 'A through-drive to the Phalaborwa Gate, not a stopping tour — treat it as a travel day.',
        intro:
          "This is a transit route, not a sightseeing itinerary — the point is getting from Polokwane to the Phalaborwa entrance of Kruger National Park in one day, with a practical fuel/food stop at the roughly halfway point in Tzaneen. Budget the whole day for driving, not for lingering.",
        stops: [
          { name: 'Polokwane', time: 'Depart early', description: "Start as early as you comfortably can — an early departure gives more buffer for the Tzaneen stop and arriving at the gate before the midday heat." },
          { name: 'Tzaneen', time: 'Mid-morning stop', description: "The last reliable town for fuel, food and supplies before the gate. Worth a proper stop rather than just fuelling and moving on, since the route beyond here has fewer services." },
          { name: 'Phalaborwa Gate', time: 'Afternoon arrival', description: "The Kruger entrance itself. Confirm gate hours before you leave, since arriving too late in the day can mean a rushed check-in or being turned away." },
        ],
        time: '1 day',
        tips: [
          'Fill the tank in Tzaneen even if you don\'t strictly need to yet — it\'s the last dependable fuel stop before the gate.',
          'Confirm current Kruger gate opening and closing times before you leave Polokwane; they\'re enforced strictly.',
        ],
      },
      {
        slug: 'heritage-loop-polokwane',
        name: 'Heritage loop',
        teaser: 'Culture, cycads and a World Heritage Site — spread over three days, not crammed into one.',
        intro:
          "This links Polokwane's three strongest heritage/nature stops into one loop, but it only works properly as a multi-day trip — Mapungubwe alone is a 3.5-hour drive each way, so trying to do all three in a single day means spending most of it in the car. Spread it out and it becomes a genuinely good regional tour.",
        stops: [
          { name: 'Bakone Malapa Open-Air Museum', slug: 'bakone-malapa-open-air-museum', time: 'Day 1', description: "Start close to home — a guided village tour in Polokwane itself, easing into the trip without a long drive on day one." },
          { name: 'Modjadji Cycad Reserve', slug: 'modjadji-cycad-reserve', time: 'Day 2', description: "About an hour's drive to Modjadjiskloof. Walk the cycad forest loop (1–2 hours) in the Rain Queen's valley, then use the rest of the day to continue toward Mapungubwe or overnight in the area." },
          { name: 'Mapungubwe National Park', slug: 'mapungubwe-national-park', time: 'Day 3', description: "The furthest stop — allow a full day for the drive plus the guided Mapungubwe Hill heritage tour, which must be booked in advance and runs on a set schedule." },
        ],
        time: '3 days',
        tips: [
          'Book the Mapungubwe Hill guided tour before you leave Polokwane — it runs on a fixed daily schedule, not on demand.',
          'Fuel up in Musina before the final approach to Mapungubwe; services thin out beyond there.',
        ],
      },
    ],
    seasons: [
      { name: 'Marula season', when: 'February to March', note: 'Marula festivals across Limpopo; elephants in the northern parks follow the fruit.' },
      { name: 'Winter bushveld', when: 'May to August', note: 'Dry, mild days — the best window for game drives and the Magoebaskloof passes. Cold mornings, so layer up for early starts at the game reserve.' },
      { name: 'Summer rains & waterfalls', when: 'November to March', note: 'Debengeni Falls and the Magoebaskloof forest are at their greenest and fullest after summer rain — afternoon thunderstorms are common, so aim for morning visits.' },
    ],
  },
  capetown: {
    blurb: 'Table Mountain, two oceans, the winelands an hour out, and more coastline than you can do in a week.',
    picks: [
      { name: 'Table Mountain Cableway', cat: 'Landmark', suburb: 'Tafelberg Rd', price: 'R420 return', time: 'Half day', sponsored: true, blurb: 'Rotating cable car to the summit plateau, with walking routes along the top and the Platteklip descent.', slug: 'table-mountain-cableway' },
      { name: 'V&A Waterfront', cat: 'Family', suburb: 'Waterfront', price: 'Free entry', time: 'Full day', sponsored: false, blurb: 'Working harbour with the Zeitz MOCAA museum, Two Oceans Aquarium and the Robben Island ferry.', slug: 'va-waterfront' },
      { name: 'Cape Point & Chapman’s Peak', cat: 'Outdoors', suburb: 'Cape Peninsula', price: 'R400 park fee', time: 'Full day', sponsored: true, blurb: 'The peninsula drive — Hout Bay, Chapman’s Peak toll road, Boulders penguins and the Cape of Good Hope.', slug: 'cape-point-chapmans-peak' },
      { name: 'Kirstenbosch Botanical Garden', cat: 'Outdoors', suburb: 'Newlands', price: 'R250 adults', time: 'Half day', sponsored: false, blurb: 'Fynbos garden on the eastern slope, with the canopy Boomslang walkway and summer sunset concerts.', slug: 'kirstenbosch-botanical-garden' },
      { name: 'Robben Island Museum', cat: 'Heritage', suburb: 'Table Bay', price: 'R600 incl. ferry', time: 'Half day', sponsored: false, blurb: 'Ferry from the Waterfront to the prison island, with tours led by former political prisoners.', slug: 'robben-island-museum' },
      { name: 'Stellenbosch Winelands', cat: 'Day trip', suburb: 'R44 east', price: 'Tastings from R120', time: 'Full day', sponsored: false, blurb: 'Oak-lined town forty-five minutes out, with several hundred estates on the surrounding routes.', slug: 'stellenbosch-winelands' },
    ],
    itineraries: [
      {
        slug: 'one-day-in-cape-town',
        name: 'One day in Cape Town',
        teaser: 'The classic first day — mountain, city, harbour, and sundowners on the Atlantic seaboard.',
        intro:
          "If you only have one day, this covers the essentials in an order that respects the mountain's moods — do it first, while conditions are usually calmest, and let the rest of the day unfold from there.",
        stops: [
          { name: 'Table Mountain', slug: 'table-mountain-cableway', time: '07:30 – 10:30', description: "Get to the lower cableway station as close to opening as you can. Morning is generally the calmest time for wind, and you'll beat the worst of the queues. Walk a short section of the summit plateau before heading back down." },
          { name: 'Bo-Kaap', time: '11:00 – 12:00', description: "A short drive or rideshare to the colourful, cobbled streets of the Bo-Kaap — an easy, photogenic walk, and a good spot for an early lunch at one of the local Cape Malay eateries." },
          { name: 'Waterfront', slug: 'va-waterfront', time: '13:00 – 17:00', description: "Spend the afternoon at the V&A Waterfront — Zeitz MOCAA or the Two Oceans Aquarium if you want an indoor stop, otherwise just harbour-side walking, shopping and coffee." },
          { name: 'Camps Bay sunset', time: '18:00 onward', description: "Drive or taxi around to Camps Bay for sundowners on the beach or at one of the strip's restaurants, with the Twelve Apostles mountain range behind you." },
        ],
        time: '9 hours',
        tips: [
          'Check the cableway\'s live operating status the morning of your visit — it closes for wind and cloud with little notice, so don\'t leave the mountain for the end of the day if conditions look marginal.',
          'Book cableway tickets online in advance where possible; walk-up queues in peak season can run to hours.',
        ],
      },
      {
        slug: 'cape-peninsula-loop',
        name: 'Peninsula loop',
        teaser: 'The full day-out drive south — Hout Bay, Chapman\'s Peak, Cape Point, penguins and a fishing village.',
        intro:
          "This is a full day, not a quick drive — budget the whole day and start early, since there's a lot of road and several proper stops. It only really works as a loop: down the Atlantic side via Chapman's Peak, across to Cape Point, then back up the False Bay side via Boulders and Kalk Bay.",
        stops: [
          { name: 'Hout Bay', time: '08:00 – 09:00', description: "Start at the harbour — a working fishing harbour with market stalls, and the option of a short boat trip out to Duiker Island to see the seal colony if you have time to spare." },
          { name: 'Chapman’s Peak & Cape Point', slug: 'cape-point-chapmans-peak', time: '09:30 – 13:30', description: "Drive the Chapman's Peak toll road (check it's open before you leave Hout Bay), then continue to Cape Point for the funicular or walk up to the old lighthouse and time at the Cape of Good Hope." },
          { name: 'Boulders penguins', time: '14:00 – 15:00', description: "Stop at Simon's Town on the way back for the Boulders Beach African penguin colony — boardwalks give close-up views without disturbing the birds." },
          { name: 'Kalk Bay', time: '15:30 – 17:00', description: "Finish in the fishing village of Kalk Bay — harbour-side seafood, antique shops and cafés, before the drive back into the City Bowl via Muizenberg." },
        ],
        time: 'Full day',
        tips: [
          'Chapman\'s Peak Drive closes periodically for weather or rockfall risk, sometimes with little notice — check its current status before setting out.',
          'Keep car windows closed in the Cape Point reserve; the resident baboons are used to vehicles and will take advantage of an open window.',
        ],
      },
      {
        slug: 'cape-winelands-trip',
        name: 'Wine country',
        teaser: 'Two days through Stellenbosch, the Franschhoek wine tram, and Paarl.',
        intro:
          "A proper winelands trip rather than a rushed day trip — this spreads Stellenbosch, Franschhoek and Paarl over two days, with the wine tram doing the designated-driving for you on day two.",
        stops: [
          { name: 'Stellenbosch', slug: 'stellenbosch-winelands', time: 'Day 1', description: "Walk the oak-lined town centre, then visit two or three estates for tastings — pace yourself, since a full itinerary of estate visits in one day is more than most people actually want. Stay over in or near the town." },
          { name: 'Franschhoek tram', time: 'Day 2, morning', description: "Drive to Franschhoek (about 25 minutes from Stellenbosch) and take the hop-on-hop-off wine tram between several estates — it removes the designated-driver problem entirely for this leg." },
          { name: 'Paarl', time: 'Day 2, afternoon', description: "On the way back toward Cape Town, stop in Paarl — more estates if you still have the appetite for tastings, or just a drive through one of the Cape's oldest wine towns." },
        ],
        time: '2 days',
        tips: [
          'Arrange a designated driver or use the Franschhoek tram for estate-to-estate travel — this genuinely isn\'t a self-drive-and-taste day.',
          'Book a restaurant table at your Stellenbosch or Franschhoek estate of choice in advance, especially on weekends — the well-known ones fill up.',
        ],
      },
    ],
    seasons: [
      { name: 'Whale season', when: 'June to November', note: 'Southern rights off False Bay and Hermanus, closest in September and October.' },
      { name: 'Summer wind', when: 'December to February', note: 'The south-easter closes the cableway on the worst days — check before driving up. Beaches and outdoor dining are at their best regardless.' },
      { name: 'Best all-round weather', when: 'March to May', note: 'Cape Town\'s most reliable stretch — warm days, cooler nights, before the winter rain sets in. Good for hiking and the winelands without summer\'s crowds.' },
    ],
  },
};
