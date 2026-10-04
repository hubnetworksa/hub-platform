#!/usr/bin/env node
// Undo for the content upgrade: restores the description and source_urls
// that one batch, or all batches, of a city had in
// a database backup taken before the upgrade ("Weekly database backup"
// workflow, run by hand before the agents start; download its artifact and
// gunzip it).
//
//   node scripts/content-upgrade/undo.mjs <city> <backup.sql> <NNN|all>
//
// Writes db/routine-updates/<city>/undo-<NNN|all>.sql, which the next deploy
// applies. It only touches listings the upgrade stamped (description_enriched_at
// set), and clears the stamp again so they can be redone.
import { readFileSync, writeFileSync, readdirSync, mkdirSync } from 'node:fs';
import { DatabaseSync } from 'node:sqlite';

const [city, backup, which] = process.argv.slice(2);
if (!['pretoria', 'polokwane', 'capetown'].includes(city) || !backup || !which) {
  console.error('Usage: node scripts/content-upgrade/undo.mjs <pretoria|polokwane|capetown> <backup.sql> <NNN|all>');
  process.exit(2);
}
const files = which === 'all' ? readdirSync(`content-upgrade/${city}`).filter((f) => /^chunk-\d{3}\.json$/.test(f)) : [`chunk-${String(Number(which)).padStart(3, '0')}.json`];
const slugs = files.flatMap((f) => JSON.parse(readFileSync(`content-upgrade/${city}/${f}`, 'utf8')).listings.map((l) => l.slug));

const db = new DatabaseSync(':memory:');
// A full export loads tables in any order: don't let foreign keys block it.
db.exec('PRAGMA foreign_keys = OFF');
db.exec(readFileSync(backup, 'utf8'));
const get = db.prepare('SELECT description, source_urls FROM businesses WHERE slug = ?');
const q = (v) => (v == null ? 'NULL' : `'${String(v).replace(/'/g, "''")}'`);
const out = [`-- undo content-upgrade ${city} ${which} from ${backup}`];
let n = 0;
for (const slug of slugs) {
  const r = get.get(slug);
  if (!r) continue;
  out.push(`UPDATE businesses SET description = ${q(r.description)}, source_urls = ${q(r.source_urls)}, description_enriched_at = NULL WHERE slug = ${q(slug)} AND description_enriched_at IS NOT NULL;`);
  n++;
}
mkdirSync(`db/routine-updates/${city}`, { recursive: true });
const name = `db/routine-updates/${city}/undo-${which === 'all' ? 'all' : String(Number(which)).padStart(3, '0')}.sql`;
writeFileSync(name, out.join('\n') + '\n');
console.log(`ok: ${name} (${n} listings restored from the backup)`);
