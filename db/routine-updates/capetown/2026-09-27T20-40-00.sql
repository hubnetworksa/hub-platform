UPDATE businesses
SET description = 'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice in Brackenfell offering wellness exams, vaccinations, dental care, deworming, and diagnostic and surgical services for pets.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/brackenfellvet/", "https://topvet.net/practices/south-africa/western-cape/cape-town/brackenfell-dierekliniek---animal-clinic-26629", "https://brackenfellanimalclinic.co.za/index.php/contact/"]'
WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr SAE Chikte is a dental practice in Richmond Estate, Goodwood, providing general dentistry -- treatment of tooth decay and cavities, repair of fractured teeth, and diagnosis and treatment of problems with teeth and gums.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=201505", "https://www.recomed.co.za/dentist/goodwood/sae-chikte/4947/4746/", "https://www.brabys.com/za/western-cape/goodwood/richmond-estate/dentists/dr-sae-chikte"]'
WHERE slug = 'dr-sae-chikte-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Thys Kachelhoffer is a general practice in Goodwood offering diagnosis and treatment, medical and health check-ups, health and nutrition advice, and management of acute and chronic conditions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/general-practitioner/cape-town/thys-kachelhoffer/29511/37553/", "https://www.findglocal.com/ZA/Goodwood/280911289205388/Dr-Thys-Kachelhoffer", "https://thysgoodwood.wixsite.com/website"]'
WHERE slug = 'dr-thys-kachelhoffer-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FPS Attorneys is a law firm in Brackenfell specialising in property law and conveyancing, litigation, debt collection and evictions, insolvency, family law, wills and estates, and commercial law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/", "https://fpslaw.co.za/contact.php"]'
WHERE slug = 'fps-attorneys-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goodwood Dental Studio is a dental practice in Voortrekker Centre, Goodwood, offering general and cosmetic dentistry including routine check-ups, cosmetic procedures, and orthodontic treatment.',
    description_enriched_at = datetime('now')
WHERE slug = 'goodwood-dental-studio-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kraaifontein Hardware is a family-run hardware store in Belmont Park, Kraaifontein, trading since 1975 and supplying household hardware and home-improvement products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat/Public Holidays 08:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/kraaifontein-hardware-155672", "https://sa.jupiteryellowdetail.com/cape-town/search-by-listings/hardware-and-electrical-stores-/belmont-park-/kraaifontein-hardware/85831.jws", "http://kraaifonteinhardware.co.za/"]'
WHERE slug = 'kraaifontein-hardware-kraaifontein' AND description_enriched_at IS NULL;
