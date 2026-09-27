UPDATE businesses
SET description = 'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice in Brackenfell offering routine wellness check-ups, vaccinations, dental care and diagnostic services for pets, along with boarding facilities.',
    description_enriched_at = datetime('now')
WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr SAE Chikte is a dental practice in Goodwood providing general and cosmetic dentistry services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 08:00-12:00, Sun Closed'
WHERE slug = 'dr-sae-chikte-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Thys Kachelhoffer is a general practice in Goodwood providing diagnosis and treatment, medical and health check-ups, health and nutrition advice, and management of acute and chronic conditions.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-thys-kachelhoffer-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FPS Attorneys is a law firm in Brackenfell, established in 2005, specialising in property law and conveyancing, litigation, family law, deceased estates and wills, insolvency, and commercial law.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/", "https://www.southafricanlawyer.co.za/law-firm/f-ps-attorneys/brackenfell/"]'
WHERE slug = 'fps-attorneys-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goodwood Dental Studio is a dental practice in Goodwood offering a broad range of care, from routine check-ups to advanced cosmetic dentistry and orthodontic treatment.',
    description_enriched_at = datetime('now')
WHERE slug = 'goodwood-dental-studio-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kraaifontein Hardware is a hardware store in Belmont Park, Kraaifontein, stocking building and hardware supplies for the local trade and public.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat/Public Holidays 08:00-13:00'
WHERE slug = 'kraaifontein-hardware-kraaifontein' AND description_enriched_at IS NULL;
