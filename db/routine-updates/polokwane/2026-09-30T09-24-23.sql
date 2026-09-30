-- Job 4: description enrichment sweep (clears remaining backlog of 5)
UPDATE businesses
SET description = 'Hopewell Medical Centre is a general practice in Fauna Park offering GP care alongside other specialist services, including dentistry, gynaecology and psychology, under one roof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'hopewell-medical-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nedbank ATM Cycad Centre is a self-service Nedbank cash machine at Shop 4 in Cycad Centre, Bendor Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'nedbank-atm-cycad-centre-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Savannah Pharmacy is a pharmacy located inside Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'savannah-pharmacy-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank ATM Cycad Centre is a self-service Standard Bank cash machine at Shop 11 in Cycad Centre, Bendor Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-atm-cycad-centre-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Dental Studio is a general dentistry practice in Bendor Park offering CAD/CAM dentistry and oral hygiene services under strict infection-control protocols.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://thedentalstudio.co.za/", "https://www.yep.co.za/biz/store/the-dental-studio/673545", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=270120"]'
WHERE slug = 'the-dental-studio-bendor-park' AND description_enriched_at IS NULL;
