-- Trading-hours backfill for the 50 businesses enriched earlier today
-- (description-enrichment-batch-01/02), before the `hours` column existed.
-- Every one of the 50 was re-researched specifically for hours; only
-- these 13 had them genuinely stated somewhere. The rest were searched
-- too but turned up nothing -- left NULL rather than guessed, same
-- non-fabrication bar as everything else in this project.

UPDATE businesses SET hours = 'Mon-Fri 09:00-17:00, Sat-Sun 10:00-14:00'
WHERE slug = '0861nutsman-zwartkop' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Sun 07:00-18:00'
WHERE slug = '123-logistics-and-services-furniture-removal-moving-company-valhalla' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00'
WHERE slug = '148-nt-projects-rooihuiskraal' AND hours IS NULL;

UPDATE businesses SET hours = 'Open 24/7 (emergency plumbing)'
WHERE slug = '24-7-centurion-plumbing-heuweloord' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00'
WHERE slug = '3-step-teambuilding-zwartkop' AND hours IS NULL;

UPDATE businesses SET hours = 'By appointment only, Mon-Fri 07:30-16:30'
WHERE slug = '4-u-pure-water-pty-ltd-hq-by-appointment-only-rooihuiskraal-north' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed'
WHERE slug = '3g-relocations-lyttelton' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 07:30-16:30'
WHERE slug = '4pl-group-irene-farm-villages' AND hours IS NULL;

UPDATE businesses SET hours = 'Check-in from 13:00, check-out by 10:00'
WHERE slug = '40-on-ilkey-menlyn' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Tue 06:30-18:00, Wed 06:30-22:00, Thu-Fri 06:30-18:00, Sat 08:00-16:00, Sun 08:00-15:00'
WHERE slug = '23-on-hazel-menlyn' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 07:00-17:00, Sat 07:00-15:00, Sun Closed'
WHERE slug = '2moro-s-eat-drink-bistro-montana-gardens' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 08:00-16:30'
WHERE slug = '3-properties-parris-inc-clydesdale' AND hours IS NULL;

UPDATE businesses SET hours = 'Mon-Fri 08:00-18:00, Sat 08:00-15:00, Sun & Holidays Closed'
WHERE slug = '440-printers-pretoria-central' AND hours IS NULL;
