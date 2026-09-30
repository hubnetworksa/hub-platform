-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)

UPDATE businesses
SET description = 'Absa Bank Panorama is a bank branch of Absa Group on Rothschild Boulevard in Panorama, serving customers in the surrounding area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-15:30, Sat 08:00-11:00, Sun Closed'
WHERE slug = 'absa-bank-panorama-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Belle Ame Salon is a hair and beauty salon based in the Panorama Healthcare Centre in Panorama.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 08:00-17:00, Sat 08:00-14:00, Sun-Mon Closed'
WHERE slug = 'belle-ame-salon-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers Langverwacht Plein is a Checkers supermarket branch inside Langverwacht Plein shopping centre in Kuils River, offering groceries and everyday goods to the surrounding community.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-21:00'
WHERE slug = 'checkers-langverwacht-plein-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dentist on Wenlock Inc is an established general dental practice in Kuils River, in the area for over 10 years, offering scaling and polishing, root canal therapy, crowns, digital X-rays and tooth whitening, and registered with the South African Dental Association and the HPCSA.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-12:00 & 13:00-17:30, Sat 08:00-13:00, Sun Closed',
    source_urls = '["http://www.dentistkuilsriver.co.za/", "https://www.facebook.com/kuilsriverdentist/", "https://www.dentistkuilsriver.co.za/about-us/"]'
WHERE slug = 'dentist-on-wenlock-inc-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr C Podges Incorporated, trading as CP Dental and Aesthetics, is a family dental practice in Welgemoed offering general dentistry and aesthetic dental treatments with an emphasis on preventive care.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://cpdental.co.za/", "https://www.recomed.co.za/dentist/western-cape/dr-c-podges-incorporated/46724/56614/?service=51", "https://cpdental.co.za/about-us/"]'
WHERE slug = 'dr-c-podges-incorporated-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr M Hattingh Grant is a dental practice in Alora, Kuils River, offering general dentistry and dental surgery services to patients in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/kuils-river/alora/dentists/dr-m-hattingh-grant", "https://www.medicalnetwork.co.za/Profile/82415/Dr-Grant-Morne-Hattingh", "https://www.africanadvice.com/1243730/Dentists/Western_Cape/Dr_M_Hattingh_Grant/"]'
WHERE slug = 'dr-m-hattingh-grant-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Z Oliver is a dental practice in Welgemoed offering general dentistry services to patients in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.brabys.com/za/western-cape/bellville/welgemoed/dentists/dr-z-oliver", "https://www.meditrader.co.za/dr-z-oliver-dentist-dental-surgeon-welgemoed-western-cape", "http://textmap.co.za/3/23646"]'
WHERE slug = 'dr-z-oliver-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Haasendal Dental is a family dental practice located in the Haasendal Gables Shopping Centre in Kuils River.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'haasendal-dental-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Langverwacht Dental is a dental practice located in Langverwacht Plein shopping centre in Kuils River, offering affordable general dental care to the community.',
    description_enriched_at = datetime('now')
WHERE slug = 'langverwacht-dental-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lotz of Joy Guesthouse is a 7-room guesthouse in Panorama offering en-suite rooms, free WiFi, free parking and breakfast, within easy reach of Tygervalley, Willowbridge and Canal Walk shopping centres.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.lotzofjoy.co.za/", "https://www.capetown.travel/listing/lotz-of-joy-guesthouse/", "https://www.tripadvisor.co.za/Hotel_Review-g2427781-d4154221-Reviews-Lotz_of_Joy-Panorama_Western_Cape.html"]'
WHERE slug = 'lotz-of-joy-guesthouse-panorama' AND description_enriched_at IS NULL;
