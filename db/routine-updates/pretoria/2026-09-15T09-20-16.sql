UPDATE businesses
SET description = 'Haupt Construction is a building and construction contractor based in Pierre van Ryneveld Park, Centurion.',
    description_enriched_at = datetime('now')
WHERE slug = 'haupt-construction-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hawk Lake Spur is a family-friendly Spur Steak Ranch restaurant in Centurion Mall, serving steak, ribs, burgers and wings, with a supervised kids'' play area and party bookings; the venue offers wheelchair-accessible parking, entrance and seating, plus dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://centurionmall.co.za/index.php/component/content/article/25-stores/restaurants-coffee-shops-fast-food/126-spur-hawke-lake-012-663-8709", "https://nearbyza.com/place/hawk-lake-spur", "https://centurionmall.co.za/stores/store-list/hawk-lake-spur/"]'
WHERE slug = 'hawk-lake-spur-centurion' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hay Meadow is a commercial property offering office space in Kloofsig.',
    description_enriched_at = datetime('now')
WHERE slug = 'hay-meadow-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hayscool is a hardware store in Parktown Estate, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'hayscool-parktown-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Haywire Internet Solutions is an internet service provider based in Karenpark, Pretoria, offering fast, reliable internet connectivity; the company describes itself as 100% black-owned.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://haywiresolutions.co.za/", "https://www.haywiresolutions.co.za/about-us/"]'
WHERE slug = 'haywire-internet-solutions-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hazgen Group, in Klerksoord, offers smart, sustainable waste management and recycling solutions, including hazardous waste handling, recycling services and environmental compliance support.',
    description_enriched_at = datetime('now')
WHERE slug = 'hazgen-group-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Head QuarterZ is a hairdresser and beauty salon in Garsfontein, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'head-quarterz-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Headouph Engineering is an industrial supplier and manufacturing business in Rietondale, Pretoria.',
    description_enriched_at = datetime('now')
WHERE slug = 'headouph-engineering-rietondale' AND description_enriched_at IS NULL;
