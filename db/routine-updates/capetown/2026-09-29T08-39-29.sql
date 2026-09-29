UPDATE businesses
SET description = 'Indigo Scuba is a PADI dive centre in Gordon''s Bay running boat dives, scuba courses, guided dives and gear rental, with dive guides who have explored the local False Bay reefs since 1999.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.indigoscuba.com/contact-us/", "https://www.waze.com/live-map/directions/indigo-scuba-diving-centre-bluegum-ave-16-gordons-bay", "https://www.indigoscuba.com/", "https://xray-mag.com/directory/indigo-scuba-gordons-bay"]'
WHERE slug = 'indigo-scuba-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Just Africa Scuba is a PADI 5 Star Instructor Development Center and dive shop in Gordon''s Bay, offering scuba courses and dive trips into False Bay, with an on-site retail shop and swimming pool at the Krystal Beach Hotel.',
    description_enriched_at = datetime('now')
WHERE slug = 'just-africa-scuba-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pep is a fashion and general merchandise store in Strand Square, Strand.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-strand' AND description_enriched_at IS NULL;
