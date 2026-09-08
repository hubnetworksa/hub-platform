#!/usr/bin/env node
// Adds ~200 granular Tshwane suburbs (Wierdapark, Clubview, Brooklyn, ...)
// supplied by Ethan, grouped into 4 big areas matching his list's own
// headers. Purely additive: no existing suburb row is touched. A handful
// of his list entries are near-duplicates of suburbs that already exist
// (see REUSE below) — those are skipped rather than duplicated, but still
// recorded so areaGroups.ts can list them under the right area.
//
// Geocoded via Nominatim (OSM's own geocoder — same never-Google sourcing
// rule as the rest of this project), 1 request/sec with a descriptive
// User-Agent, sanity-checked against Tshwane's bounding box. A suburb that
// fails to geocode gets NULL lat/lng rather than a guessed coordinate — it
// still gets a working page, it just can't take part in the nearest-centroid
// business reassignment step.

import { writeFile } from 'node:fs/promises';

const USER_AGENT = 'PretoriaHub-SuburbGeocode/1.0 (contact: ethanmglindeque@gmail.com)';
const BBOX = { latMin: -26.3, latMax: -25.2, lngMin: 27.6, lngMax: 28.9 };
const REQUEST_DELAY_MS = 1100;

const AREAS = [
  {
    areaSlug: 'centurion-deep-south',
    areaName: 'Centurion & Deep South',
    region: 'centurion',
    hint: 'Centurion',
    suburbs: [
      'Amberfield', 'Amberfield Glen', 'Amberfield Manor', 'Amberfield Ridge', 'Amberfield Valley',
      'Blue Valley Golf Estate', 'Brakfontein', 'Bronberrik', 'Brooklands Lifestyle Estate',
      'Candlewoods Estate', 'Celtisdal', 'Centurion Central', 'Centurion Golf Estate', 'Claudius',
      'Clubview', 'Clubview East', 'Copperleaf Golf Estate', 'Cornwall Hill Estate', 'Die Hoewes',
      'Doringkloof', 'Eco-Park', 'Eldo Lakes Estate', 'Eldoglen Estate', 'Eldoraigne', 'Erasmia',
      'Glen Lauriston', 'Hennopspark', 'Heritage Hill Estate', 'Heuweloord', 'Heuwelsig Estate',
      'Highveld', 'Irene', 'Irene Farm Villages', 'Kloofsig', 'Kosmosdal', 'Laudium', 'Louwlardia',
      'Lyttelton', 'Lyttelton Manor', 'Midfields Estate', 'Midlands Estate', 'Midstream Estate',
      'Midstream Ridge', 'Monavoni', 'Olievenhoutbosch', 'Pierre van Ryneveld Park', 'Raslouw',
      'Rooihuiskraal', 'Rooihuiskraal North', 'Southdowns', 'Sunderland Ridge', 'Thatchfield Estate',
      'The Reeds', 'Valhalla', 'Wierdapark', 'Zwartkop',
    ],
  },
  {
    areaSlug: 'pretoria-far-east',
    areaName: 'Pretoria Far East & Silver Lakes',
    region: 'pretoria',
    hint: 'Pretoria',
    suburbs: [
      'Alphen Park', 'Ashley Gardens', 'Blyde Riverwalk Estate', 'Boardwalk Manor', 'Boardwalk Meander',
      'Brummeria', 'Constantia Park', 'De Wilgers', 'Die Wilgers', 'Eersterust', 'Equestria',
      'Faerie Glen', 'Garsfontein', 'Garsfontein Smallholdings', 'Grootfontein Country Estate',
      'Hazeldean', 'La Montagne', 'Lydiana', 'Lynnwood', 'Lynnwood Glen', 'Lynnwood Manor',
      'Lynnwood Ridge', 'Mamelodi', 'Menlyn', 'Meyerspark', 'Moreleta Park', 'Murrayfield', 'Newlands',
      'Olympus', 'Pretorius Park', 'Rietvalleirand', 'Salieshoek', 'Shere', 'Silver Lakes Golf Estate',
      'Silverton', 'Silvertondale', 'Six Fountains Residential Estate', 'The Hills Eco-Game Estate',
      'The Willows', 'Tijger Valley', 'Val de Grace', 'Wapadrand', 'Waterkloof Glen', 'Waterkloof Park',
      'Waterkloof Ridge', 'Willow Glen', 'Willow Park Manor', 'Woodhill Golf Estate', 'Woodlands Estate',
      'Zwavelpoort',
    ],
  },
  {
    areaSlug: 'pretoria-central-old-east',
    areaName: 'Pretoria Central & Old East',
    region: 'pretoria',
    hint: 'Pretoria',
    suburbs: [
      'Andeon', 'Arcadia', 'Atteridgeville', 'Baileys Muckleneuk', 'Barclay Square', 'Boekenhoutskloof',
      'Booysens', 'Brooklyn', 'Bryntirion', 'Capital Park', 'Claremont', 'Clydesdale', 'Colbyn',
      'Daspoort', 'Derdepoort', 'East Lynne', 'Elardus Park', 'Eloffsdal', 'Erasmuskloof', 'Erasmusrand',
      'Geolina', 'Gezina', 'Groenkloof', 'Hatfield', 'Hazelwood', 'Hermanstad', 'Kirkney', 'Les Marais',
      'Lotus Gardens', 'Lukasrand', 'Marabastad', 'Mayville', 'Menlo Park', 'Monument Park', 'Muckleneuk',
      'Philip Nel Park', 'Pretoria CBD', 'Pretoria West', 'Proclamation Hill', 'Rietfontein', 'Rietondale',
      'Riviera', 'Roseville', 'Salvokop', 'Sterrewag', 'Sunnyside', 'Trevenna', 'Villieria', 'Waterkloof',
      'Waterkloof Heights', 'Waverley', 'Weavind Park', 'Wingate Park', 'Wonderboom South', 'Zandfontein',
    ],
  },
  {
    areaSlug: 'pretoria-north-akasia',
    areaName: 'Pretoria North & Akasia',
    region: 'pretoria',
    hint: 'Pretoria',
    suburbs: [
      'Akasia', 'Amandasig', 'Annlin', 'Annlin West', 'Bergtuin', 'Buffelsdrift', 'Chantelle', 'Clarina',
      'Derdepoort Park', 'Derdepoort Smallholdings', 'Donkerhoek', 'Doornpoort', 'Dorandia', 'Eldorette',
      'Florauna', 'Heatherdale', 'Heatherview', 'Hesteapark', 'Jan Niemand Park', 'Kameeldrift',
      'Kameeldrift East', 'Karenpark', 'Kilner Park', 'Klerksoord', 'Koedoespoort', 'Leeuwfontein',
      'Leeuwfontein Estates', 'Magalieskruin', 'Montana', 'Montana Gardens', 'Montana Park', 'Mooiplaats',
      'Moregloed', 'Ninapark', 'Onderstepoort', 'Parktown Estate', 'Pretoria North', 'Queenswood',
      'Roodeplaat', 'Rooiwal', 'Rosslyn', 'Sable Hills Waterfront Estate', 'Sinoville', 'The Orchards',
      'Theresapark', 'Tileba', 'Waltloo', 'Wolmer', 'Wonderboom', 'Zambezi Country Estate',
    ],
  },
];

