-- Magna Via Industrial is a distinct Polokwane industrial/commercial area
-- along the N1 south of the CBD (owner request 2026-09-26, while adding
-- Makro Polokwane, which sits at 1 Marmer St, Magna Via). Named "Magna Via
-- Industrial" per owner correction (2026-09-26) -- it is not a residential
-- suburb, and property listings (Property24, Seeff, Century21, RealNet)
-- consistently call it that. Previously treated as part of Bendor for lack
-- of its own suburb row (see
-- db/routine-updates/polokwane/2026-09-16T13-05-30.sql, Vertex Boreholes)
-- -- this gives it its own, same pattern as Ladine/Chuenespoort Road
-- (both also non-residential areas kept in this same table).

INSERT INTO suburbs (slug, name, region) VALUES
  ('magna-via', 'Magna Via Industrial', 'polokwane');
