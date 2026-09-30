UPDATE businesses
SET description = 'Braude''s Pharmacy is a long-established community pharmacy in Athlone, in operation for more than 70 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-22:00'
WHERE slug = 'braudes-pharmacy-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Anchor Pharmacy is a community pharmacy operating out of Lawrence Road in Athlone, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-22:00'
WHERE slug = 'anchor-pharmacy-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chavda Pharmacy is a pharmacy in Surrey Estate, Athlone, that also offers on-site doctor consultation services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-13:00 & 13:45-18:00, Fri 09:00-12:30 & 14:00-18:00, Sat 09:00-15:00, Sun 09:30-12:30',
    source_urls = '["https://www.brabys.com/za/western-cape/athlone/pharmacies/chavda-pharmacy", "https://2pos.co.za/2/20116", "https://openhours-southafrica.com/en/cape-town/chavda-pharmacy"]'
WHERE slug = 'chavda-pharmacy-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maphindi''s Braai Place is a shisa nyama and butchery in Nyanga known for its flame-grilled meat and magwinya (vetkoek), with a lively township social atmosphere and a TV for watching sport.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-19:30'
WHERE slug = 'maphindis-braai-place-nyanga' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Xolile Guestrooms is a self-catering guest house in Langa offering ensuite rooms with essential amenities.',
    description_enriched_at = datetime('now')
WHERE slug = 'xolile-guestrooms-langa' AND description_enriched_at IS NULL;