// Name -> existing suburbs.slug. These are skipped for INSERT (the row
// already exists) but still placed under their area in areaGroups.ts.
const REUSE = {
  'Faerie Glen': 'faerie-glen',
  Mamelodi: 'mamelodi',
  Menlyn: 'menlyn',
  'Silver Lakes Golf Estate': 'silverlakes',
  Atteridgeville: 'atteridgeville',
  Hatfield: 'hatfield',
  'Pretoria CBD': 'pretoria-central',
  Waterkloof: 'waterkloof',
  Akasia: 'akasia',
  Montana: 'montana',
};

function slugify(s) {
  return s.toLowerCase().trim().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}

function sqlEscape(v) {
  if (v === null || v === undefined) return 'NULL';
  return `'${String(v).replace(/'/g, "''")}'`;
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function geocode(name, hint) {
  const q = `${name}, ${hint}, Gauteng, South Africa`;
  const url = `https://nominatim.openstreetmap.org/search?format=jsonv2&limit=1&q=${encodeURIComponent(q)}`;
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT } });
  if (!res.ok) return null;
  const results = await res.json();
  if (!results.length) return null;
  const lat = Number(results[0].lat);
  const lng = Number(results[0].lon);
  if (lat < BBOX.latMin || lat > BBOX.latMax || lng < BBOX.lngMin || lng > BBOX.lngMax) return null;
  return { lat, lng };
}

