#!/usr/bin/env node
// Decides whether the monthly fuel-price routine has anything to do today, so
// the agent (or a GitHub Action) can stop immediately on every other day.
//
//   node scripts/fuel-due.mjs [--date YYYY-MM-DD]
//
// South African pump prices change once a month, effective the first Wednesday.
// The routine is scheduled Wednesday to Friday; it is DUE when today (South
// African time) is the first Wednesday of the month or one of the two days
// after it (catch-up if the announcement or a source was not readable on the
// day) AND at least one city is still missing this month's four grades.
//
// Exit code 0 = due (prints which cities need which region), 3 = nothing to do.
import { existsSync, readFileSync } from 'node:fs';

const REGIONS = { capetown: 'coastal', pretoria: 'inland', polokwane: 'inland' };
const GRADES = ['Petrol 95', 'Petrol 93', 'Diesel 50ppm', 'Diesel 500ppm'];

const argDate = process.argv.includes('--date') ? process.argv[process.argv.indexOf('--date') + 1] : null;
const today =
  argDate ??
  new Intl.DateTimeFormat('en-CA', { timeZone: 'Africa/Johannesburg', year: 'numeric', month: '2-digit', day: '2-digit' }).format(new Date());
const [y, m, d] = today.split('-').map(Number);
const period = `${y}-${String(m).padStart(2, '0')}`;

let firstWed = 1;
while (new Date(Date.UTC(y, m - 1, firstWed)).getUTCDay() !== 3) firstWed++;
const offset = d - firstWed;

if (offset < 0 || offset > 2) {
  console.log(`not due: today is ${today}; this month's prices take effect on Wednesday ${period}-${String(firstWed).padStart(2, '0')} (routine runs that day and the two after).`);
  process.exit(3);
}

const missing = [];
for (const [city, region] of Object.entries(REGIONS)) {
  const file = `status/${city}/db-snapshot.json`;
  const rows = existsSync(file) ? JSON.parse(readFileSync(file, 'utf8')).fuel_prices ?? [] : [];
  const have = new Set(rows.filter((r) => r.period === period && r.region === region).map((r) => r.grade));
  const need = GRADES.filter((g) => !have.has(g));
  if (need.length) missing.push({ city, region, missingGrades: need });
}

if (!missing.length) {
  console.log(`not due: ${period} prices are already loaded for every city.`);
  process.exit(3);
}
console.log(JSON.stringify({ due: true, period, effectiveWednesday: `${period}-${String(firstWed).padStart(2, '0')}`, missing }));
