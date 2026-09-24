-- Job 4: description enrichment sweep (10 businesses)

UPDATE businesses
SET description = 'Clicks Plumstead is a pharmacy and health, beauty and homeware retailer on Main Road in Plumstead, part of the national Clicks chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-18:30, Wed 09:00-18:30, Thu-Fri 08:30-18:30, Sat 08:30-15:00, Sun 09:00-14:00'
WHERE slug = 'clicks-plumstead-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ou Kaapse Vet is a companion animal hospital in Tokai offering consultations, vaccinations, dental care, surgery and diagnostic imaging for cats and dogs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://oukaapsevet.co.za/contact-us/", "https://za.africabz.com/western-cape/ou-kaapse-vet-178678", "https://www.facebook.com/oukaapsevettokai/"]'
WHERE slug = 'ou-kaapse-vet-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Family Store is a supermarket inside Steenberg Village shopping centre in Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat 08:00-18:00, Sun 09:00-18:00'
WHERE slug = 'pick-n-pay-steenberg-village-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rock Thai Sushi Steenberg serves Thai, seafood, sushi and vegetarian dishes from a shopfront in Steenberg Village, Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-21:00'
WHERE slug = 'rock-thai-sushi-steenberg-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Steenberg Village is a beauty salon offering manicures, pedicures, massages, threading, tinting and waxing in Steenberg Village, Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-16:00'
WHERE slug = 'sorbet-steenberg-village-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Hussar Grill Steenberg is a steakhouse in Steenberg Village, Tokai, styled after an English gentleman''s club with mahogany panelling and a leather-upholstered library corner, known for its steaks and wine list.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-23:00, Sun 12:00-22:00',
    source_urls = '["https://www.dining-out.co.za/md/The-Hussar-Grill-Steenberg/5377", "https://www.mrdfood.com/food-delivery/restaurant/the-hussar-grill-steenberg_tokai/12538", "https://www.restaurants.co.za/hussar-grill-steenberg"]'
WHERE slug = 'the-hussar-grill-steenberg-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wayne Hodgkinson Optometrists provides routine eye examinations for vision and eye health, with a special interest in behavioural optometry for children with reading and learning difficulties, from Steenberg Village, Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00',
    source_urls = '["https://www.cylex.net.za/company/wayne-hodgkinson-optometrists-23817953.html", "https://za.africabz.com/western-cape/wayne-hodgkinson-optometrist-186447", "https://frontiercovision.co.za/directory/wayne-hodgkinson-optometrist/"]'
WHERE slug = 'wayne-hodgkinson-optometrists-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse Steenberg Village is a health and wellness retailer in Steenberg Village, Tokai, stocking health foods, beauty and eco home products alongside a natural medicine dispensary and in-store wellness assessments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:30-17:00, Sun 09:00-14:00',
    source_urls = '["https://www.fresha.com/lvp/wellness-warehouse-steenberg-village-reddam-avenue-cape-town-wr9BeA", "https://my-catalogue.co.za/stores/cape-town/wellness-warehouse/steenberg-village-centre-shop-g2-reddam-avenue-tokai", "https://constantiavalley.com/wellness-warehouse/"]'
WHERE slug = 'wellness-warehouse-steenberg-village-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food is a supermarket branch inside Steenberg Village shopping centre in Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat-Sun 08:00-18:00'
WHERE slug = 'woolworths-food-steenberg-village-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN Steenberg Village is a mobile phone and network services store inside Steenberg Village shopping centre in Tokai.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00'
WHERE slug = 'mtn-steenberg-village-tokai' AND description_enriched_at IS NULL;
