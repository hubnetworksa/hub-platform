-- Job 4: description enrichment sweep, checkpoint 1 (10 businesses)
UPDATE businesses
SET description = 'Alpha Pharm Kraaifontein is a branch of the Alpha Pharm retail pharmacy chain, located in the Darwin Centre in Kraaifontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'alpha-pharm-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bloch-Kem Pharmacy is an independently owned pharmacy operating under The Local Choice pharmacy group, based in the Bloch Shopping Centre in Kraaifontein.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bloch-kem.co.za/", "https://www.brabys.com/za/western-cape/kraaifontein/pharmacies/bloch-kem-pharmacy", "https://www.facebook.com/TheLocalChoiceBlochKem/"]'
WHERE slug = 'bloch-kem-pharmacy-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Coffee Couture Panorama is a branch of the Coffee Couture cafe chain, situated within the Mediclinic Panorama building.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-20:00, Sat 08:00-20:00, Sun 08:00-17:00'
WHERE slug = 'coffee-couture-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Cape Gate Pharmacy is a branch of the Dis-Chem pharmacy chain, situated in the Cape Gate Shopping Precinct Centre in Brackenfell.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 09:00-18:00'
WHERE slug = 'dis-chem-cape-gate-pharmacy-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Pharmacy Panorama Healthcare Centre is a branch of the Dis-Chem pharmacy chain, situated within the Panorama Healthcare Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-13:00, Sun 09:00-13:00'
WHERE slug = 'dis-chem-panorama-healthcare-centre-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Meadowridge Pharmacy is a pharmacy located within the Meadowridge Shopping Centre in Meadowridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'meadowridge-pharmacy-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mediclinic Constantiaberg is a private hospital on Burnham Road in Plumstead, with a 24-hour emergency centre and a multi-disciplinary Mother and Child Unit covering obstetrics, neonatal critical care and paediatrics.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capeconcierge.co.za/bishopscourt-area-guide/", "https://en.wikipedia.org/wiki/Plumstead,_Cape_Town", "https://www.mediclinic.co.za/en/constantiaberg/service-offering.html"]'
WHERE slug = 'mediclinic-constantiaberg-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mediclinic Panorama is a 400-bed multi-disciplinary private acute care hospital on Rothschild Boulevard, known for its Heart, Lung and Vascular Unit and its Neonatal Critical Care Unit, with a 24-hour emergency centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'mediclinic-panorama' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melomed Bellville Pharmacy is a branch of the Melomed pharmacy group, located at the corner of Voortrekker Road and A J West Street in Bellville.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat-Sun 10:00-14:00'
WHERE slug = 'melomed-bellville-pharmacy-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Migal Vanas Photography is a photography studio in The Palms Decor and Lifestyle Centre in Woodstock, specialising in fashion, lifestyle and portrait photography, corporate headshots and event photography.',
    description_enriched_at = datetime('now')
WHERE slug = 'migal-vanas-photography-woodstock' AND description_enriched_at IS NULL;
