-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)

UPDATE businesses
SET description = '8.hair is a hair salon in Mouille Point offering cuts, colour, and styling services in an upmarket, design-led space.',
    description_enriched_at = datetime('now')
WHERE slug = '8-hair-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Anytime Fitness Sea Point is a 24-hour gym on Main Road giving members round-the-clock access to cardio and strength training equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.anytimefitness.co.za/gyms/za-0004/cape-town-western-cape-8005/", "https://www.facebook.com/people/Anytime-Fitness-Sea-Point/61579046177815/", "https://www.facebook.com/AnytimeFitnessSouthAfrica/posts/open-24-hours-in-the-heart-of-sea-point-only-the-best-life-fitness-and-hammer-st/903102522233192/"]'
WHERE slug = 'anytime-fitness-sea-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BODYTEC Sea Point is an EMS (electrical muscle stimulation) personal training studio at Piazza Da Luz on Regent Road, offering 20-minute full-body sessions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-19:00, Sat 07:00-14:00, Sun & Public Holidays Closed',
    source_urls = '["https://bodytec.co.za/studio/bodytec-seapoint/", "https://www.symbiont360.co.za/en/ems-studios/bodytec-sea-point", "https://bodytec.co.za/studios/western-cape/bodytec-seapoint/"]'
WHERE slug = 'bodytec-sea-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Body+Mind Wellness Spa is a day spa on the second floor of the Sea Point Medical Centre on Kloof Road, offering massage therapy, facials, waxing, and manicure/pedicure treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-19:00',
    source_urls = '["https://bodyplusmindwellness.co.za/", "https://www.retreatatlassouthafrica.com/listing/body-mind-wellness-spa-d86803/", "https://www.thespaguide.co.za/listing/cape-town/spa/bodymind-wellness-spa/"]'
WHERE slug = 'body-mind-wellness-spa-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Callo Hair Designs is a unisex hairdressing salon on Bay Road in Mouille Point offering cuts, colouring, and styling for men and women.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/2661003_2", "https://www.brabys.com/za/western-cape/cape-town/mouille-point/unisex-hairdressers/callo-hair-designs", "https://www.callupcontact.com/b/Hairdressers/CALLO_HAIR_DESIGNS/44732"]'
WHERE slug = 'callo-hair-designs-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Royale Hotel is a 5-star all-suite luxury hotel in Green Point offering one- to three-bedroom suites and penthouses with full kitchens, plus on-site dining venues and a rooftop pool deck.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.caperoyale.co.za/", "https://www.travelweekly.com/Hotels/Green-Point-South-Africa/Cape-Royale-Luxury-Hotel-p9224806", "https://www.expedia.com/Cape-Town-Hotels-Cape-Royale-Luxury-Suites.h1981542.Hotel-Information"]'
WHERE slug = 'cape-royale-hotel-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hudsons - The Burger Joint is a gourmet burger restaurant in Green Point also serving wood-fired pizzas, loaded starters, and craft shakes and cocktails.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 12:00-23:00',
    source_urls = '["https://www.theburgerjoint.co.za/our-stores", "https://www.dining-out.co.za/md/Hudsons-The-Burger-Joint-Green-Point/3357", "https://www.eatout.co.za/venue/hudsons-the-burger-joint-green-point/"]'
WHERE slug = 'hudsons-the-burger-joint-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Just Skin Aesthetic Clinic is an aesthetic skincare clinic in Green Point offering facials, chemical peels, microdermabrasion, laser hair removal, and other results-driven skin treatments.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://justskin.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=264652", "https://www.spaguide.co.za/spa-directory-health-spas/just-skin-aesthetic-clinic-medical-spa-in-green-point-cape-town-western-cape-3566.html"]'
WHERE slug = 'just-skin-aesthetic-clinic-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kleinsky''s Delicatessen is a Jewish-style deli and bagel bakery in Sea Point known for hand-rolled, slow-fermented bagels, hot pastrami on rye, and matzo ball soup.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:30-16:30',
    source_urls = '["https://www.kleinskys.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g15134971-d7691259-Reviews-Kleinsky_s_Delicatessen-Sea_Point_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/kleinskys-deli/"]'
WHERE slug = 'kleinskys-delicatessen-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maggie''s Cafe is a dog-friendly cafe and bar in Green Point serving all-day cafe-style food with a cheffy twist, including breakfast poke bowls and egg-and-kimchi tacos.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 07:00-22:00, Sun 08:00-14:00, Mon Closed'
WHERE slug = 'maggies-cafe-green-point' AND description_enriched_at IS NULL;
