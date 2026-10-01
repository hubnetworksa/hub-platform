-- Job 4: description enrichment sweep (4 records, clears the backlog to zero)
UPDATE businesses
SET description = 'Jackie''s On 5th is a hair and beauty salon on 5th Avenue in Lotus River, offering hair styling, colouring and treatments such as keratin and permanent straightening alongside waxing, facials and makeup services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Sat 08:00-19:00, Sun 08:00-13:00'
WHERE slug = 'jackies-on-5th-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miss J''z Hair and Beauty Bar is a hair and beauty salon on 5th Avenue in Lotus River, offering hair styling and colour treatments such as Brazilian and Botox treatments alongside eyebrow, eyelash and waxing services.',
    description_enriched_at = datetime('now')
WHERE slug = 'miss-jzs-hair-and-beauty-bar-lotus-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rite Price Supermarket is a neighbourhood grocery store on Hek Street in Lavender Hill, Steenberg, serving the local community with everyday grocery supplies.',
    description_enriched_at = datetime('now')
WHERE slug = 'rite-price-supermarket-lavender-hill' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sams Hardware & Gas is a hardware store on Melkbos Street in Lentegeur, Mitchells Plain, stocking hardware, plumbing, gas, paint and electrical supplies and tools for the local community.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/iyp/1676462_2", "https://take.app/samshardware/follow", "https://take.app/samshardware"]'
WHERE slug = 'sams-hardware-and-gas-lentegeur' AND description_enriched_at IS NULL;
