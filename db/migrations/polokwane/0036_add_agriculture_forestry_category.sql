-- Owner request: add a dedicated category for agriculture and forestry
-- businesses (farms, forestry/logging operations, land management), grouped
-- under "Home & Trade Services" in src/lib/categoryGroups.ts. Distinct from
-- the existing "Agricultural & Farming Supplies" retail category, which
-- covers supply stores, not farming/forestry operations themselves.

INSERT INTO categories (slug, name) VALUES
  ('agriculture-forestry', 'Agriculture & Forestry');