async function main() {
  const insertStatements = [];
  const areaGroupsEntries = [];
  const failures = [];
  let geocoded = 0;
  let reused = 0;

  for (const area of AREAS) {
    const suburbSlugs = [];
    for (const name of area.suburbs) {
      if (REUSE[name]) {
        suburbSlugs.push(REUSE[name]);
        reused++;
        continue;
      }

      const slug = slugify(name);
      process.stderr.write(`Geocoding "${name}"...\n`);
      let coords = null;
      try {
        coords = await geocode(name, area.hint);
      } catch (err) {
        process.stderr.write(`  error: ${err.message}\n`);
      }
      await sleep(REQUEST_DELAY_MS);

      if (coords) {
        geocoded++;
      } else {
        failures.push(name);
      }

      insertStatements.push(
        `INSERT OR IGNORE INTO suburbs (slug, name, region, lat, lng) VALUES (${sqlEscape(slug)}, ${sqlEscape(name)}, ${sqlEscape(area.region)}, ${coords ? coords.lat : 'NULL'}, ${coords ? coords.lng : 'NULL'});`
      );
      suburbSlugs.push(slug);
    }
    areaGroupsEntries.push({ slug: area.areaSlug, name: area.areaName, suburbSlugs });
  }

  await writeFile('db/migrations/0011_granular_suburbs.sql', `-- Granular Tshwane suburbs supplied by Ethan, additive only — see
-- scripts/add-granular-suburbs.mjs for the source list, area grouping and
-- geocoding approach. No existing suburb row is renamed or removed.

${insertStatements.join('\n')}\n`);

  const areaGroupsTs = `// Two-tier area structure for suburbs — mirrors src/lib/categoryGroups.ts's
// pattern exactly: a fixed, hand-authored grouping used for browsing, not a
// database concept. Generated by scripts/add-granular-suburbs.mjs from
// Ethan's suburb list; edit here (not there) for any future manual tweaks.

export interface AreaGroup {
  slug: string;
  name: string;
  suburbSlugs: string[];
}

export const AREA_GROUPS: AreaGroup[] = [
${areaGroupsEntries
  .map(
    (a) => `  {
    slug: ${JSON.stringify(a.slug)},
    name: ${JSON.stringify(a.name)},
    suburbSlugs: [${a.suburbSlugs.map((s) => JSON.stringify(s)).join(', ')}],
  },`
  )
  .join('\n')}
  { slug: 'soshanguve', name: 'Soshanguve', suburbSlugs: ['soshanguve'] },
  { slug: 'hammanskraal', name: 'Hammanskraal', suburbSlugs: ['hammanskraal'] },
  { slug: 'cullinan', name: 'Cullinan', suburbSlugs: ['cullinan'] },
  { slug: 'bronkhorstspruit', name: 'Bronkhorstspruit', suburbSlugs: ['bronkhorstspruit'] },
  { slug: 'midrand', name: 'Midrand', suburbSlugs: ['midrand'] },
];

export function groupForSuburb(suburbSlug: string): AreaGroup | undefined {
  return AREA_GROUPS.find((g) => g.suburbSlugs.includes(suburbSlug));
}
`;
  await writeFile('src/lib/areaGroups.ts', areaGroupsTs);

  process.stderr.write(
    `\nDone. ${insertStatements.length} new suburb rows (${geocoded} geocoded, ${failures.length} failed), ${reused} reused existing rows.\n`
  );
  if (failures.length) {
    process.stderr.write(`Failed to geocode (lat/lng left NULL): ${failures.join(', ')}\n`);
  }
  process.stderr.write('Wrote db/migrations/0011_granular_suburbs.sql and src/lib/areaGroups.ts\n');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
