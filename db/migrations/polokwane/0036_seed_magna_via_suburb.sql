-- Magna Via is a distinct Polokwane industrial/commercial area along the
-- N1 south of the CBD (owner request 2026-09-26, while adding Makro
-- Polokwane, which sits at 1 Marmer St, Magna Via). Previously treated as
-- part of Bendor for lack of its own suburb row (see
-- db/routine-updates/polokwane/2026-09-16T13-05-30.sql, Vertex Boreholes)
-- -- this gives it its own, same pattern as Ladine/Chuenespoort Road.

INSERT INTO suburbs (slug, name, region) VALUES
  ('magna-via', 'Magna Via', 'polokwane');
