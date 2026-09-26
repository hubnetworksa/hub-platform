-- Job 4: description enrichment sweep
UPDATE businesses
SET description = 'Baker & McVeigh Equine Hospital is a fully equipped equine surgical hospital in Milnerton, established in 2002, offering emergency and elective surgery, dental care, reproduction services, and prepurchase examinations for racehorses, sport horses, polo ponies, and pleasure horses across the Western Cape.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00'
WHERE slug = 'baker-mcveigh-equine-hospital-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Care Pharmacy is a community pharmacy in Parklands offering wellness checks, injections and flu vaccinations, baby care and wound care, plus local delivery within a 5km radius for orders over R400.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-22:00'
WHERE slug = 'cape-care-pharmacy-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Centre Point is a pharmacy and health, beauty and homeware retailer inside Centre Point Shopping Centre, Milnerton.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-centre-point-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ixia Street Animal Hospital is a well-established veterinary hospital in Milnerton, in operation for over 18 years, offering medical, surgical, high-care and dental services for cats, dogs and other small pets.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 09:00-13:00, Sun and Public Holidays 10:00-11:00'
WHERE slug = 'ixia-street-animal-hospital-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Parklands Pharmacy is a pharmacy in Parklands, offering everyday health and dispensing services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'parklands-pharmacy-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Coffee Co Cafe is a modern coffee shop in Milnerton offering free WiFi and coffee made to order alongside a casual all-day menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-coffee-co-cafe-milnerton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Daily Coffee Cafe is a branch of The Daily Coffee Cafe franchise in Melkbosstrand, blending New York-inspired decor with local Karoo touches as a neighbourhood coffee spot for locals and visitors.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun 09:00-14:00'
WHERE slug = 'the-daily-coffee-cafe-melkbosstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy Melkbosstrand is a Wimpy drive-thru and family restaurant at the Sasol Convenience Centre on Birkenhead Drive, serving breakfast, burgers and family meals.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'wimpy-melkbosstrand' AND description_enriched_at IS NULL;

-- Incidental closure found while researching Virgin Active Parklands RED for job 4:
-- Virgin Active's own official support site confirms the Parklands club (including
-- the RED concept gym) permanently closed on 30 June 2026.
UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'virgin-active-parklands-red-parklands' AND closed_at IS NULL;
