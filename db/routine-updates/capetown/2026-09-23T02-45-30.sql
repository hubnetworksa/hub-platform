UPDATE businesses
SET description = 'KFC is an international fast-food chicken chain; its Liberty Promenade branch in Mitchells Plain includes a drive-thru.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wanderlog.com/place/details/12741814/kfc-promenade-mitchells-plain-mitchells-plain", "https://www.sa-venues.com/things-to-do/westerncape/go-shopping-at-the-liberty-promenade/", "https://libertypromenade.co.za/shops/kfc-drive-thru/"]'
WHERE slug = 'kfc-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC The Junxion Mall is a fast-food chicken restaurant trading from The Junxion Mall in Philippi.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-the-junction-mall-philippi' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Markham is the largest standalone menswear retail chain in Southern Africa, with over 325 stores; its Gugulethu Square branch stocks on-trend menswear, footwear, accessories and gadgets.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/markham-shop-gugulethu-square-cnr-ny-ny-roads/72725", "https://www.sayellow.com/view/south-africa/markham-gugulethu-square-in-cape-town", "https://mallofthesouth.co.za/stores/store-list/markham/"]'
WHERE slug = 'markham-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Markham is the largest standalone menswear retail chain in Southern Africa, with over 325 stores; its Vangate Mall branch in Athlone stocks on-trend menswear, footwear, accessories and gadgets.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/markham-vangate-city-athlone-in-cape-town", "https://www.tiendeo.co.za/stores/Athlone-Cape-Town/markham-vangate-mall-jakes-gerwel-drive/8939", "https://mallofthesouth.co.za/stores/store-list/markham/"]'
WHERE slug = 'markham-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medirite is Shoprite Holdings'' in-store pharmacy brand; this branch operates from the Shoprite at Grand Central Shopping Centre in Eerste River.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=244757", "https://www.tiendeo.co.za/stores/eerste-river/medirite-cnr-hindle-and-eersterivier-roads/6033", "https://www.shopriteholdings.co.za/group/brands/medirite.html"]'
WHERE slug = 'medirite-grand-central-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Micro Kem Pharmacy is a pharmacy trading from Shop 11 in Nyanga Junction Shopping Centre in Manenberg.',
    description_enriched_at = datetime('now')
WHERE slug = 'micro-kem-pharmacy-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a South African value fashion, homeware and sportswear retail group; its Vangate Mall branch in Athlone stocks affordable clothing and lifestyle products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://www.mrp.com/en_za/store/mr-price-vangate-mall", "https://www.guzzle.co.za/mr-price/athlone/", "https://www.openhours-southafrica.com/en/athlone/mr-price-mrp-43"]'
WHERE slug = 'mr-price-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a South African discount retail chain founded in 1965 and part of the Pepkor group, with around 1,800 stores across Southern Africa selling affordable clothing, footwear and homeware; this branch trades from Eerste River City Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-13:00, Tue-Wed 08:30-17:30, Thu 09:00-17:30, Fri-Sat 08:30-17:30, Sun 09:00-15:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-abf-eerste-river-city-centre-forest-drive-eerste-river-cape-town-western-cape/12003", "https://my-catalogue.co.za/stores/cape-town/pep-stores/forest-drive-shop-22abf-eerste-river-city-centre", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-eerste-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a South African discount retail chain founded in 1965 and part of the Pepkor group, with around 1,800 stores across Southern Africa selling affordable clothing, footwear and homeware; this branch trades from Cavalier Shopping Centre in Belhar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-cavalier-retail-centre-modderdam-road-belhar-cape-town-western-cape/69153", "https://vymaps.com/ZA/Pep-Stores-Belhar-Cavelier-Retail-Centre-T25702874/", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-cavalier-belhar' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a South African discount retail chain founded in 1965 and part of the Pepkor group, with around 1,800 stores across Southern Africa selling affordable clothing, footwear and homeware; this branch trades from Charlesville Mall in Matroosfontein.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-18:00, Wed 09:30-18:00, Thu-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/guguletu/pep-stores-shop-charville-shopping-centre-cnr-valhalla-drive-charles-calvert-road-matroosfontein-western-cape/11907", "https://south-africa.searchinafrica.com/business/6145071/south-africa/western-cape/bonteheuwel/charlesville/valhalla-dve/departmental-stores/clothing-retailers/pep-stores", "https://en.wikipedia.org/wiki/Pep_(South_Africa)"]'
WHERE slug = 'pep-charlesville-mall-matroosfontein' AND description_enriched_at IS NULL;
