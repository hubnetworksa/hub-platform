# TheCapeTownHub hourly research routine — runbook

**Not active yet.** This site has no suburbs or categories seeded in D1 yet
(see `db/migrations/capetown/` and `sites/capetown.json`), so there is
nothing for a research routine to cross-reference against — do not point a
scheduled agent at this file until that seeding is done.

Once Cape Town has a real suburb list (its own equivalent of
`db/migrations/polokwane/0002_seed_suburbs.sql`) and `status/capetown/db-snapshot.json`
has real content after a deploy, write this runbook by copying the structure
of `ROUTINE.polokwane.md` and swapping in Cape Town's own city/suburb/region
names, `status/capetown/...` and `db/routine-updates/capetown/...` paths.
