// Two-tier area structure for suburbs — mirrors src/lib/categoryGroups.ts's
// pattern exactly: a fixed, hand-authored grouping used for browsing, not a
// database concept. Every suburb slug here must exist in
// db/migrations/capetown/0030_seed_suburbs.sql; edit both together when the
// suburb list changes. Groups here match that migration's 8 regions exactly
// (same slugs, same membership) — no extra tiering was invented.

export interface AreaGroup {
  slug: string;
  name: string;
  suburbSlugs: string[];
}

export const AREA_GROUPS: AreaGroup[] = [
  {
    slug: 'city-bowl',
    name: 'City Bowl',
    suburbSlugs: [
      'cape-town-cbd', 'gardens', 'tamboerskloof', 'oranjezicht', 'vredehoek', 'zonnebloem',
      'woodstock', 'observatory', 'salt-river', 'bo-kaap', 'de-waterkant', 'devils-peak-estate',
      'district-six', 'higgovale', 'university-estate', 'va-waterfront', 'walmer-estate',
    ],
  },
  {
    slug: 'atlantic-seaboard',
    name: 'Atlantic Seaboard',
    suburbSlugs: [
      'sea-point', 'green-point', 'mouille-point', 'bantry-bay', 'clifton', 'camps-bay',
      'fresnaye', 'three-anchor-bay', 'bakoven',
    ],
  },
  {
    slug: 'southern-suburbs',
    name: 'Southern Suburbs',
    suburbSlugs: [
      'rondebosch', 'rondebosch-east', 'rosebank', 'mowbray', 'claremont', 'newlands',
      'kenilworth', 'wynberg', 'constantia', 'bishopscourt', 'tokai', 'plumstead', 'diep-river',
      'bergvliet', 'kirstenhof', 'meadowridge', 'dreyersdal', 'harfield-village', 'heathfield',
      'kenwyn', 'southfield',
    ],
  },
  {
    slug: 'northern-suburbs',
    name: 'Northern Suburbs',
    suburbSlugs: [
      'bellville', 'durbanville', 'parow', 'goodwood', 'brackenfell', 'kraaifontein', 'panorama',
      'welgemoed', 'kuils-river', 'edgemead', 'bothasig', 'boston', 'eversdal', 'kenridge',
      'stellenberg', 'maitland', 'paarden-eiland', 'ysterplaat', 'rugby', 'thornton', 'epping',
      'ndabeni', 'brooklyn', 'century-city', 'kensington', 'monte-vista', 'norwood', 'pinelands',
      'plattekloof', 'richwood', 'ruyterwacht', 'wallacedene', 'eerste-river',
    ],
  },
  {
    slug: 'cape-flats',
    name: 'Cape Flats',
    suburbSlugs: [
      'mitchells-plain', 'khayelitsha', 'gugulethu', 'nyanga', 'langa', 'athlone', 'bonteheuwel',
      'manenberg', 'hanover-park', 'delft', 'philippi', 'lansdowne', 'beacon-valley', 'belhar',
      'bishop-lavis', 'blikkiesdorp', 'blue-downs', 'browns-farm', 'colorado', 'crawford',
      'crossroads', 'de-oude-weg', 'eastridge', 'elsies-river', 'grassy-park', 'heideveld',
      'joe-slovo', 'lavender-hill', 'lentegeur', 'lotus-river', 'mandalay', 'mandela-park',
      'matroosfontein', 'ottery', 'philippi-horticultural', 'portland', 'qq-section', 'retreat',
      'rocklands', 'steenberg', 'strandfontein', 'tafelsig', 'westgate', 'westridge', 'wetton',
      'woodlands',
    ],
  },
  {
    slug: 'west-coast',
    name: 'West Coast',
    suburbSlugs: [
      'table-view', 'bloubergstrand', 'milnerton', 'melkbosstrand', 'parklands', 'dunoon',
      'joe-slovo-park', 'killarney-gardens', 'montague-gardens', 'summer-greens',
    ],
  },
  {
    slug: 'south-peninsula',
    name: 'South Peninsula',
    suburbSlugs: [
      'muizenberg', 'fish-hoek', 'simons-town', 'hout-bay', 'noordhoek', 'kommetjie', 'kalk-bay',
      'capri-village', 'clovelly', 'dennendal', 'glencairn', 'hangberg', 'imizamo-yethu',
      'lakeside', 'llandudno', 'marina-da-gama', 'masiphumelele', 'ocean-view', 'scarborough',
      'st-james', 'sun-valley', 'sunnydale', 'westlake', 'da-gama-park',
    ],
  },
  {
    slug: 'helderberg',
    name: 'Helderberg',
    suburbSlugs: [
      'somerset-west', 'strand', 'gordons-bay', 'croydon', 'faure', 'firgrove', 'lwandle',
      'macassar',
    ],
  },
];

export function groupForSuburb(suburbSlug: string): AreaGroup | undefined {
  return AREA_GROUPS.find((g) => g.suburbSlugs.includes(suburbSlug));
}

// Matches this site's Suburb.region values (see db/migrations/capetown/0030_seed_suburbs.sql) —
// used for display text (e.g. image alt) where the raw region slug isn't presentable on its own.
const REGION_LABELS: Record<string, string> = {
  'city-bowl': 'City Bowl',
  'atlantic-seaboard': 'Atlantic Seaboard',
  'southern-suburbs': 'Southern Suburbs',
  'northern-suburbs': 'Northern Suburbs',
  'cape-flats': 'Cape Flats',
  'west-coast': 'West Coast',
  'south-peninsula': 'South Peninsula',
  helderberg: 'Helderberg',
};

export function regionLabel(region: string): string {
  return REGION_LABELS[region] ?? region;
}
