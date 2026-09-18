UPDATE businesses
SET description = 'Kensington Place is a boutique hotel with eight individually designed en-suite rooms on the slopes below Table Mountain in Higgovale, with a plunge pool and views over the city, harbour, or mountain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.kensingtonplace.co.za/", "https://www.i-escape.com/kensington-place", "https://www.mrandmrssmith.com/luxury-hotels/kensington-place"]'
WHERE slug = 'kensington-place-higgovale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosedene Guest House occupies a converted late-1800s farmhouse in Higgovale, offering eleven en-suite rooms plus a separate suite overlooking a plunge pool, with views of Table Mountain, Lion''s Head and the harbour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.rosedene.co.za/", "https://www.hotel.com.au/cape-town/rosedene-guest-house.htm", "https://www.africanreservations.com/Rosedene-Guest-House"]'
WHERE slug = 'rosedene-guest-house-higgovale' AND description_enriched_at IS NULL;
