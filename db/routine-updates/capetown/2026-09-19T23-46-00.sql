UPDATE businesses
SET description = 'Silvan is a Cape Town gifting and lifestyle brand''s flagship store in Cape Quarter Lifestyle Village, De Waterkant, selling locally made botanical products including silk scarves, homeware, scented body products and bamboo cotton knitwear.',
    description_enriched_at = datetime('now')
WHERE slug = 'silvan-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skin Recode is a skin clinic in Riverlands Mall, Observatory, offering science-based facials and treatments for acne, ageing and hyperpigmentation, including microneedling and laser therapy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://riverlands.capetown/mall/shop-g51/", "https://skinrecode.co.za/", "https://www.fresha.com/a/skin-recode-cape-town-riverlands-mall-51-gogosoa-street-f5hhnoer"]'
WHERE slug = 'skin-recode-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skin Renewal Cape Quarter is an aesthetic clinic in Cape Quarter Lifestyle Village, De Waterkant, offering treatments including Botox and dermal fillers, laser and light therapies, body contouring and medical skin needling.',
    description_enriched_at = datetime('now')
WHERE slug = 'skin-renewal-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sneaker Factory is a sneaker and footwear store in Golden Acre Shopping Centre, Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'sneaker-factory-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet is a beauty salon in Gardens Shopping Centre, Gardens, offering nail, beauty and spa treatments as part of the national Sorbet salon chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'sorbet-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet is a beauty salon in Waterstone Village, Somerset West, offering nail, beauty and spa treatments as part of the national Sorbet salon chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.waterstonevillage.co.za", "https://www.tiendeo.co.za/stores/somerset-west/sorbet", "https://stores.salonssorbet.co.za/western-cape/cape-town/waterstone-village-shop-9"]'
WHERE slug = 'sorbet-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet is a beauty salon in Cape Quarter Lifestyle Village, De Waterkant, offering nail, beauty and spa treatments as part of the national Sorbet salon chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'sorbet-salon-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Man is a men''s grooming and barbering salon in Cape Quarter Lifestyle Village, De Waterkant, part of the national Sorbet Man chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00'
WHERE slug = 'sorbet-man-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon is a beauty salon in Rondebosch Main Centre, Rondebosch, offering nail, beauty and spa treatments as part of the national Sorbet salon chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'sorbet-salon-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet is a beauty salon in The Point, Sea Point, offering nail, beauty and spa treatments as part of the national Sorbet salon chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 08:00-17:00, Sun 09:00-16:00'
WHERE slug = 'sorbet-sea-point-the-point-sea-point' AND description_enriched_at IS NULL;
