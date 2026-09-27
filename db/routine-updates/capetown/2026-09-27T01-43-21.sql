-- Job 4: description enrichment sweep, batch 2 of 2 (10 businesses)

UPDATE businesses
SET description = 'Pick n Pay is a supermarket with a branch in Strand Square, Strand, stocking groceries, fresh produce and household goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:00, Sat 08:00-16:00, Sun & PH 08:00-16:00'
WHERE slug = 'pick-n-pay-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizzayiro is a restaurant in Sitari Village Centre serving a fusion of Italian and Greek street food, known for its wood-fired pizzas and yiros.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/pizzayiro-267935", "https://www.sluurpy.co.za/somerset-west/restaurant/8449616/pizzayiro", "https://www.mrd.com/delivery/restaurant/pizzayiro-sitari-estate-somerset-west-croydon/21511"]'
WHERE slug = 'pizzayiro-sitari-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reverie Social Table is an intimate 18-seat chef''s table restaurant in Observatory where guests share a single communal table for a five-course, hyper-seasonal tasting menu with South African wine pairings; the menu changes daily based on what is delivered fresh that day.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Sat single seating 19:00 (arrival 18:30), booking required'
WHERE slug = 'reverie-social-table-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rheinmetall Denel Munition operates an explosives and munitions manufacturing facility in Firgrove, formed in 2008 from the former Denel Somchem division, with Rheinmetall holding a majority stake and Denel holding 49%.',
    description_enriched_at = datetime('now')
WHERE slug = 'rheinmetall-denel-munition-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Woodstock Quarter is a supermarket branch of the SPAR chain within the Woodstock Quarter retail development, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-20:00, Sat 08:00-18:00, Sun & PH 08:00-15:00',
    source_urls = '["https://www.hotfrog.co.za/company/5b2a03ef2d7933ba84f77c6c724b78f3/spar-woodstock-quarter/cape-town/markets-food-stores", "https://woodstockquarter.co.za/contact", "https://www.spar.co.za/Home/Store-View/SPAR-Woodstock-Quarter-Western-Cape"]'
WHERE slug = 'spar-woodstock-quarter-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Salon Suzette is a beauty and nail salon in Strand Pavilion offering manicures, pedicures, facials, laser hair removal and laser skin treatments across two treatment rooms.',
    description_enriched_at = datetime('now')
WHERE slug = 'salon-suzette-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sitari Health Shop is a health and supplements shop in Sitari Village Centre stocking brands such as Solgar, Metagenics and Urban Vega alongside other natural health products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-15:00',
    source_urls = '["https://www.willowwellness.co.za/store-locator/1012/sitari-health-shop", "https://waterstonehealthshop.co.za/contact-us/", "https://www.facebook.com/SitariHealthShopOnline/"]'
WHERE slug = 'sitari-health-shop-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sitari Medical Centre is a multidisciplinary practice in Sitari Village Centre offering general doctor and aesthetics consultations alongside physiotherapy and Pilates.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sitarimedicalcentre.co.za/contact", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=243016", "https://www.sitarimed.co.za/"]'
WHERE slug = 'sitari-medical-centre-croydon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Somerset West Private School opened in 1998 with 8 learners and has grown to around 200 learners from pre-school to matric, offering the IEB curriculum and reporting a 100% matric pass rate for 27 consecutive years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.westerncape.gov.za/education/facility/somerset-west-private-school", "https://southafricaprivateschool.co.za/contact-us/", "https://southafricaprivateschool.co.za/about-us/"]'
WHERE slug = 'somerset-west-private-school-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Specsavers is an optometrist and eyewear retailer with a branch in Gordon''s Bay Mall, offering eye tests and a range of glasses and contact lenses.',
    description_enriched_at = datetime('now')
WHERE slug = 'specsavers-gordons-bay' AND description_enriched_at IS NULL;
