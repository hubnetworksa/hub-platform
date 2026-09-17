UPDATE businesses
SET description = 'Rocotta Brick Centre is a bricks and building-materials supplier on the R71 Tzaneen Road at the Dalmada/Myngenoegen traffic circle, stocking plaster bricks, face bricks (FBS) and brick moulds for the building trade.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 07:30-12:30'
WHERE slug = 'rocotta-brick-centre-dalmada' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Eagles Nest Lodge is a bushveld guest lodge and conference venue on a smallholding in Dalmada, offering accommodation and function facilities with reception available around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/dalmada/lodges/eagles-nest-lodge", "https://www.brabys.com/za/limpopo/polokwane/dalmada/lodges/eagles-nest-lodge", "https://www.eaglesnest.co.za/contact/"]'
WHERE slug = 'eagles-nest-lodge-dalmada' AND description_enriched_at IS NULL;
