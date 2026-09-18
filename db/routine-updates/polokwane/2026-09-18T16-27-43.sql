UPDATE businesses
SET description = 'JaggerTech Industrial Supplies and Services CC is an industrial and mining supplies business in Hospital Park, Polokwane, founded in 2003 and specialising in dust collector filters, industrial pump solutions and spares, and heat exchangers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed',
    source_urls = '["https://polokwane.infoisinfo.co.za/search/industrial-equipment", "https://www.netpages.co.za/Polokwane/Jaggertech+Industrial+Supplies+And+Services+Cc-804266.html", "https://www.industrialbuyer.co.za/company/2388-jagger-tech-industrial-supplies-services/"]'
WHERE slug = 'jaggertech-industrial-supplies-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jungle Buddies Preschool is a Christian-values pre-primary school in Sterpark, Polokwane, one of several pre-primary schools serving the suburb.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://findapreschool.co.za/preschools/limpopo/polokwane", "https://www.facebook.com/junglebuddiesschool/"]'
WHERE slug = 'jungle-buddies-preschool-sterpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Larciano Rekenmeesters is an accounting practice in Bendor, Polokwane, providing accounting, tax and consulting services to businesses in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed',
    source_urls = '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/larciano", "https://polokwane.infoisinfo.co.za/card/larciano-rekenmeesters/451823"]'
WHERE slug = 'larciano-rekenmeesters-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MJ Gateway Lodge is a self-catering guesthouse in Dalmada, Polokwane, offering a one-bedroom unit with air conditioning, secure parking, a swimming pool and Wi-Fi, with check-in from 2pm and check-out by noon.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearfinderza.com/en/business/lp/polokwane/accommodation-establishments/m-j-gateway-lodge_158172+5.html", "https://za.polomap.com/polokwane/3745", "https://www.rentbyowner.com/property/mj-gateway-lodge/AB-41794763"]'
WHERE slug = 'mj-gateway-lodge-dalmada' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maloka Thulare Attorneys is a full-service general legal practice in Polokwane Central, handling divorce, conveyancing, corporate law, accident claims and land matters.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/maloka%20thulare", "https://www.malokaattorneys.co.za/"]'
WHERE slug = 'maloka-thulare-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mamabolo Attorneys is a law practice in Polokwane Central, offering legal services to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'mamabolo-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mashingo Mokgetheng is a law practice in Polokwane Central, offering legal services to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'mashingo-mokgetheng-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mphahlele MA Attorneys is a 100% women-led law firm in Polokwane Central, established in 2005, practising litigation, matrimonial and contract law, intellectual property and labour law, with a focus on serving small and medium-sized enterprises.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/mphahlele%20ma%20attorneys", "https://mamphahleleattorneys.co.za/about-us/"]'
WHERE slug = 'mphahlele-ma-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oasis Water (Thornhill) is the Thornhill Shopping Centre branch of the Oasis Water chain, one of more than 400 stores across Southern Africa supplying purified drinking water.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sayellow.com/view/south-africa/oasis-water-polokwane-munnik-ave-in-polokwane", "https://www.thornhillshoppingcentre.co.za/shopping/store-directory.php", "https://rsa.worldorgs.com/catalog/polokwane/bottled-water-supplier/oasis-water-polokwane-thornhill"]'
WHERE slug = 'oasis-water-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ramusi Attorneys is a Limpopo-based law firm in Fauna Park, Polokwane, practising litigation, labour law and criminal law, including consultations and case mitigation.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'ramusi-attorneys-fauna-park' AND description_enriched_at IS NULL;
