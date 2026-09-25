UPDATE businesses
SET description = 'AK Knit is a family-owned knitwear and textile factory shop in Elsies River, trading since 1986 and offering baby wear alongside cotton, fleece, interlock, single jersey and towelling fabric direct to the public.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.factoryshopssa.co.za/directory/ak-knit/", "https://www.yep.co.za/biz/store/a-k-knit/17071", "https://akknit.co.za/"]'
WHERE slug = 'ak-knit-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BUCO Hardware in Elsies River Industrial is a branch of the national BUCO building materials and hardware chain, stocking building materials, roofing, timber and boards, doors and windows, electrical and plumbing supplies, tools and paint.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://textmap.co.za/3/26880", "https://2pos.co.za/2/17920", "https://www.buco.co.za/"]'
WHERE slug = 'buco-hardware-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Economical Moslem Butchery is a halal butchery on Halt Road in Elsies River, serving the local community with meat and butchery products.',
    description_enriched_at = datetime('now')
WHERE slug = 'economical-moslem-butchery-elsies-river' AND description_enriched_at IS NULL;
