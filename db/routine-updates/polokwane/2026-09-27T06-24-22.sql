UPDATE businesses
SET description = 'Mosate Lodge is a guest lodge and conference venue on the corner of Grobler and Dorp Street in Hospital Park, Polokwane, offering guest accommodation alongside event and conference facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 'mosate-lodge-hospark' AND description_enriched_at IS NULL;
