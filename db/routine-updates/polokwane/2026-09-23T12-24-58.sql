UPDATE businesses
SET description = 'Battery Networx is a battery dealer in Futura, Polokwane, specialising in hi-cycle, deep-cycle and motorcycle batteries with factory guarantees. They offer free battery and alternator testing plus mobile fitment at the customer''s premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'battery-networx-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lepelle-Nkumpi Local Municipality is the local government authority for the Lepelle-Nkumpi area, part of Capricorn District Municipality, based at the Civic Centre in Lebowakgomo.',
    description_enriched_at = datetime('now')
WHERE slug = 'lepelle-nkumpi-local-municipality-lebowakgomo' AND description_enriched_at IS NULL;
