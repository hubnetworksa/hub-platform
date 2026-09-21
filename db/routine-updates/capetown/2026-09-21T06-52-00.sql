UPDATE businesses
SET description = 'Harry Goemans Garden Centre is a garden centre and nursery on Kommetjie Road in Sunnydale, supplying plants, gardening supplies and landscaping materials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-17:00'
WHERE slug = 'harry-goemans-garden-centre-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'IV Bar Westlake is an intravenous vitamin drip and wellness bar in Westlake Shopping Centre, offering nurse-administered IV therapy for hydration, immunity, energy and recovery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'iv-bar-westlake-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SBG Cape Town is a Brazilian jiu-jitsu and mixed martial arts gym in Sunnydale, offering BJJ and MMA classes for various skill levels.',
    description_enriched_at = datetime('now')
WHERE slug = 'sbg-cape-town-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smartphone ER is a mobile phone repair shop in Westlake Shopping Centre, offering screen and battery replacements for Samsung, Oppo, Vivo, Tecno, Nokia and HONOR devices using genuine parts.',
    description_enriched_at = datetime('now')
WHERE slug = 'smartphone-er-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TEARS Animal Rescue, also known as The Emma Animal Rescue Society, is an animal welfare organisation in Sunnydale that rescues, cares for and rehomes cats and dogs.',
    description_enriched_at = datetime('now')
WHERE slug = 'tears-animal-rescue-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VO2 Gear is a sportswear and sports gear retailer in Westlake Shopping Centre, offering custom kits and equipment for athletes.',
    description_enriched_at = datetime('now')
WHERE slug = 'vo2-gear-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Westpoint Properties is an estate agency and property development company on Carlton Close in Sunnydale, specialising in residential property sales in the Sun Valley and Noordhoek area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/westpoint-properties", "https://southafricafirm.com/western-cape/westpoint-properties-38335", "https://westpointproperties.co.za/"]'
WHERE slug = 'westpoint-properties-sunnydale' AND description_enriched_at IS NULL;
