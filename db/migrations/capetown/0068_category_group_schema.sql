-- Lets the admin add a new business category from the admin dashboard
-- (functions/api/admin/categories.ts) with no developer involved. Before
-- this, a category only had a group (src/lib/categoryGroups.ts) and a
-- schema.org JSON-LD type (src/lib/categorySchemaTypes.ts) if a developer
-- hand-added it to those TypeScript files — fine for the 57 categories
-- this site launched with, not something a Pages Function can do itself
-- (no filesystem persistence, and it would need a git commit either way).
--
-- Both columns are nullable and NULL for every existing category: the
-- build (src/lib/data.ts's groupForCategory()/schemaTypeFor()) prefers
-- these DB values when set, falling back to the hardcoded TS tables
-- otherwise, so nothing already live changes. Only an admin-created
-- category gets a value here.
ALTER TABLE categories ADD COLUMN group_name TEXT;
ALTER TABLE categories ADD COLUMN schema_type TEXT;
