UPDATE businesses
SET description = 'Polo is a South African fashion retailer at Mall of the North, Bendor, selling menswear, womenswear, footwear and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'polo-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Scrapyards is a scrap metal yard in Futura, Polokwane, buying and processing scrap metal.',
    description_enriched_at = datetime('now')
WHERE slug = 'polokwane-scrapyards-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Postnet is a courier, printing and postal services outlet inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'postnet-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rage is a footwear and sneaker retailer inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'rage-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rage is a footwear and sneaker retailer at Game Centre, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'rage-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rays Florist is a flower and gift shop at Uhuru Lifestyle Emporium, Polokwane, offering floral arrangements, bouquets and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'rays-florist-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rochester is a furniture and homeware retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'rochester-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rochester is a furniture and homeware retailer at Game Centre, Polokwane.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat-Sun 08:30-15:00'
WHERE slug = 'rochester-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'RocoMamas is a burger restaurant at The Greenery, Polokwane, known for smashburgers, hot chicken wings, ribs and signature milkshakes.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-the-greenery-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SJ van der Merwe Technical High School is a public, no-fee secondary school in Lebowakgomo offering the National Senior Certificate curriculum with a focus on technical subjects.',
    description_enriched_at = datetime('now')
WHERE slug = 'sj-van-der-merwe-technical-high-school-lebowakgomo' AND description_enriched_at IS NULL;
