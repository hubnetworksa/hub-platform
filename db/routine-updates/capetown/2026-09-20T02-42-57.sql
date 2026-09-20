-- Job 4: description enrichment sweep, checkpoint 2 of 2 (10 businesses)

UPDATE businesses
SET description = 'Soviet is a South African jeanswear and streetwear brand founded in 1987, offering denim, footwear and accessories for men, women and kids; this store trades from Golden Acre Shopping Centre, Cape Town CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "http://sovietdenim.blogspot.com/2015/10/a-golden-affair-with-soviet-gold-is.html", "https://sovietdenim.com/pages/about-soviet"]'
WHERE slug = 'soviet-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sparesboyz / Korean Boyz is a new and used motor spares dealer in Salt River specialising in Korean vehicle brands such as Hyundai, Kia and Daewoo alongside a wider range of OEM and aftermarket used parts, and is RMI-approved.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com", "https://za.africabz.com", "https://sparesboyz.com/sparesboyz-cape-town-south-africa/"]'
WHERE slug = 'sparesboyz-korean-boyz-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometry retailer offering eye examinations and screening for conditions such as glaucoma and cataracts alongside eyewear and hearing services at selected stores; this branch trades from Shop 15 in Richmond Corner, Richwood.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:30, Sun 09:00-13:00, Public holidays Closed',
    source_urls = '["https://www.specsavers.co.za/store/richmond-corner", "https://www.atterbury.co.za/richmond-corner-15/", "https://www.specsavers.co.za/"]'
WHERE slug = 'spec-savers-richmond-corner-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometry retailer offering eye examinations and screening for conditions such as glaucoma and cataracts alongside eyewear and hearing services at selected stores; this branch trades from Shop 8 in Adelphi Centre, Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun and Public holidays Closed',
    source_urls = '["https://www.specsavers.co.za/store/sea-point", "https://www.mallguide.co.za/malls/view/866/adelphi-centre", "https://www.specsavers.co.za/"]'
WHERE slug = 'spec-savers-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometry retailer offering eye examinations and screening for conditions such as glaucoma and cataracts alongside eyewear and hearing services at selected stores; this branch trades from Shop 7 in Bothasig Square, Bothasig.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.specsavers.co.za/store/bothasig", "https://www.mediwallet.co.za/medicalfinance/specsavers-bothasig-3275", "https://www.specsavers.co.za/"]'
WHERE slug = 'specsavers-bothasig' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometry retailer offering eye examinations and screening for conditions such as glaucoma and cataracts alongside eyewear and hearing services at selected stores; this branch trades from Shop S50 in Golden Acre, Cape Town CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.specsavers.co.za/stores", "https://www.specsavers.co.za/"]'
WHERE slug = 'specsavers-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometry retailer offering eye examinations and screening for conditions such as glaucoma and cataracts alongside eyewear and hearing services at selected stores; this branch trades from Shop G23 in Rondebosch Main & Fountain Centre, Rondebosch.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun and Public holidays Closed',
    source_urls = '["https://www.specsavers.co.za/store/rondebosch", "https://www.rondeboschmain.co.za/stores/", "https://www.specsavers.co.za/"]'
WHERE slug = 'specsavers-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportscene is a South African streetwear retailer selling footwear, apparel and accessories from brands including Nike, adidas Originals, PUMA, Converse and Vans; this store trades from Golden Acre Shopping Centre, Cape Town CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/sportscene-golden-acre-shopping-centrecnr-adderley-strand-str/62727", "https://centurionmall.co.za/stores/store-list/sportscene/"]'
WHERE slug = 'sportscene-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportsmans Warehouse is South Africa''s largest retailer of sports, fitness and outdoor equipment, stocking hunting, fishing, camping and team-sport gear alongside activewear and footwear; this store trades from The Point, Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sportsmanswarehouse.co.za/store/the-point-shopping-mall-sea-point/", "https://za.africabz.com/western-cape/sportsmans-warehouse-53856", "https://www.sportsmanswarehouse.co.za/"]'
WHERE slug = 'sportsmans-warehouse-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spur is a South African family steakhouse chain serving steaks, ribs, burgers and Tex-Mex-inspired dishes; this branch, known as Indigo Spur, trades from Waterstone Village, Somerset West.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterstonevillage.co.za", "https://getoccupi.com/malls/waterstone-village", "https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/somerset-west/indigo-spur"]'
WHERE slug = 'spur-waterstone-somerset-west' AND description_enriched_at IS NULL;
