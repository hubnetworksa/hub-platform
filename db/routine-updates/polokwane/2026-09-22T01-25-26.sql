-- Job 4: description enrichment sweep, checkpoint 1/3 (10 businesses)
UPDATE businesses
SET description = 'Alpha Sand & Stone is a building materials supplier in Annadale, Polokwane, offering sand, stone, TLB hire and plant hire, including abnormal lowbed transport.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.callupcontact.com/b/business/Alpha_Sand_And_Stone/142150", "https://www.brabys.com/business/2649371/south-africa/limpopo/polokwane/annadale/railway-st/sand-suppliers/building-sand-stone/building-sand-suppliers/builders-plant-hire/plant-hire/sand-stone-suppliers/alpha-sand-stone-plant-hire", "https://www.polokwane.info/tools-in-polokwane/alpha-sand-stone/"]'
WHERE slug = 'alpha-sand-stone-annadale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Babirwa Travel is a travel agency in Sterpark, Polokwane, arranging flight, accommodation and cruise bookings for local travellers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.near-place.com/babirwa-travel-27-munnik-avenue-sterpark-polokwane", "https://www.yellosa.co.za/company/941237/uniglobe-babirwa-travel-sa", "https://leadsbank.co.za/company/674872"]'
WHERE slug = 'babirwa-travel-sterpark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Barloworld Equipment''s Ladanna branch is an industrial equipment supplier serving Polokwane''s construction, mining and earthmoving sector.',
    description_enriched_at = datetime('now')
WHERE slug = 'barloworld-equipment-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Betsekgadi Community Projects CC is a civil and concrete construction contractor based in Fauna Park, Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/betsekgadi-community-projects-polokwane", "https://www.yep.co.za/business/16946902_3", "https://www.yellowpages.co.za/business/16946902_3"]'
WHERE slug = 'betsekgadi-community-projects-cc-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'CTM Capricorn is a tile, bathroomware and home-improvement retailer in Baobab Gardens, Thornhill Estate.',
    description_enriched_at = datetime('now')
WHERE slug = 'ctm-capricorn-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem TLC Market Street is a pharmacy and clinic in Polokwane Central, offering dispensary, clinic and health-screening services alongside its retail range.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'dis-chem-tlc-market-street-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr TA Lowan is a specialist general surgery practice located in Library Gardens, Polokwane Central.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/lowan-ta-dr-polokwane", "https://www.yep.co.za/biz/store/iyp/2123160_2", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=135619"]'
WHERE slug = 'dr-ta-lowan-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'EVN Africa is a multidisciplinary engineering consultancy in Polokwane Central, providing civil, structural, water & sanitation and roads & infrastructure design services from pre-site appraisal through to construction monitoring.',
    description_enriched_at = datetime('now')
WHERE slug = 'evn-africa-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gelmar Baobab is a home-improvement and DIY store in Baobab Gardens, Thornhill Estate, stocking hardware and homeware with in-store advice.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:00, Sat 08:00-14:00, Sun 09:00-13:00'
WHERE slug = 'gelmar-baobab-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hino Limpopo is a Hino truck dealership in Thornhill, Polokwane, offering new and used truck sales, servicing and genuine parts.',
    description_enriched_at = datetime('now')
WHERE slug = 'hino-limpopo-thornhill-estate' AND description_enriched_at IS NULL;
