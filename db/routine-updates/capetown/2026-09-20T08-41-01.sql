UPDATE businesses
SET description = 'Veganic Asian Mart is a vegan and vegetarian-friendly grocer in Sherwood Centre, Bergvliet, specialising in Asian ingredients and spices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:30-18:00'
WHERE slug = 'veganic-asian-mart-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Veloce Luxury Car Rental is South Africa''s largest luxury car rental company, offering self-drive and chauffeur-driven supercars, sports cars and luxury SUVs from its Cape Quarter showroom in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-16:00, Sun 10:00-15:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.veloceluxurycarrental.co.za/about", "https://www.findmy.co.za/services/business/veloce-luxury-car-rental/2892"]'
WHERE slug = 'veloce-luxury-car-rental-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'VetPoint Clinic is a full-service small animal veterinary clinic in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://savet.co.za/vet/vetpoint-clinic", "https://veterinary.co.za/find-a-vet/vetpoint/", "https://www.brabys.com/za/western-cape/cape-town/sea-point/veterinary-clinics/vet-point"]'
WHERE slug = 'vetpoint-clinic-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffe is a South African coffee chain, with a branch in Welgemoed Forum, Welgemoed.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-e-caffe-welgemoed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vida e Caffe is a South African coffee chain, with a branch in Cape Quarter, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'vida-e-caffe-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virgin Active Waterstone Village is a health club in Somerset West with a heated lap pool, sauna, steam room, group exercise classes and a supervised kids'' club.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:00-21:00, Fri 05:00-20:00, Sat-Sun 06:00-20:00'
WHERE slug = 'virgin-active-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Virtus Medical is a general practice at The Point in Sea Point, established in 2013, offering GP consultations alongside in-house dietician and counselling services.',
    description_enriched_at = datetime('now')
WHERE slug = 'virtus-medical-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vitacare Pharmacy is a pharmacy and skincare clinic in the Aslam Centre, Lansdowne.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://homeappliancerepairs.co.za/5855718136047698612/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=87772", "https://www.searchinafrica.com/business/3688909/south-africa/western-cape/cape-town/lansdowne/lansdowne-rd/pharmacies/vitacare-pharmacy", "https://www.yep.co.za/biz/store/vitacare-pharmacy-skincare-clinic/157214"]'
WHERE slug = 'vitacare-pharmacy-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Vodacom is a South African mobile network operator, with a store in Cape Quarter, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'vodacom-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Weavewell is an industrial webbing, tape and ribbon manufacturer and factory outlet in Elsies River, selling to wholesalers, retailers and the public.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:30, Fri 08:30-15:00, Sat Closed'
WHERE slug = 'weavewell-elsies-river' AND description_enriched_at IS NULL;
