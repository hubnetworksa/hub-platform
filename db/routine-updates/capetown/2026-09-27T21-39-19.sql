UPDATE businesses
SET description = 'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice in Brackenfell providing general companion-animal care as well as emergency veterinary services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-11:00, 15:00-18:30',
    source_urls = '["https://www.facebook.com/brackenfellvet/", "https://topvet.net/practices/south-africa/western-cape/cape-town/brackenfell-dierekliniek---animal-clinic-26629", "https://brackenfellanimalclinic.co.za/index.php/contact/"]'
WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr SAE Chikte is a dental practice in Goodwood offering general dentistry, including cavity fillings, repair of fractured teeth, and cosmetic dentistry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=201505", "https://www.recomed.co.za/dentist/goodwood/sae-chikte/4947/4746/", "https://www.brabys.com/za/western-cape/goodwood/richmond-estate/dentists/dr-sae-chikte"]'
WHERE slug = 'dr-sae-chikte-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Thys Kachelhoffer is a general practitioner based at Vasco Medical Centre in Goodwood, offering general medical consultations and family planning services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/general-practitioner/cape-town/thys-kachelhoffer/29511/37553/", "https://www.findglocal.com/ZA/Goodwood/280911289205388/Dr-Thys-Kachelhoffer", "https://www.medpages.info/sf/index.php?page=person&personcode=352064"]'
WHERE slug = 'dr-thys-kachelhoffer-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FPS Attorneys is a Brackenfell law firm handling property law and conveyancing, civil litigation, debt collection and evictions, and family, estate and commercial law matters, instructing clients since 1998.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/", "https://www.southafricanlawyer.co.za/law-firm/f-ps-attorneys/brackenfell/"]'
WHERE slug = 'fps-attorneys-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goodwood Dental Studio is a dental practice based in Voortrekker Centre on Voortrekker Road, Goodwood.',
    description_enriched_at = datetime('now')
WHERE slug = 'goodwood-dental-studio-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kraaifontein Hardware is a family-run hardware store in Belmont Park, Kraaifontein, established in 1975, stocking building materials, hand and power tools, plumbing and electrical supplies, and paint.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 08:00-13:00, Thu Closed, Fri-Sun 08:00-17:00',
    source_urls = '["https://za.africabz.com/western-cape/kraaifontein-hardware-155672", "https://sa.jupiteryellowdetail.com/cape-town/search-by-listings/hardware-and-electrical-stores-/belmont-park-/kraaifontein-hardware/85831.jws", "https://www.facebook.com/p/Kraaifontein-Hardware-100071752537841/"]'
WHERE slug = 'kraaifontein-hardware-kraaifontein' AND description_enriched_at IS NULL;
