// Content for the mockup's "Things to do" page (/tourism/), one block per city.
// Ported from the mockup's tourismVals(). Prices and times are the mockup's own
// figures and should be confirmed with each operator before launch. `sponsored`
// is demo placement only: the page shows the Sponsored badge in the dev preview
// (DEMO_PREMIUM build) and never on a production build.

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

export interface TourContent {
  blurb: string;
  picks: TourPick[];
  itineraries: { name: string; stops: string; time: string }[];
  seasons: { name: string; when: string; note: string }[];
}

export const TOURISM: Record<string, TourContent> = {
  pretoria: {
    blurb: 'Jacaranda streets, Union Buildings, the Voortrekker Monument and a working game reserve inside the city limits.',
    picks: [
      { name: 'Union Buildings & Gardens', cat: 'Landmark', suburb: 'Arcadia', price: 'Free', time: '1–2 hours', sponsored: true, blurb: 'Herbert Baker’s terraced gardens above the city, with the Mandela statue and the best skyline view in Pretoria.' },
      { name: 'Voortrekker Monument', cat: 'Heritage', suburb: 'Groenkloof', price: 'R110 adults', time: 'Half day', sponsored: false, blurb: 'Granite monument and heritage site on a ridge, with a museum, walking trails and a viewing dome.' },
      { name: 'Rietvlei Nature Reserve', cat: 'Outdoors', suburb: 'Rietvallei', price: 'R92 per adult', time: 'Half day', sponsored: true, blurb: 'Self-drive Big-Five-minus-lion reserve twenty minutes from Menlyn — rhino, buffalo, cheetah and 300 bird species.' },
      { name: 'National Zoological Garden', cat: 'Family', suburb: 'Pretoria Central', price: 'R145 adults', time: 'Full day', sponsored: false, blurb: 'One of the largest zoos in the world by species count, with an aerial cableway over the enclosures.' },
      { name: 'Freedom Park', cat: 'Heritage', suburb: 'Salvokop', price: 'R150 guided', time: '2–3 hours', sponsored: false, blurb: 'Memorial and museum tracing 3.6 billion years of the region, opposite the Voortrekker Monument.' },
      { name: 'Cullinan Diamond Mine Tour', cat: 'Day trip', suburb: 'Cullinan', price: 'R220 surface tour', time: 'Full day', sponsored: false, blurb: 'Surface and underground tours of the mine that produced the largest gem diamond ever found.' },
    ],
    itineraries: [
      { name: 'One day in Pretoria', stops: 'Union Buildings → Church Square → Voortrekker Monument → Menlyn for dinner', time: '8 hours' },
      { name: 'Weekend with kids', stops: 'Zoo → Sci-Enza → Rietvlei game drive → Hazel Food Market', time: '2 days' },
      { name: 'Jacaranda season walk', stops: 'Herbert Baker St → Bourke St → Loftus → Brooklyn', time: '3 hours' },
    ],
    seasons: [
      { name: 'Jacaranda bloom', when: 'Mid-October to mid-November', note: 'Seventy thousand trees; Herbert Baker and Bourke streets are the classic routes.' },
      { name: 'Dry winter game viewing', when: 'May to August', note: 'Best time for Rietvlei — thin bush, animals at the waterholes.' },
    ],
  },
  polokwane: {
    blurb: 'Limpopo’s gateway city — game reserves, the Bushveld, and the road to Mapungubwe and the Kruger north.',
    picks: [
      { name: 'Polokwane Game Reserve', cat: 'Outdoors', suburb: 'Polokwane', price: 'R60 per adult', time: 'Half day', sponsored: true, blurb: 'Three thousand hectares on the edge of town with white rhino, sable and twenty-one game species.', slug: 'polokwane-game-reserve' },
      { name: 'Bakone Malapa Open-Air Museum', cat: 'Heritage', suburb: 'Chuenespoort Rd', price: 'R40 adults', time: '2 hours', sponsored: false, blurb: 'Living Northern Sotho village museum showing traditional building, cooking and iron smelting.', slug: 'bakone-malapa-open-air-museum' },
      { name: 'Mapungubwe National Park', cat: 'Day trip', suburb: 'Musina road', price: 'R120 conservation fee', time: 'Full day', sponsored: false, blurb: 'World Heritage site at the Limpopo–Shashe confluence, home of the golden rhino.' },
      { name: 'Modjadji Cycad Reserve', cat: 'Outdoors', suburb: 'Modjadjiskloof', price: 'R45 per adult', time: 'Half day', sponsored: false, blurb: 'The largest concentration of a single cycad species on earth, in the Rain Queen’s valley.' },
      { name: 'Peter Mokaba Stadium', cat: 'Landmark', suburb: 'Polokwane', price: 'Match dependent', time: '3 hours', sponsored: false, blurb: 'World Cup stadium shaped after the baobab, hosting PSL fixtures through the season.' },
      { name: 'Tzaneen & the Magoebaskloof', cat: 'Day trip', suburb: 'R71 east', price: 'Free drive', time: 'Full day', sponsored: true, blurb: 'Mist-belt forest, waterfalls and tea estates an hour east on one of the best drives in the province.', slug: 'magoebaskloof-debengeni-falls' },
      { name: 'Hugh Exton Photographic Museum', cat: 'Heritage', suburb: 'Polokwane', price: 'See page', time: '1 hour', sponsored: false, blurb: 'Early 1900s photographs charting the growth of Pietersburg/Polokwane, in the city centre.', slug: 'hugh-exton-photographic-museum' },
      { name: 'Meropa Casino & Entertainment World', cat: 'Family', suburb: 'N1', price: 'See page', time: 'Evening', sponsored: false, blurb: 'Polokwane’s biggest entertainment complex — casino, cinema, restaurants and events on the N1.', slug: 'meropa-casino-entertainment-world' },
      { name: 'Polokwane Golf Club', cat: 'Outdoors', suburb: 'Polokwane', price: 'See page', time: 'Half day', sponsored: false, blurb: 'An 18-hole par-72 parkland course dating to 1863 — Retief Goosen’s home club, near the CBD.', slug: 'polokwane-golf-club' },
      { name: 'The Ranch Golf Course', cat: 'Outdoors', suburb: 'N1 south', price: 'See page', time: 'Half day', sponsored: false, blurb: 'A 12-hole executive par-3 course and academy at The Ranch Resort, 25 km south on the N1.', slug: 'the-ranch-golf-course' },
    ],
    itineraries: [
      { name: 'One day in Polokwane', stops: 'Game reserve → Bakone Malapa → Irish House Museum → Savannah Mall', time: '7 hours' },
      { name: 'Kruger gateway run', stops: 'Polokwane → Tzaneen → Phalaborwa Gate', time: '1 day' },
      { name: 'Heritage loop', stops: 'Bakone Malapa → Modjadji → Mapungubwe', time: '3 days' },
    ],
    seasons: [
      { name: 'Marula season', when: 'February to March', note: 'Marula festivals across Limpopo; elephants in the northern parks follow the fruit.' },
      { name: 'Winter bushveld', when: 'May to August', note: 'Dry, mild days — the best window for game drives and the Magoebaskloof passes.' },
    ],
  },
  capetown: {
    blurb: 'Table Mountain, two oceans, the winelands an hour out, and more coastline than you can do in a week.',
    picks: [
      { name: 'Table Mountain Cableway', cat: 'Landmark', suburb: 'Tafelberg Rd', price: 'R420 return', time: 'Half day', sponsored: true, blurb: 'Rotating cable car to the summit plateau, with walking routes along the top and the Platteklip descent.' },
      { name: 'V&A Waterfront', cat: 'Family', suburb: 'Waterfront', price: 'Free entry', time: 'Full day', sponsored: false, blurb: 'Working harbour with the Zeitz MOCAA museum, Two Oceans Aquarium and the Robben Island ferry.' },
      { name: 'Cape Point & Chapman’s Peak', cat: 'Outdoors', suburb: 'Cape Peninsula', price: 'R400 park fee', time: 'Full day', sponsored: true, blurb: 'The peninsula drive — Hout Bay, Chapman’s Peak toll road, Boulders penguins and the Cape of Good Hope.' },
      { name: 'Kirstenbosch Botanical Garden', cat: 'Outdoors', suburb: 'Newlands', price: 'R250 adults', time: 'Half day', sponsored: false, blurb: 'Fynbos garden on the eastern slope, with the canopy Boomslang walkway and summer sunset concerts.' },
      { name: 'Robben Island Museum', cat: 'Heritage', suburb: 'Table Bay', price: 'R600 incl. ferry', time: 'Half day', sponsored: false, blurb: 'Ferry from the Waterfront to the prison island, with tours led by former political prisoners.' },
      { name: 'Stellenbosch Winelands', cat: 'Day trip', suburb: 'R44 east', price: 'Tastings from R120', time: 'Full day', sponsored: false, blurb: 'Oak-lined town forty-five minutes out, with several hundred estates on the surrounding routes.' },
    ],
    itineraries: [
      { name: 'One day in Cape Town', stops: 'Table Mountain → Bo-Kaap → Waterfront → Camps Bay sunset', time: '9 hours' },
      { name: 'Peninsula loop', stops: 'Hout Bay → Chapman’s Peak → Cape Point → Boulders → Kalk Bay', time: 'Full day' },
      { name: 'Wine country', stops: 'Stellenbosch → Franschhoek tram → Paarl', time: '2 days' },
    ],
    seasons: [
      { name: 'Whale season', when: 'June to November', note: 'Southern rights off False Bay and Hermanus, closest in September and October.' },
      { name: 'Summer wind', when: 'December to February', note: 'The south-easter closes the cableway on the worst days — check before driving up.' },
    ],
  },
};
