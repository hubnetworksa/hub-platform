UPDATE businesses
SET description = 'Cape Union Mart is an outdoor and travel gear retailer, with a branch at Mall of the North in Bendor, Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/shop/cape-union-mart/", "https://www.facebook.com/p/Cape-Union-Mart-Mall-of-the-North-100089369502396/", "https://www.somersetmall.co.za/shop/cape-union-mart"]'
WHERE slug = 'cape-union-mart-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'City Centre Pharmacy is a pharmacy in Polokwane Central, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'city-centre-pharmacy-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kuaho Attorneys is a law firm in Polokwane Central, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'kuaho-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medicare Pharmacy is a pharmacy in Polokwane Central, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'medicare-pharmacy-polokwane-central' AND description_enriched_at IS NULL;
