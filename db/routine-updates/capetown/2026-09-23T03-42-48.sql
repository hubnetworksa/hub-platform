-- Job 4: description enrichment sweep, batch 2 of 2 (10 businesses)
UPDATE businesses
SET description = 'PremFresh is the retail seafood arm of Premier Fishing, selling fresh and frozen export-grade seafood from its Kromboom Gardens Centre store in Crawford.',
    description_enriched_at = datetime('now')
WHERE slug = 'premfresh-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rossiers Pharmacy is a retail pharmacy inside Kensington Shopping Centre, Kensington.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-13:30, Sun closed'
WHERE slug = 'rossiers-pharmacy-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SUPERSPAR Belhar is a full-service supermarket inside Cavalier Shopping Centre, Belhar.',
    description_enriched_at = datetime('now')
WHERE slug = 'superspar-belhar-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Saverite is a neighbourhood supermarket on Paul Kruger Avenue, Ruyterwacht.',
    description_enriched_at = datetime('now')
WHERE slug = 'saverite-ruyterwacht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Settlers Gas & Hardware is a hardware and household gas retailer on Bonteheuwel Avenue, Bonteheuwel.',
    description_enriched_at = datetime('now')
WHERE slug = 'settlers-gas-and-hardware-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Settlers Muslim Butchery is a halal butchery on Bonteheuwel Avenue, Bonteheuwel.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 07:00-18:00, Sun 08:00-14:00'
WHERE slug = 'settlers-muslim-butchery-bonteheuwel' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street is a value fashion and homeware retailer inside The Junxion Mall, Philippi.',
    description_enriched_at = datetime('now')
WHERE slug = 'sheet-street-the-junction-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Hanover Park is a supermarket inside the Shoprite Centre on Stonelands Road, Hanover Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-hanover-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Langa Junction is a supermarket inside Langa Junction on Brinton Street, Langa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:30, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'shoprite-langa-junction-langa' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Lansdowne Corner is a supermarket inside Lansdowne Corner Shopping Centre, Lansdowne.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-lansdowne-corner-lansdowne' AND description_enriched_at IS NULL;
