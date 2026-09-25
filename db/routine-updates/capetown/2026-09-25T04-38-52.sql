-- Job 4: description enrichment sweep -- clears entire current backlog (6 businesses)
UPDATE businesses
SET description = 'Future Tool is a tool and hardware retailer operating from Viking Business Place in Thornton, offering curbside pickup, delivery and in-store shopping for its range of tools and equipment.',
    description_enriched_at = datetime('now')
WHERE slug = 'future-tool-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'County Fair is an Astral Foods poultry brand producing fresh, frozen and value-added chicken products for the Western Cape market and beyond, operating from its Epping Industria site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://za.africabz.com/western-cape/county-fair-37960", "https://www.ananzi.co.za/ads/za/western-cape/cape-town/epping-industria/poultry-products/county-fair-foods-pty-ltd", "https://www.astralfoods.com/our-brands/county-fair/"]'
WHERE slug = 'county-fair-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'GSK operates a pharmaceutical production and distribution facility in Epping Industria as part of GlaxoSmithKline''s South African operations.',
    description_enriched_at = datetime('now')
WHERE slug = 'gsk-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Indigo Brands is a subsidiary of AVI Limited that has manufactured, marketed and distributed cosmetics, fragrances and personal care products from its Epping Industria site since 1955, including licensed brands such as Yardley and Lentheric.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.indigobrands.com/contact-us/", "https://hombaze.co.za/indigo-brands-6398750189483727158/", "https://www.indigobrands.com/"]'
WHERE slug = 'indigo-brands-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kimberly-Clark operates a paper products manufacturing site, known as Epping Mill, on Hewett Avenue in Epping Industria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/kimberly-clark-hewett-ave-epping-industria-2,-cape-town", "https://za.kompass.com/c/kimberly-clark-cape-town/zan299893/", "https://brabys.com/south-africa/cape-town/verified-business/kimberly-clark-of-sa-pty-ltd"]'
WHERE slug = 'kimberly-clark-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Quality Beverages, founded in 1989, is a soft drink manufacturer and bottler based in Epping Industria, supplying a range of beverage flavours for local distribution.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/10653045_2", "https://www.thinklocal.co.za/biz/quality-beverages-cape-town", "https://za.kompass.com/c/quality-beverages-2000-pty-ltd/za021566/"]'
WHERE slug = 'quality-beverages-epping' AND description_enriched_at IS NULL;
