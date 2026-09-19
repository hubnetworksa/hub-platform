UPDATE businesses
SET description = 'RocoMamas Kenilworth Centre is a halaal-certified branch of the RocoMamas smashburger chain, serving smashburgers, Mofo hot chicken wings and ribs from Shop 116 in Kenilworth Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'rocomamas-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rondebosch East Pharmacy operates inside Willowmead Medical Centre on Kromboom Road, dispensing prescription medicines and over-the-counter healthcare products alongside the centre''s other medical and paramedical services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-13:00'
WHERE slug = 'rondebosch-east-pharmacy-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Royal Tea is a bubble-tea bar at Riverlands Mall serving handcrafted Chinese-style teas, including classic bubble teas with tapioca pearls and fresh-fruit tea blends.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://riverlands.capetown/mall/", "https://magicpin.com/south-africa/Cape-Town/Observatory-Ct/Other/Royal-Tea-Riverlands-Mall/store/241c23a", "https://www.royalteasa.co.za/"]'
WHERE slug = 'royal-tea-riverlands-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubyyes is a resort-wear boutique at The Old Biscuit Mill, the sole South African importer of the Australian RYY swim and resortwear label and stockist of other boho-chic beach and resort brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:00-16:00',
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/rubyyes-south-africa/", "https://yesclothing.co.za/pages/about", "https://absolutelylife.co.za/rubyyes-resort-wear-10805742760905174365/"]'
WHERE slug = 'rubyyes-south-africa-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ryan''s Car Wash operates a valet and car-cleaning outlet on the Cape Quarter parking level, part of a small Cape Town chain offering full valet service, vehicle polishing and other cleaning packages across several sites.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://ryanscarwash.co.za/", "https://www.ryanscarwash.capetown/Projects"]'
WHERE slug = 'ryans-car-wash-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Cape Quarter is a supermarket inside Cape Quarter Lifestyle Village on Somerset Road, stocking groceries and everyday essentials for shoppers and residents in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-21:00, Sun 08:00-21:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.spar.co.za/Home/Store-View/SPAR-Cape-Quarter-Western-Cape"]'
WHERE slug = 'spar-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Grassy Park is a supermarket on the corner of 4th Avenue and Victoria Road, offering groceries and household goods to the surrounding Grassy Park community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-20:00'
WHERE slug = 'spar-grassy-park-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Gugulethu Square is a supermarket at the Gugulethu Square shopping centre on the corner of NY1 and Gugulethu Road, serving the local community with groceries and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:00, Sun 08:00-17:00'
WHERE slug = 'spar-gugulethu-square-gugulethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Khayelitsha Mall is a supermarket branch at KCT Mall on Walter Sisulu Street, stocking groceries and household essentials for shoppers in central Khayelitsha.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-khayelitsha-mall-khayelitsha' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Plattekloof is a supermarket at the corner of Olienhout Avenue and Plattekloof Drive, open daily for groceries and household essentials in the Plattekloof area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00',
    source_urls = '["https://my-catalogue.co.za/stores/plattekloof/spar/cnr-olienhout-plattekloof-drive", "https://yandex.com/maps/?text=SPAR%20Plattekloof%20Olienhout", "https://www.spar.co.za/home/store-view/spar-plattekloof-western-cape"]'
WHERE slug = 'spar-plattekloof-plattekloof' AND description_enriched_at IS NULL;
