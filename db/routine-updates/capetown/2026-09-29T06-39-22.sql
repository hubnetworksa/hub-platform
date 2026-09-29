-- Job 4: description enrichment sweep (batch of 6, full backlog at time of run)
UPDATE businesses
SET description = 'About Cats & Dogs is a pet supply store inside Sun Valley Mall, Sunnydale.',
    description_enriched_at = datetime('now')
WHERE slug = 'about-cats-and-dogs-sun-valley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bierman Strauss Optometrists Sunvalley is an optometry practice inside Sun Valley Mall, Sunnydale, part of the Bierman Group network of optometrists.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30',
    source_urls = '["https://biermangroup.co.za/stores/bierman-strauss-optometrists-sunvalley/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=362530", "https://all-opening-hours.co.za/01476596/Bierman_Strauss_Sunvalley"]'
WHERE slug = 'bierman-strauss-optometrists-sunvalley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Checkers LiquorShop is a liquor store inside Sun Valley Mall, Sunnydale.',
    description_enriched_at = datetime('now')
WHERE slug = 'checkers-liquorshop-sun-valley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Sun Valley is a printing, courier and postal services outlet inside Sun Valley Mall, Sunnydale, part of the PostNet franchise network.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/postnet-186097", "https://homeappliancerepairs.co.za/3201361243762509150/", "https://www.postnet.co.za/stores/sunvalley"]'
WHERE slug = 'postnet-sun-valley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon Sun Valley is a beauty salon inside Sun Valley Mall, Sunnydale, part of the Sorbet Group, offering manicures, pedicures, massages, threading, tinting and waxing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["http://textmap.co.za/3/22308", "https://www.sayellow.com/view/south-africa/sorbet-sun-valley-noordhoek-in-cape-town", "https://stores.salonssorbet.co.za/western-cape/cape-town/sun-valley-shopping-centre"]'
WHERE slug = 'sorbet-salon-sun-valley-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sun Valley Primary School is a public primary school in Sun Valley, Cape Town, established in 1977, offering Grade R to Grade 7.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/sun-valley-primary-school-55434", "https://www.sunvalleyprimary.co.za", "https://www.e-t-e.org/schools/view/7"]'
WHERE slug = 'sun-valley-primary-school-sun-valley' AND description_enriched_at IS NULL;
