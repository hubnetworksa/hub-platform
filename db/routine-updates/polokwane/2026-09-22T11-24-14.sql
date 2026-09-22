UPDATE businesses
SET description = 'Abundance City Church is a Christ-centred congregation in Dalmada, Polokwane, holding weekly Sunday and Wednesday services and running small groups and community outreach events.',
    description_enriched_at = datetime('now')
WHERE slug = 'abundance-city-church-dalmada' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bathroom Bizarre Baobab is a bathroom and plumbing fittings showroom in Baobab Gardens, Thornhill Estate, part of the national Bathroom Bizarre retail chain, stocking sanitaryware, taps, showers and bathroom accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-16:00, Sun 09:00-13:00'
WHERE slug = 'bathroom-bizarre-baobab-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Builders Express Baobab is a smaller-format Builders hardware and building-materials store in Baobab Gardens, Thornhill Estate, part of the Builders Warehouse group, stocking building supplies, tools, paint and garden products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 08:00-16:00, Sun 08:00-14:00'
WHERE slug = 'builders-express-baobab-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Furniture Mart Baobab is a furniture and homeware store in Baobab Gardens, Thornhill Estate, part of the Furniture Mart chain, offering household, lounge and bedroom furniture.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun 10:00-15:00'
WHERE slug = 'furniture-mart-baobab-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Baobab Gardens is a fast-food restaurant in Baobab Gardens, Thornhill Estate, offering a drive-thru service alongside its usual burger, fries and McCafe menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'mcdonalds-baobab-gardens-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tile Africa Polokwane North is a tiles, bathroomware and flooring showroom in Baobab Gardens, Thornhill Estate, part of the national Tile Africa retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'tile-africa-polokwane-north-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zebbies Lighting Polokwane is a home lighting retailer in Baobab Gardens, Thornhill Estate, part of the Zebbies chain, stocking light fittings, bulbs and lighting accessories for the home.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun and Public Holidays 09:00-13:00'
WHERE slug = 'zebbies-lighting-polokwane-thornhill-estate' AND description_enriched_at IS NULL;
