UPDATE businesses
SET description = 'Capitec Bank operates a branch inside Nyanga Junction Shopping Centre in Manenberg, offering everyday banking and savings services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr V H Davids is a general dental practice based in Bonteheuwel Town Centre, providing routine checkups and restorative dental treatment to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00'
WHERE slug = 'dr-v-h-davids-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gentspride Barbershop is a trade-tested barbershop in Bonteheuwel offering classic and modern cuts, fades and scissor cuts, and has trained apprentice barbers and hosted community grooming competitions since opening in 2000.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 08:00-19:00, Sat 07:00-14:00, Sun 08:00-12:00'
WHERE slug = 'gentspride-barbershop-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hanover Park Dental Clinic operates as the dental service of the Hanover Park Community Health Centre, providing public dental care to residents of Hanover Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.readymap.info/4/22040", "https://za.polomap.com/windsor-park/27920", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=93905"]'
WHERE slug = 'hanover-park-dental-clinic-hanover-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KC TheBarberShop is a barbershop on Bonteheuwel Avenue offering haircuts, beard trims, shaves and head shaves for men.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-19:00, Wed 08:00-17:00, Thu-Fri 08:00-19:00, Sat 08:00-11:00, Sun 08:00-12:00'
WHERE slug = 'kc-thebarbershop-bonteheuwel' AND description_enriched_at IS NULL;
