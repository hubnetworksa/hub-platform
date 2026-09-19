UPDATE businesses
SET description = 'AP Kerk Pietersburg (Afrikaanse Protestantse Kerk Pietersburg) is a church congregation in Welgelegen, Polokwane, serving the local Afrikaans-speaking Christian community.',
    description_enriched_at = datetime('now')
WHERE slug = 'ap-kerk-pietersburg-welgelegen' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Absa branch, in the Absa Forum Building on Hans van Rensburg Street in Polokwane''s CBD, offers everyday retail banking services including account transactions, card services and consultations.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-15:30, Sat 08:00-11:00, Sun Closed',
    source_urls = '["https://foursquare.com/v/absa/4ec600ba9a52756c53eeaeb7", "https://www.tiendeo.co.za/stores/polokwane/absa-bank-absa-forum-building-hans-van-rensburg-street-pietersburg-central/56348", "https://www.aubranches.com/absa-polokwane-branches-telephone-and-hours/"]'
WHERE slug = 'absa-bank-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CREAM Car Wash Polokwane is a car wash outlet on Thabo Mbeki Street in Fauna Park, offering vehicle washing and cleaning services to the surrounding suburb.',
    description_enriched_at = datetime('now')
WHERE slug = 'cream-car-wash-polokwane-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Capitec branch, at Shop 12, 101 Bok Street in Polokwane Central, provides day-to-day retail banking services including transactions, card issuing and account support to the CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://vymaps.com/ZA/Capitec-Bank-Polokwane-City-Centre-T165884/", "https://www.africabizinfo.com/ZA/capitec-bank-polokwane-city-centre-0860-102-043", "https://openhours-southafrica.com/en/polokwane/capitec-bank-89"]'
WHERE slug = 'capitec-bank-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr GJ van Rooyen is a general medical practice in Bendor, Polokwane, offering general healthcare consultations to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-gj-van-rooyen-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr. Dixon Mphahlele Primary School is a public primary school in Lebowakgomo, forming part of the Capricorn South Schools cluster within Limpopo''s Capricorn District public education system.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-dixon-mphahlele-primary-school-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fauna Veterinary Clinic is a veterinary practice in Fauna Park, Polokwane, providing animal healthcare and consultations for pets in the surrounding suburb.',
    description_enriched_at = datetime('now')
WHERE slug = 'fauna-veterinary-clinic-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Incredible Connection is a South African technology retail chain, founded in 1995 and headquartered in Sandton, selling laptops, desktop computers, printers, cellphones, tablets and gaming consoles; this Mall of the North branch also has an in-store Technical Centre for installations, upgrades and repairs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/incredible-connection", "https://www.incredible.co.za/storelocator/store/index/id/60", "https://en.wikipedia.org/wiki/Incredible_Connection"]'
WHERE slug = 'incredible-connection-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kingsley Heath is a South African luxury fashion brand established in 1994, offering men''s and women''s clothing, leather goods and footwear inspired by Africa''s natural heritage; this Mall of the North store is one of its boutiques across South Africa, Namibia and London.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://kingsleyheath.co.za/pages/store-locator", "https://kingsleyheath.co.za/pages/about-kingsley-heath"]'
WHERE slug = 'kingsley-heath-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kurt Geiger is a British luxury footwear and accessories brand founded in 1963 and headquartered in London; this Mall of the North outlet stocks its shoe and accessory ranges for the Polokwane market.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/kurt-geiger", "https://en.wikipedia.org/wiki/Kurt_Geiger"]'
WHERE slug = 'kurt-geiger-mall-of-the-north-bendor' AND description_enriched_at IS NULL;
