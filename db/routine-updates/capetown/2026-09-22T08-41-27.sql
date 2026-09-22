UPDATE businesses
SET description = 'Parow Family Pharmacy is an independent pharmacy on the corner of Jan van Riebeeck and Voortrekker Road in Parow, offering dispensing services with WhatsApp ordering and delivery to selected areas.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-22:00'
WHERE slug = 'parow-family-pharmacy-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salon Jean Paul is a family-run hairdressing and barber salon on Voortrekker Road in Parow East, one of several branches operated across northern Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/salon-jean-paul-parow-east-parow", "https://www.yellosa.co.za/company/227786/salon-jean-paul-parow", "https://www.instagram.com/salonjeanpaulsa/?hl=en"]'
WHERE slug = 'salon-jean-paul-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Brackenfell is an optometry practice inside Brackenfell Shopping Centre, offering eye tests, spectacles and contact lenses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 09:00-14:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/spec-savers-shop--brackenfell-centre-corner-of-old-paarl-road-jeanette-street-frans-conradie-drive-hypermarket-brackenfell/54515", "https://brackenfellcentre.co.za/store/spec-savers/", "https://www.specsavers.co.za/store/brackenfell"]'
WHERE slug = 'spec-savers-brackenfell-shopping-centre-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Cape Gate is an optometry and audiology practice inside Cape Gate Shopping Centre in Brackenfell, offering eye tests, spectacles, contact lenses and hearing care.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 09:00-18:00'
WHERE slug = 'spec-savers-cape-gate-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Spec-Savers Goodwood Mall is an optometry practice inside Goodwood Mall in Goodwood, offering eye tests, spectacles and contact lenses.',
    description_enriched_at = datetime('now')
WHERE slug = 'spec-savers-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse Glengarry is a health and wellness retailer inside Glengarry Shopping Centre in Brackenfell North, stocking supplements, natural remedies and health foods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-13:00'
WHERE slug = 'wellness-warehouse-glengarry-shopping-centre-brackenfell' AND description_enriched_at IS NULL;
