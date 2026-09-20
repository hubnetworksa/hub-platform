-- Job 4: description enrichment sweep -- 10 businesses, full backlog cleared this run
UPDATE businesses
SET description = 'Big Ben Lodge is a guesthouse in Moregloed offering air-conditioned rooms with private bathrooms, free Wi-Fi and flat-screen TVs, set around a garden and outdoor swimming pool with an on-site restaurant and bar serving breakfast, lunch and dinner.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Hotel_Review-g312624-d4752573-Reviews-Big_Ben_Lodge-Polokwane_Limpopo_Province.html", "https://polokwanetourism.co.za/item/big-ben-lodge/", "https://www.booking.com/hotel/za/big-ben-lodge.html", "https://www.expedia.com/Polokwane-Hotels-Big-Ben-Lodge.h39757185.Hotel-Information"]'
WHERE slug = 'big-ben-lodge-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bronkhorst Crane Hire is a mobile crane hire company based in Futura, offering machine moving, rigging and steel-erection services to industrial and construction clients across the Polokwane area, with more than 30 years in the business.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.findmy.co.za/services/business/bronkhorst-crane-hire/10191", "https://www.brabys.com/za/limpopo/polokwane/machine-moving-specialists/bronkhorst-crane-hire", "https://www.bronkhorstcranehire.co.za/"]'
WHERE slug = 'bronkhorst-crane-hire-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank''s branch at Turfloop Plaza offers everyday banking services, including account transactions, cash deposits and withdrawals, to residents and students in Mankweng and the surrounding Turfloop area.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-turfloop-plaza-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr ML Tjelele is a general dental practice in Hospital Park, Polokwane, offering routine dental care and treatment to patients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-ml-tjelele-hospark' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Honchos is a SANHA halaal-certified flame-grilled chicken and chips takeaway at Paledi Mall, serving the Mankweng and Turfloop community.',
    description_enriched_at = datetime('now')
WHERE slug = 'honchos-mankweng' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'J''s Cleaning is a home and office cleaning service based in Moregloed, using SABS-approved chemicals and offering customisable cleaning packages with free local delivery within Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'js-cleaning-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lenkay Motors is a used-car dealership in Futura, Polokwane, listing pre-owned vehicles for sale from its Vermikuliet Street premises.',
    description_enriched_at = datetime('now')
WHERE slug = 'lenkay-motors-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medleb Private Hospital is a private acute-care hospital in Lebowakgomo offering orthopaedic surgery, general and maternity wards, and a 24-hour emergency unit with two operating theatres and an on-site radiology department.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://rfmcf.co.za/search-medical-provider/hospital/hospital/medleb-private-hospital/186/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=395660", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1926816"]'
WHERE slug = 'medleb-private-hospital-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Power Supplies is an industrial electrical distributor in Futura, supplying CBI-electric low-voltage products including circuit breakers and wiring accessories to trade and industrial customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'polokwane-power-supplies-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Courier Guy''s Thornhill branch, at Shop 5 in Thornhill Shopping Centre, handles parcel drop-off, collection and courier services for the Bendor and Thornhill area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'the-courier-guy-thornhill-thornhill-estate' AND description_enriched_at IS NULL;
