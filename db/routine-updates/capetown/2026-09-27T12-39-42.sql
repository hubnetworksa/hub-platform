UPDATE businesses
SET description = 'Diep River Roadworthy Centre CC is a vehicle roadworthy testing and certification centre in Diep River, inspecting cars to confirm they meet the legal safety standards required to stay licensed.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/diep-river-roadworthy-centre-cc/660807", "https://www.cylex.net.za/company/diep-river-roadworthy-centre-cc-23823854.html", "https://opening-hours.co.za/03934624/Diep_River_Roadworthy_Centre"]'
WHERE slug = 'diep-river-roadworthy-centre-cc-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kirstenhof Car Sales is a used-car dealership at the corner of Main and Aberfeldy Roads in Kirstenhof, trading since 2001 and known locally for its personalised customer service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun Closed',
    source_urls = '["https://za.onsono.com/kirstenhof-car-sales-cape-town/", "https://www.xpose.co.za/listings/kirstenhof-car-sales-kirstenhof/", "https://opening-hours.co.za/04225900/Kirstenhof_Car_Sales"]'
WHERE slug = 'kirstenhof-car-sales-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'ORKA Paddles is a specialist surfski and kayak paddling shop in Kirstenhof that manufactures its own paddles and also stocks Fenn kayaks and Carbonology surfskis, with an on-site Thule fitment centre for roof racks and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:00, Fri 08:30-16:30, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.orkapaddles.com/contact/", "https://readymap.co.za/4/53368", "https://opening-hours.co.za/0907194/Orka_Paddles"]'
WHERE slug = 'orka-paddles-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snow White Laundry Service is a drop-and-go laundromat in Diep River that also handles bulky items such as duvets and blankets, serving households as well as Airbnb hosts, schools and clinics in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed',
    source_urls = '["https://www.snowwhite.co.za/contact-us.html", "https://za.africabz.com/western-cape/snow-white-laundry-294666", "https://www.snowwhite.co.za/services.html"]'
WHERE slug = 'snow-white-laundry-service-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crafters Den is an arts and crafts store in Bergvliet stocking a wide range of yarns, wool and haberdashery, and running craft classes covering knitting, crochet, looming and tie-dye.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.thecraftersdencape.com/contact-us", "https://www.youtube.com/watch?v=N-lQvzfvVbY", "https://www.thecraftersdencape.com/about-us"]'
WHERE slug = 'the-crafters-den-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Men''s Room is a family-run, upscale barbershop on the corner of Alnwick and Main Road in Diep River, offering haircuts, straight-razor hot-towel shaves, hot-towel facials and scalp-massage shampoos in a relaxed, no-fuss setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-18:00, Sat-Sun 09:00-14:00',
    source_urls = '["https://www.hotfrog.co.za/company/1099855645999104", "http://www.mensroom.co.za/Contact/", "https://heyhairsalons.co.za/0406564/The_Mensroom"]'
WHERE slug = 'the-mens-room-diep-river' AND description_enriched_at IS NULL;
