UPDATE businesses
SET description = 'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice at the Mediese Sentrum on Old Paarl Road, offering vaccinations, dental care, deworming, diagnostics and surgery for pets in Brackenfell.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-11:00, 15:00-18:30',
    source_urls = '["https://www.facebook.com/brackenfellvet/", "https://topvet.net/practices/south-africa/western-cape/cape-town/brackenfell-dierekliniek---animal-clinic-26629", "https://savet.co.za/vet/brackenfell-animal-clinic", "https://www.openhours-southafrica.com/en/cape-town/brackenfell-dierekliniek-animal-clinic"]'
WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr SAE Chikte is a dental practice on the corner of Voortrekker and Hugo Street in Richmond Estate, Goodwood, offering general restorative, cosmetic and preventive dentistry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-12:00, Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=201505", "https://www.recomed.co.za/dentist/goodwood/sae-chikte/4947/4746/", "https://www.brabys.com/za/western-cape/goodwood/richmond-estate/dentists/dr-sae-chikte"]'
WHERE slug = 'dr-sae-chikte-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Thys Kachelhoffer is a general practice at Vasco Medical Centre on Vasco Boulevard, Goodwood, providing diagnosis and treatment, routine medical check-ups, health and nutrition advice, and management of acute and chronic conditions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.recomed.co.za/general-practitioner/cape-town/thys-kachelhoffer/29511/37553/", "https://www.findglocal.com/ZA/Goodwood/280911289205388/Dr-Thys-Kachelhoffer", "https://www.medpages.info/sf/index.php?page=person&personcode=352064"]'
WHERE slug = 'dr-thys-kachelhoffer-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FPS Attorneys is a law firm on Gert Kotze Street, Brackenfell, established in 2005, practising property law and conveyancing, litigation, debt collection and evictions, family and estate law, wills, and commercial law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/", "https://fpslaw.co.za/contact.php"]'
WHERE slug = 'fps-attorneys-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goodwood Dental Studio, on the 1st floor of Voortrekker Centre, offers comprehensive dental treatments spanning preventive, cosmetic and implant dentistry, including routine check-ups and orthodontics.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.goodwooddentalstudio.co.za/contact-us/", "https://www.facebook.com/GoodwoodDentalStudio/", "https://www.goodwooddentalstudio.co.za/"]'
WHERE slug = 'goodwood-dental-studio-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kraaifontein Hardware is a family-run hardware store in Belmont Park, Kraaifontein, established in 1975, stocking fasteners, building materials, hand and power tools, locks, plumbing and electrical supplies, cleaning products, housewares and paint.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/kraaifontein-hardware-155672", "https://sa.jupiteryellowdetail.com/cape-town/search-by-listings/hardware-and-electrical-stores-/belmont-park-/kraaifontein-hardware/85831.jws", "https://nearfinderza.com/en/business/wc/cape-town/hardware-retail/kraaifontein-hardware_467904+1.html"]'
WHERE slug = 'kraaifontein-hardware-kraaifontein' AND description_enriched_at IS NULL;
