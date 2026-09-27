UPDATE businesses
SET description = 'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice in Brackenfell offering general consultations, preventive care and diagnostics, including boarding, dental care and deworming for pets.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-11:00 & 15:00-18:30',
    source_urls = '["https://www.facebook.com/brackenfellvet/", "https://topvet.net/practices/south-africa/western-cape/cape-town/brackenfell-dierekliniek---animal-clinic-26629", "https://savet.co.za/vet/brackenfell-animal-clinic"]'
WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr SAE Chikte is a dental practice in Richmond Estate, Goodwood, providing general dentistry services to the local community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-12:00, Sun Closed'
WHERE slug = 'dr-sae-chikte-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Thys Kachelhoffer is a general practice on Vasco Boulevard in Goodwood, serving the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-thys-kachelhoffer-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FPS Attorneys is a law firm in Brackenfell specialising in property, family and commercial law, offering services including conveyancing, litigation, debt collection, evictions, and the drafting of wills and estates.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun By appointment',
    source_urls = '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/", "https://fpslaw.co.za/contact.php"]'
WHERE slug = 'fps-attorneys-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goodwood Dental Studio is a dental practice in Voortrekker Centre, Goodwood, offering services ranging from routine check-ups to cosmetic, implant and orthodontic dentistry.',
    description_enriched_at = datetime('now')
WHERE slug = 'goodwood-dental-studio-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kraaifontein Hardware is a family-run hardware store in Belmont Park, Kraaifontein, established in 1975, stocking building materials, hand and power tools, plumbing and electrical supplies, paint and housewares.',
    description_enriched_at = datetime('now')
WHERE slug = 'kraaifontein-hardware-kraaifontein' AND description_enriched_at IS NULL;
