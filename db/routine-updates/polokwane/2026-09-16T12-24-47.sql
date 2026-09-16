UPDATE businesses
SET description = 'Auto Supreme is a car wash and vehicle detailing outlet based at The Farmyard Trading Post in Bendor, offering full car washes and detailing to a large regular customer base, with an on-site coffee kiosk for customers to enjoy while they wait.',
    description_enriched_at = datetime('now')
WHERE slug = 'auto-supreme-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gizara''s Carwash & Cleaning Services is a car wash and cleaning company on Church Street that has operated in Polokwane for over 20 years, with several branches across the city and one in Pretoria.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.gizaracleaners.co.za/", "https://cylex.net.za/p?f=gizara-carwash-and-cleaning-services&id=18005444", "https://www.africanadvice.com/1153150/Car_Wash_And_Accessories/Limpopo/Gizara''s_Car_Wash/"]'
WHERE slug = 'gizaras-carwash-cleaning-services-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lifestyle Corner Valet and Lounge is a car wash, lounge and hair salon on Van Warmelo Street that has served a broad range of customers in Polokwane since opening in December 2017.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.polomap.com/gl/polokwane/16040", "https://www.cylex.net.za/company/lifestyle-corner-valet-and-lounge-23751200.html", "https://www.citizen.co.za/review-online/news-headlines/2018/01/18/lifestyle-corner-offers-triple-treat-city/"]'
WHERE slug = 'lifestyle-corner-valet-and-lounge-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Skip Boyz is a skip bin and rubbish removal service based in Futura, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'skip-boyz-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Red Bin is a rubble and waste removal service in Ladine, Polokwane, part of the BF Petroleum Group, offering residential, commercial, industrial and construction waste collection with fast turnaround times.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-red-bin-ladine' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Thomson''s Body 107 is a Chery-approved panel beating and spray painting workshop on Mangaan Street in Superbia, a family-run auto body business operating for over 30 years and recognised as Polokwane''s best panel beater in a 2025 local readers'' choice award.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.chery.co.za/owners-area/panel-beaters/TSB001", "https://www.brabys.com/za/limpopo/polokwane/superbia/motor-repairs/thomsons-body-107", "https://www.citizen.co.za/review-online/news-headlines/local-news/2025/12/04/thomsons-body-107-crowned-the-best-panel-beater-in-polokwane/"]'
WHERE slug = 'thomsons-body-107-superbia' AND description_enriched_at IS NULL;
