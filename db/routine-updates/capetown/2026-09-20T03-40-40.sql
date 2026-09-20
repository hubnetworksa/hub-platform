UPDATE businesses
SET description = 'Ackermans is a South African fashion retail chain tracing back to 1916, when Gus Ackerman opened the first store in Wynberg, Cape Town; now part of the Pepkor group, this branch trades from the Philippi Shopping Centre in Philippi.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/AckermansPhilippi/", "https://www.tiendeo.co.za/stores/crossroads/ackermans-philippi-shopping-centrecnr-lansdowne-eisleben-rds/15251", "https://entrepreneurhubsa.co.za/ackermans-history-from-humble-beginnings-to-retail-dominance/"]'
WHERE slug = 'ackermans-philippi-shopping-centre-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cashbuild is a South African hardware and building-materials retailer founded in 1978, stocking cement, timber, roofing, plumbing and hardware supplies; this branch trades from the Philippi Shopping Centre in Philippi.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/bysuburb/philippi/category/malls-and-shopping/", "https://www.yep.co.za/biz/store/iyp/2371682_2", "https://www.brabys.com/za/western-cape/cape-town/philippi/building-materials-supplies/cash-build", "https://startupmag.co.za/2025/02/building-success-the-rise-of-cashbuild-in-south-africa/"]'
WHERE slug = 'cashbuild-philippi-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Pharmacy is a South African retail health and beauty chain; this branch operates inside The Junxion Mall in Philippi, offering pharmacy, health and beauty services alongside the mall''s other tenants.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-15:00'
WHERE slug = 'clicks-pharmacy-the-junction-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'House of Lipstick is an online and in-store cosmetics retailer in Lansdowne, selling makeup, bags, perfume, accessories and skincare, with nationwide courier delivery across South Africa.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu & Sat 10:30-16:00, Fri 10:30-12:00 & 14:00-16:00',
    source_urls = '["https://www.facebook.com/p/House-of-Lipstick-100089651123092/", "https://houseoflipstick1.com/", "https://oncosmetics.com/company/house-of-lipstick/", "https://www.tiktok.com/@house_oflipstick"]'
WHERE slug = 'house-of-lipstick-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a South African budget clothing and homeware retailer founded in Upington in 1965 by Renier van Rooyen; now a Pepkor subsidiary with around 1,800 stores across Southern Africa, this branch trades from the Philippi Shopping Centre in Philippi.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-shoprite-centre-cnr-lansdowne-new-eisleben-philippi-cape-town-western-cape/12531", "https://my-catalogue.co.za/stores/philippi/pep-stores/shoprite-centre-cnr-lansdowne-new-eisleben", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-philippi-shopping-centre-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pharmacy Penlyn is an independent pharmacy operating from the Philippi Shopping Centre in Philippi, offering dispensing and general pharmacy services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'pharmacy-penlyn-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza is a South African pizza and pasta takeaway chain; this branch trades from Shop 190 at Liberty Promenade Shopping Centre in Beacon Valley, Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-21:00',
    source_urls = '["https://libertypromenade.co.za/shops/romans-pizza/", "http://textmap.co.za/3/47913", "https://vymaps.com/ZA/ROMANS-PIZZA-164648/", "https://my-catalogue.co.za/stores/beacon-valley/romans-pizza/shop-190-liberty-promenade-az-berman-drive-shop-190-liberty-promenade-shopping-centre-mitchells-plain-cape-town"]'
WHERE slug = 'romans-pizza-liberty-promenade-beacon-valley' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Golden Acre is a retail banking branch operating from the Golden Acre shopping centre in Cape Town''s CBD, offering everyday banking services to shoppers and city-centre workers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-15:30',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.standardbank.co.za/branch-locator", "https://za.bankopenhours.com/golden-acre/"]'
WHERE slug = 'standard-bank-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank Mowbray Service Centre is a retail banking branch on Main Road in Mowbray, offering everyday banking services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-mowbray-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steenberg Wine Estate & Hotel occupies Cape Town''s oldest farm, established in 1682 by Catharina Ustings Ras; declared a national monument in 1983, the historic Tokai property has been redeveloped into a five-star hotel, spa, vineyard and golf estate.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://steenbergfarm.com/contact-us/", "https://constantiavalley.com/steenberg-vineyards/", "https://sahistory.org.za/place/steenberg-farmstead-tokai-road-constantia", "https://en.wikipedia.org/wiki/Steenberg_Estate"]'
WHERE slug = 'steenberg-wine-estate-hotel-tokai' AND description_enriched_at IS NULL;
