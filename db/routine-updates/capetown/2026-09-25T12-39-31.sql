UPDATE businesses
SET description = 'A Capitec Bank branch inside Nyanga Junction shopping centre, Manenberg, offering standard retail banking services.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr V H Davids is a dental practice operating from Shop 6 in the Bonteheuwel Town Centre, offering general dentistry services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00'
WHERE slug = 'dr-v-h-davids-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gentspride Barbershop has operated on Bluegum Street in Bonteheuwel since 2000, offering standard and modern cuts, fades and scissor cuts, and also trains apprentice barbers.',
    description_enriched_at = datetime('now')
WHERE slug = 'gentspride-barbershop-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A dental clinic in Hanover Park offering general dental care from its premises on the corner of Hanlyn Walk and Hanover Park Avenue.',
    description_enriched_at = datetime('now')
WHERE slug = 'hanover-park-dental-clinic-hanover-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KC TheBarberShop on Bonteheuwel Avenue offers barbering, fades, beard trims, men''s shaves and head shaves.',
    description_enriched_at = datetime('now')
WHERE slug = 'kc-thebarbershop-bonteheuwel' AND description_enriched_at IS NULL;
