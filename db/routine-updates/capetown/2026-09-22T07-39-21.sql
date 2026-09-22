UPDATE businesses
SET description = 'BPM Toolcraft is a specialist power tool and hardware retailer that has traded in the southern suburbs since the 1970s, stocking major brands such as Festool, Makita, Metabo, Bosch and Hikoki for both industry professionals and retail customers. It launched an online sales division in 2016 that grew into one of South Africa''s largest online power tool suppliers and wholesalers, and moved into its current larger premises on Victoria Road in 2017.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.net.za/company/bpm-toolcraft-23706862.html", "https://www.africabizinfo.com/ZA/bpm-toolcraft-021-705-1247", "https://www.toolcraft.co.za/pages/about-us"]'
WHERE slug = 'bpm-toolcraft-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Durbanville Town Centre is a pharmacy and health-and-beauty retailer inside Durbanville Town Centre on Wellington Road, part of the national Dis-Chem pharmacy chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 08:30-15:00, Sun Closed'
WHERE slug = 'dis-chem-durbanville-town-centre-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jumbo Clothing is a fashion retailer on Voortrekker Road in Bellville, part of a South African clothing chain selling menswear, womenswear, and children''s clothing and footwear at value prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://foursquare.com/v/jumbo-clothing/5dc2ee9b021f6100086d47b6", "https://www.brabys.com/za/western-cape/bellville/clothing-retailers/jumbo-clothing", "https://www.jumboclothing.co.za/"]'
WHERE slug = 'jumbo-clothing-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Home Durbanville Town Centre is a homeware and household goods store inside Durbanville Town Centre, part of the national PEP Home retail chain selling furniture, bedding, and other home essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-14:30, Sun 09:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/pep-home-durbanville-town-centre-175998", "https://www.tiendeo.co.za/stores/durbanville/pep-home-durbanville-town-centre-wellington-street/71355", "https://www.durbanvilletowncentre.co.za/stores/pep-home-2/"]'
WHERE slug = 'pep-home-durbanville-town-centre-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'U-turn Thrift Shop in Durbanville is a charity thrift store run by U-turn Homeless Ministries, with proceeds from donated-goods sales funding the organisation''s work-readiness programme for people experiencing homelessness in Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waze.com/live-map/directions/za/wc/cape-town/u-turn-thrift-shop-durbanville?to=place.ChIJrXiQqvxXzB0ROCGdw8ebvYg", "https://grapevinesa.co.za/index.php/u-turn-charity-shop-durbanville", "https://homeless.org.za/charity-shops/"]'
WHERE slug = 'u-turn-thrift-shop-durbanville' AND description_enriched_at IS NULL;
