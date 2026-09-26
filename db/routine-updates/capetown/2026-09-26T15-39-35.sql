-- Job 4: description enrichment sweep (8 businesses, full backlog this run)

UPDATE businesses
SET description = 'A dental practice operating from Glencairn Shopping Centre, offering general dentistry services to the Glencairn and greater Simon''s Town area.',
    description_enriched_at = datetime('now')
WHERE slug = 'absolute-dental-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A community-based non-profit organisation in Hangberg, Hout Bay, offering recovery, healing and empowerment support to people and families affected by substance misuse, established in 2019.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.westerncape.gov.za/facility/hangberg-dreams", "https://hangbergdreams.org.za/contacts/", "https://hangbergdreams.org.za/about/"]'
WHERE slug = 'hangberg-dreams-hangberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hangberg Pre-Primary School is a pre-primary school on the grounds of Sentinel Primary School in Hangberg, Hout Bay, providing early childhood education with a daily breakfast and cooked meal, and marking a decade of operation in 2026.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30'
WHERE slug = 'hangberg-pre-primary-school-hangberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hout Bay Main Road Clinic is a public healthcare facility in Imizamo Yethu run by the City of Cape Town, providing general health, HIV/TB and substance-abuse support services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-21:00',
    source_urls = '["https://www.capetown.gov.za/local%20and%20communities/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/hout-bay-main-road-clinic", "https://www.africanadvice.com/1387208/Hospitals,_Medical_Centre_And_Clinics/Cape_Town/Hout_Bay_Main_Road_Clinic/", "https://d7.westerncape.gov.za/facility/hout-bay-main-road-clinic"]'
WHERE slug = 'hout-bay-main-road-clinic-imizamo-yethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kwikspar Glencairn is a supermarket in Glencairn Shopping Centre serving Simon''s Town and Glencairn, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-21:00',
    source_urls = '["https://www.thinklocal.co.za/biz/kwikspar-glencairn-glencairn", "https://za.africabz.com/western-cape/kwikspar-glencairn-2437", "https://www.tiendeo.co.za/stores/simons-town/kwikspar-cnr-birkenhead-glencairn-freeway-glencairn/48994"]'
WHERE slug = 'kwikspar-glencairn-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Little Lambs Christian Daycare is a registered non-profit early childhood centre in Imizamo Yethu, Hout Bay, founded in 1991 by the SEEDS Trust, providing early education, daily meals and care for local preschoolers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.littlelambs.org.za/contact-us", "https://www.capetownetc.com/education/little-lambs-centre-brings-education-and-empowerment-to-imizamo-yethu/", "https://www.littlelambs.org.za/who-we-are"]'
WHERE slug = 'little-lambs-christian-daycare-imizamo-yethu' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Khaya is a takeaway pizza and burger joint in Glencairn Shopping Centre, known for a small, original menu of African-inspired pizzas with a South African twist.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.mrd.com/delivery/restaurant/the-khaya-pizza-burger-joint-glencairn/30583", "https://www.facebook.com/PizzaKhaya/", "https://www.tripadvisor.co.za/Restaurant_Review-g319718-d5849697-Reviews-Pizza_Khaya-Simon_s_Town_Western_Cape.html"]'
WHERE slug = 'pizza-khaya-glencairn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sentinel Primary School is a public school in Hangberg, Hout Bay, established in 1969 as one of the oldest seaside schools in the Western Cape and later expanded into an intermediate school covering Grades 8 and 9.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sentinelps.co.za/contact-us/", "https://www.brabys.com/business/4880811/south-africa/western-cape/cape-town/hout-bay/harbour-rd/primary-school/schools/sentinel-primary-school", "https://www.sentinelps.co.za/about-us/history/"]'
WHERE slug = 'sentinel-primary-school-hangberg' AND description_enriched_at IS NULL;
