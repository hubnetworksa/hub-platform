-- Job 4: description enrichment sweep, checkpoint 1 (10 businesses)

UPDATE businesses
SET description = 'Absolute Pets Kenridge is a branch of the national pet supplies retail chain, stocking pet food, accessories and grooming products from Shop 8 in IPIC Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 08:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/absolute-pets-kenridge-190941", "https://2pos.co.za/2/11382", "https://rogz.com/store/absolute-pets-kenridge/"]'
WHERE slug = 'absolute-pets-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Maitland is a branch of the second-hand goods and pawnbroking retail chain, buying and selling used electronics, tools and other items from Shop 15 in Maitland Square.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-18:00, Thu 09:00-16:00, Fri 09:00-14:00, Sat-Sun 09:00-18:00',
    source_urls = '["https://za.africabz.com/western-cape/cash-crusaders-maitland-13476", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/maitland-square-278-voortrekker-road-maitland", "https://cashcrusaders.co.za/storedetails?location=Maitland"]'
WHERE slug = 'cash-crusaders-maitland-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr Tommie Truter Dentistry is a general dental practice at Kenridge Business Centre that has served the Durbanville area for more than two decades.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:30, Tue 08:00-17:30, Wed-Thu 09:00-17:00, Fri 09:00-17:30, Sat-Sun Closed',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=171402", "https://www.facebook.com/p/Dr-Tommie-Truter-Dentistry-100066506444766/", "https://kenridgedentist.co.za/about-us/"]'
WHERE slug = 'dr-tommie-truter-dentistry-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Food_concept Maitland is a takeaway restaurant on Voortrekker Road in Maitland.',
    description_enriched_at = datetime('now')
WHERE slug = 'food-concept-maitland-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ho Ho Takeaways is a Chinese takeaway inside IPIC Shopping Centre, Kenridge, open six days a week and closed on Mondays.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hohotakeaways.co.za/", "https://za.africabz.com/western-cape/ho-62609", "https://www.facebook.com/HoHotakeaway/"]'
WHERE slug = 'ho-ho-takeaways-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KWIKSPAR Stellenberg is a branch of the SPAR convenience supermarket chain, with an in-store bakery and butchery, trading from Stellenberg Spar Centre on Haarlem Street.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-20:30',
    source_urls = '["https://www.spar.co.za/Home/Store-View/KWIKSPAR-Stellenberg-Western-Cape/", "https://za.africabz.com/western-cape/stellenberg-spar-centre-46239", "https://my-catalogue.co.za/stores/stellenberg/spar/40-haarlem-street"]'
WHERE slug = 'kwikspar-stellenberg-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kenridge Pharmacy is a retail pharmacy trading from Shop 13 in IPIC Shopping Centre, Kenridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'kenridge-pharmacy-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kenridge Pre-Primary School is an independent, dual-medium pre-school registered with the Western Cape Education Department, offering Pre-Grade R and Grade R classes on Van Riebeeck Avenue in Kenridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'kenridge-pre-primary-school-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kleuterbos Speelskool is a small play-based pre-school in Kenridge offering a daily programme capped at 12 children, with a qualified teacher and an assistant.',
    description_enriched_at = datetime('now')
WHERE slug = 'kleuterbos-speelskool-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morning Star Foods is a factory shop in Maitland Park selling healthy snacks and ingredients at discounted prices, with online orders also available through its Nutrimart platform.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00'
WHERE slug = 'morning-star-foods-maitland' AND description_enriched_at IS NULL;
