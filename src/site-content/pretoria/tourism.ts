// Tourism detail-page content for Pretoria, matching the shape/tone of
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
    slug: 'union-buildings-gardens',
    name: 'Union Buildings & Gardens',
    pageTitle: 'Union Buildings & Gardens | Pretoria Landmark',
    metaDescription:
      'Herbert Baker\'s seat of South African government, with terraced gardens, the Nelson Mandela statue, and the best skyline view in Pretoria — free to visit.',
    teaser: 'Herbert Baker\'s terraced gardens above the city, with the Mandela statue and the best skyline view in Pretoria.',
    whatItIs:
      "The Union Buildings, designed by architect Sir Herbert Baker and completed in 1913, sit on Meintjieskop ridge overlooking central Pretoria and house the official seat of the South African government, including the President's offices. The building itself is not open to the public, but the terraced gardens in front of it are — free, and open daily, with one of the best views over the city.",
    whatToDo:
      "Walk the sweeping semi-circular gardens and amphitheatre lawns below the building's twin wings, taking in the formal rose gardens, statues and the sandstone architecture up close. The 9-metre bronze statue of Nelson Mandela, unveiled in 2013 with arms outstretched, is the most-photographed spot on the grounds — this is also where Mandela was inaugurated as President in 1994 and where his body lay in state in 2013. It's an easy, free hour or two, best combined with a short walk or drive around the surrounding Arcadia and Sunnyside area.",
    practical: [
      { label: 'Address', value: 'Government Avenue, Arcadia, Pretoria, 0083' },
      { label: 'Hours', value: 'Gardens generally open daily from early morning to early evening (roughly 06:00–18:00) — the buildings themselves are not open to the public.' },
      { label: 'Entry fee', value: 'Free.' },
      { label: 'Getting there', value: 'Self-drive with parking nearby, or a short taxi/rideshare from the CBD; the grounds are walkable from parts of Arcadia.' },
    ],
    beforeYouGo: [
      'Security may restrict access to parts of the grounds during official events — check for scheduled state functions before visiting.',
    ],
    openingHours: ['Mo-Su 06:00-18:00'],
    isAccessibleForFree: true,
    nearby:
      'Church Square and the CBD are a short drive away; Freedom Park sits directly opposite the Voortrekker Monument on the next ridge over, making a natural heritage pairing.',
    tieIns: [
      { label: 'Freedom Park', href: '/tourism/freedom-park/' },
      { label: 'Voortrekker Monument', href: '/tourism/voortrekker-monument/' },
    ],
    address: { streetAddress: 'Government Avenue', addressLocality: 'Arcadia', addressRegion: 'Gauteng', postalCode: '0083', addressCountry: 'ZA' },
    geo: { lat: -25.7406, lng: 28.2114 },
    imageNeeded: 'Real photo of the Mandela statue or the gardens with the Union Buildings behind — not a generic government-building stock image.',
  },
  {
    slug: 'voortrekker-monument',
    name: 'Voortrekker Monument',
    pageTitle: 'Voortrekker Monument | Heritage Site in Pretoria',
    metaDescription:
      'A granite monument and museum on a ridge south of Pretoria, marking the Great Trek — walking trails, a viewing dome, and a nature reserve around the site.',
    teaser: 'Granite monument and heritage site on a ridge, with a museum, walking trails and a viewing dome.',
    whatItIs:
      "The Voortrekker Monument, completed in 1949, commemorates the Voortrekkers — Boer settlers who migrated from the Cape Colony into the South African interior in the 1830s and 1840s (the \"Great Trek\"). The massive granite structure sits on a hill south of the Pretoria CBD, surrounded by a 350-hectare nature reserve, and is one of the country's most architecturally significant 20th-century monuments, built with symbolism throughout — including a marble frieze inside depicting the Trek's history.",
    whatToDo:
      "Inside, the Historiese Sensasie ('Hall of Heroes') frieze and the Cenotaph — lit by a shaft of sunlight through the dome's oculus at exactly midday on 16 December each year — are the centrepiece. A separate museum building covers the broader history in more depth. Outside, the surrounding nature reserve has walking and hiking trails, and a viewing platform at the monument's top (reached by stairs or a small lift) gives sweeping views toward the Union Buildings and Freedom Park on the opposite ridge. Budget half a day to see the monument, museum and a short walk properly.",
    practical: [
      { label: 'Address', value: 'Eeufees Road, Groenkloof, Pretoria, 0002' },
      { label: 'Hours', value: 'Daily, typically 08:00–17:00 (until 18:00 in summer) — confirm current seasonal hours before visiting.' },
      { label: 'Entry fee', value: 'Around R100–R120 for adults, discounted for children and pensioners, covering the monument and museum.' },
      { label: 'Getting there', value: 'Self-drive with on-site parking; not easily reached by public transport.' },
    ],
    beforeYouGo: [
      'Current entry fees and seasonal opening hours.',
    ],
    priceRange: 'R60 – R120',
    isAccessibleForFree: false,
    nearby:
      'Freedom Park sits directly opposite on the next ridge, offering a deliberately contrasting perspective on the same period of South African history — many visitors do both in one trip.',
    tieIns: [
      { label: 'Freedom Park', href: '/tourism/freedom-park/' },
      { label: 'Union Buildings & Gardens', href: '/tourism/union-buildings-gardens/' },
    ],
    address: { streetAddress: 'Eeufees Road', addressLocality: 'Groenkloof', addressRegion: 'Gauteng', postalCode: '0002', addressCountry: 'ZA' },
    geo: { lat: -25.7853, lng: 28.1897 },
    imageNeeded: 'Real photo of the granite monument exterior or the midday-sunbeam Cenotaph moment — not a generic monument stock image.',
  },
  {
    slug: 'rietvlei-nature-reserve',
    name: 'Rietvlei Nature Reserve',
    pageTitle: 'Rietvlei Nature Reserve | Game Viewing near Pretoria',
    metaDescription:
      'A self-drive game reserve twenty minutes from Menlyn — rhino, buffalo, cheetah and 300 bird species, with picnic sites and a dam.',
    teaser: 'Self-drive Big-Five-minus-lion reserve twenty minutes from Menlyn — rhino, buffalo, cheetah and 300 bird species.',
    whatItIs:
      "Rietvlei Nature Reserve is a roughly 3,800-hectare municipal reserve on Pretoria's south-eastern edge, about 20 minutes from Menlyn. It's built around the Rietvlei Dam, Tshwane's main water supply, and protects Highveld grassland along with a wide range of game — making it one of the easiest \"real bushveld\" outings for visitors staying in the city.",
    whatToDo:
      "Self-drive on well-maintained gravel roads through grassland and along the dam shore, with white rhino, buffalo, cheetah, eland, zebra and a long list of antelope species, plus around 300 recorded bird species (particularly strong around the dam and wetlands). There are picnic and braai sites, a restaurant/farm-stall area near the main gate, and a paved circular route suitable for a shorter visit if time is limited. A full loop with stops takes 2–4 hours.",
    practical: [
      { label: 'Address', value: 'Rietvlei Nature Reserve, Rietvlei Dam Road, off the R21, Pretoria' },
      { label: 'Hours', value: 'Daily, typically 06:00–18:00 in summer and 07:00–17:30 in winter — gates close promptly.' },
      { label: 'Entry fee', value: 'A modest per-vehicle and per-person conservation fee applies, revised periodically by the City of Tshwane.' },
      { label: 'Getting there', value: 'Tarred and gravel roads, sedan-accessible; roughly 20 minutes from Menlyn Park.' },
    ],
    beforeYouGo: [
      'Current entry fees and seasonal gate times.',
    ],
    nearby:
      'Close to Menlyn Park for a meal before or after; combine with the National Zoological Garden for a full wildlife-focused day if time allows (they are on opposite sides of the city, so pick one per day realistically).',
    tieIns: [
      { label: 'National Zoological Garden', href: '/tourism/national-zoological-garden/' },
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Rietvlei Dam Road, off the R21', addressLocality: 'Pretoria', addressRegion: 'Gauteng', addressCountry: 'ZA' },
    geo: { lat: -25.8460, lng: 28.3230 },
    imageNeeded: 'Real photo of wildlife in the reserve (rhino, zebra or the dam) — not a generic safari stock image.',
  },
  {
    slug: 'national-zoological-garden',
    name: 'National Zoological Garden',
    pageTitle: 'National Zoological Garden | Pretoria Zoo',
    metaDescription:
      'One of the largest zoos in the world by species count, in central Pretoria, with an aerial cableway giving views over the enclosures.',
    teaser: 'One of the largest zoos in the world by species count, with an aerial cableway over the enclosures.',
    whatItIs:
      "The National Zoological Garden of South Africa, generally known simply as Pretoria Zoo, is one of the largest zoos in the world by number of species, and one of the oldest in Africa (founded 1899). It sits close to Pretoria's CBD, and covers roughly 85 hectares across two sections linked by an aerial cableway.",
    whatToDo:
      "Enclosures cover the full range of African and international wildlife, from big cats and primates to reptiles and an aquarium section, and the cableway is a highlight in its own right — a scenic ride over parts of the grounds rather than just a shortcut. It's a genuine full-day outing for families, with restaurants and picnic areas on site; budget at least half a day to see the collection properly.",
    practical: [
      { label: 'Address', value: 'Boom Street, Pretoria Central, Pretoria, 0001' },
      { label: 'Hours', value: 'Daily, typically 08:30–17:30 (last entry earlier) — confirm current hours, which can shift seasonally.' },
      { label: 'Entry fee', value: 'Around R140–R150 for adults, discounted for children and pensioners; the cableway is usually a separate small additional fee.' },
      { label: 'Getting there', value: 'Central and accessible by car with on-site parking, or a short taxi/rideshare from the CBD.' },
    ],
    beforeYouGo: [
      'Current entry and cableway pricing, and confirm the cableway is operating on the day (it closes periodically for maintenance).',
    ],
    priceRange: 'R80 – R150',
    isAccessibleForFree: false,
    nearby:
      'Central enough to combine with a Church Square/CBD heritage walk before or after.',
    tieIns: [
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Boom Street', addressLocality: 'Pretoria Central', addressRegion: 'Gauteng', postalCode: '0001', addressCountry: 'ZA' },
    geo: { lat: -25.7420, lng: 28.1910 },
    imageNeeded: 'Real photo of the cableway over the enclosures or a signature animal exhibit — not a generic zoo stock image.',
  },
  {
    slug: 'freedom-park',
    name: 'Freedom Park',
    pageTitle: 'Freedom Park | Heritage Museum in Pretoria',
    metaDescription:
      'A memorial and museum tracing 3.6 billion years of the region\'s history, on a ridge opposite the Voortrekker Monument — guided tours available.',
    teaser: 'Memorial and museum tracing 3.6 billion years of the region, opposite the Voortrekker Monument.',
    whatItIs:
      "Freedom Park is a national heritage site and museum on Salvokop, a ridge directly opposite the Voortrekker Monument, built to tell a broader and more inclusive story of South African history than older monuments — from the region's deep geological and natural history through to the struggle against apartheid and the country's democratic transition. Its centrepiece, //hapo (a Khoi word roughly meaning \"a dream\"), is both a museum and a symbolic boat-shaped structure.",
    whatToDo:
      "Guided tours (recommended over a self-guided visit, given the depth of the content) walk through the //hapo museum's exhibits, the Wall of Names memorial listing those who died in South Africa's conflicts, an eternal flame, and gardens laid out with symbolic and astronomical significance. The site deliberately sits at eye level with the Voortrekker Monument across the valley, and many visitors do both in one day as a pointed contrast in how the country's history has been told. Budget 2–3 hours for a proper guided visit.",
    practical: [
      { label: 'Address', value: 'Salvokop, Pretoria, 0002' },
      { label: 'Hours', value: 'Typically Tuesday–Sunday, 08:00–17:00 (closed Mondays) — confirm current days/hours before visiting.' },
      { label: 'Entry fee', value: 'A guided tour fee applies (around R150 per person as a general guide) — confirm current pricing, which covers the //hapo museum and grounds tour.' },
      { label: 'Getting there', value: 'Self-drive with on-site parking; a short drive from the CBD and from the Voortrekker Monument.' },
    ],
    beforeYouGo: [
      'Current guided-tour pricing and whether booking ahead is required for your group size.',
    ],
    nearby:
      'The Voortrekker Monument sits on the opposite ridge — a natural pairing for the same visit.',
    tieIns: [
      { label: 'Voortrekker Monument', href: '/tourism/voortrekker-monument/' },
      { label: 'Union Buildings & Gardens', href: '/tourism/union-buildings-gardens/' },
    ],
    address: { streetAddress: 'Salvokop', addressLocality: 'Pretoria', addressRegion: 'Gauteng', postalCode: '0002', addressCountry: 'ZA' },
    geo: { lat: -25.7660, lng: 28.1810 },
    imageNeeded: 'Real photo of the //hapo museum structure or the Wall of Names — not a generic memorial stock image.',
  },
  {
    slug: 'cullinan-diamond-mine-tour',
    name: 'Cullinan Diamond Mine Tour',
    pageTitle: 'Cullinan Diamond Mine Tour | Day Trip from Pretoria',
    metaDescription:
      'Surface and underground tours of the mine that produced the largest gem diamond ever found — a historic mining village about 45 minutes from Pretoria.',
    teaser: 'Surface and underground tours of the mine that produced the largest gem diamond ever found.',
    whatItIs:
      "The Cullinan Diamond Mine (formerly the Premier Mine), about 45 minutes east of Pretoria, is where the 3,106-carat Cullinan Diamond — still the largest gem-quality rough diamond ever discovered — was found in 1905. The stone was cut into several pieces now set in the British Crown Jewels, including the Great Star of Africa. The mine is still operational, and the surrounding village of Cullinan retains its early-1900s mining-town character, with several historic buildings and craft shops.",
    whatToDo:
      "Surface tours cover the mine's history, the discovery of the Cullinan Diamond, and viewing points over the open pit; underground tours (where offered, subject to operational access and safety requirements) take visitors down into the working mine itself for a more immersive experience — both require advance booking through the tour operator, not just turning up. The village itself is worth an hour or two separately, with cafés, a historic hotel and craft/jewellery shops. Combine the mine tour with lunch in the village for a full day trip.",
    practical: [
      { label: 'Distance from Pretoria', value: 'Approx. 45 km east via the R513 (about 45 minutes drive).' },
      { label: 'Surface tour price', value: 'Around R200–R250 per person as a general guide — confirm current pricing and tour times directly with the operator.' },
      { label: 'Underground tour', value: 'Where available, typically pricier and with stricter booking/safety requirements (closed shoes, minimum age) — confirm availability before planning around it.' },
      { label: 'Booking', value: 'Advance booking required for both surface and underground tours; they run on a fixed schedule, not on demand.' },
    ],
    beforeYouGo: [
      'Current tour prices, schedule and whether underground tours are currently operating (access can be suspended for operational reasons).',
    ],
    nearby:
      'The village of Cullinan is worth combining with the mine tour for lunch and a browse of the craft/jewellery shops.',
    tieIns: [
      { label: 'Restaurants & Takeaways', href: '/category/restaurants-takeaways/' },
    ],
    address: { streetAddress: 'Oak Avenue, Cullinan', addressLocality: 'Cullinan', addressRegion: 'Gauteng', postalCode: '1000', addressCountry: 'ZA' },
    geo: { lat: -25.6740, lng: 28.5140 },
    imageNeeded: 'Real photo of the open pit, the historic mine buildings, or the village — not a generic mining/diamond stock image.',
  },
];

export const attractionBySlug = (slug: string): Attraction | undefined =>
  ATTRACTIONS.find((a) => a.slug === slug);
