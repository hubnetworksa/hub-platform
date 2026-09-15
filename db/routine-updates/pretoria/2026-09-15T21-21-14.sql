UPDATE businesses
SET description = 'Andiccio24 Lynnwood Lane is a pizzeria in the Lynnwood Lane Retail Centre known for wood-fired, thin-crust pizzas and cupcakes.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 10:00-00:00',
    source_urls = '["https://andiccio24.co.za/contact/lynnwood-lane/", "https://restaurantguru.com/Andiccio24-Lynnwood-Pretoria", "https://pretoria.co.za/listing/andiccio24-lynnwood/"]'
WHERE slug = 'andiccio24-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Big Joe''s Real Pies Lynnwood Lane is a branch of the Big Joe''s pie bakery franchise, offering handmade pies made using traditional baking methods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/BigJoesPiesLynnwoodLane/", "https://www.mrdfood.com/food-delivery/restaurant/big-joes-lynwood-lane-equestria/17366", "https://bigjoes.co.za/"]'
WHERE slug = 'big-joes-real-pies-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Car Care Workshop Lynnwood Lane is an AA Approved Service Provider and 5-star RMI graded workshop offering vehicle servicing, diagnostics and cambelt replacement for bakkies, SUVs, 4x4s and passenger cars.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 08:00-13:00',
    source_urls = '["https://www.carcareworkshop.co.za/", "https://www.facebook.com/CarCareWorkshopLynnwoodLane/", "https://ccworkshop.co.za/about/"]'
WHERE slug = 'car-care-workshop-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem Pharmacy Lynnwood Lane is a full-service pharmacy offering prescription medicines, over-the-counter remedies, and health and beauty products, with delivery and in-store collection available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'dis-chem-pharmacy-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food Lover''s Market Lynnwood Lane is a fresh-food supermarket in the Lynnwood Lane Retail Centre offering fresh produce, a butchery, bakery and grocery items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 08:00-16:00',
    source_urls = '["https://foodloversmarket.co.za/stores/gauteng/food-lovers-market-lynnwood-lane/", "https://www.africabizinfo.com/ZA/food-lovers-market-lynnwood-lane-012-111-1999", "https://my-catalogue.co.za/stores/equestria/food-lovers-market/lynnwood-lane-retail-centre"]'
WHERE slug = 'food-lovers-market-lynnwood-lane-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'HEALth-WorX Medical & Dental Centre Lynnwood is a medical and dental practice in the Lynnwood Lane Retail Centre, offering general practitioner consultations, travel medicine and dental services.',
    description_enriched_at = datetime('now')
WHERE slug = 'healthworx-medical-dental-centre-lynnwood-equestria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Innovex South Africa is a clinical research organisation in Lyttelton Manor offering integrated commercial solutions to pharmaceutical and other healthcare companies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.africanadvice.com/1125623/Pharmaceutical_Products_Services/Centurion/Innovex_%28south_Africa%29/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=191815"]'
WHERE slug = 'innovex-south-africa-lyttelton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Inovo Telecom is a cloud contact centre provider based in Southdowns, offering fully customisable customer experience solutions that integrate with a business''s existing systems and channels.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.inovo.co.za/", "https://www.itweb.co.za/office/inovotelecom/about"]'
WHERE slug = 'inovo-telecom-pty-ltd-southdowns' AND description_enriched_at IS NULL;
