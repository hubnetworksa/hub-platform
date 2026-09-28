UPDATE businesses
SET description = 'PEP is a branch of South Africa''s PEP retail chain in the Shoprite Centre, Kuils River, offering affordable clothing, footwear, homeware and mobile and financial services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 08:30-15:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--shoprite-centre-cnr-nooiensfontein-van-riebeeck-road-kuils-river-cape-town-western-cape/12273", "https://www.cybo.com/ZA-biz/pep-kuils-river-shoprite-centre", "https://my-catalogue.co.za/stores/kuils-river/pep-stores/cnr-nooiensfontein-van-riebeeck-road"]'
WHERE slug = 'pep-kuils-river-2' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Paint Chemistry is an industrial and automotive coatings supplier on Voortrekker Road, Maitland, specialising in automotive, wood and industrial refinish paints, plus sandpaper and PPE equipment.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.thinklocal.co.za/biz/paint-chemistry-maitland", "https://www.findglocal.com/ZA/Cape-Town/697450123696124/Paint-chemistry", "https://ss-eng.co.za/business-directory/paint-chemistry/"]'
WHERE slug = 'paint-chemistry-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palm Tyre Service is a family-owned tyre and wheel specialist on Cannon Street, Maitland, operating since 1946, offering tyre fitment, balancing, wheel alignment and puncture repair, including specialist fitment for all-terrain and cross-ply tyres.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/maitland/za0002400268", "https://www.brabys.com/business/5285097/south-africa/western-cape/cape-town/maitland/cannon-st/tyre-dealers/palm-tyre-service-cc", "http://www.palmtyreservice.co.za/index.php/aboutus"]'
WHERE slug = 'palm-tyre-service-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Peacock Tea and Coffee is a specialist tea and coffee retailer in Howard Centre, Pinelands, sourcing fine teas and gourmet coffee beans from around the world alongside brewing equipment, accessories and crockery, and grinding beans to order.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 09:00-15:00',
    source_urls = '["https://za.africabz.com/western-cape/peacock-tea-and-coffee-25979", "https://www.peacockteaandcoffee.co.za/stores/", "https://www.pinelandsdirectory.co.za/howardcentre/dir/peacock.php"]'
WHERE slug = 'peacock-tea-and-coffee-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Peninsula Power Products is a marine and industrial engine specialist in Paarden Eiland, supplying and maintaining marine diesel engines and generators since 1965, and serving as a South African marine distributor for FPT/Iveco engines and Twin Disc gearboxes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/PeninsulaPowerProducts/", "https://www.cylex.net.za/company/peninsula-power-products-15497447.html", "https://twindisc.com/distributors/peninsula-power-product/"]'
WHERE slug = 'peninsula-power-products-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Clothing is a branch of the clothing retail chain in Cobble Walk Shopping Centre, Durbanville, selling clothing, footwear and accessories for the whole family.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-17:30, Sun 09:00-14:00',
    source_urls = '["https://2pos.co.za/2/13348", "https://za.africabz.com/western-cape/pick-n-pay-clothing-127888", "https://www.picknpayclothing.co.za/stores"]'
WHERE slug = 'pick-n-pay-clothing-cobble-walk-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Local Boston is a neighbourhood branch of the Pick n Pay grocery chain on Twelfth Avenue in Boston, Bellville, stocking a wide range of everyday groceries and offering freshly prepared pancakes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 08:00-17:00',
    source_urls = '["https://my-catalogue.co.za/stores/bellville/pick-n-pay-local/45-12th-avenue-boston", "https://www.yellosa.co.za/company/484076/pick-n-pay-family-store-boston", "https://www.tiendeo.co.za/stores/bellville/pick-n-pay---th-avenue-boston/27545"]'
WHERE slug = 'pick-n-pay-local-boston-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Perfect is a pizza restaurant at Richmond Corner in Richwood, part of a Cape Town-based pizza chain, serving pizza for eat-in and takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-20:30, Fri-Sat 10:30-21:30, Sun 11:30-20:30',
    source_urls = '["https://www.facebook.com/PizzaPerfectRichmondCorner/", "https://www.tripadvisor.co.za/Restaurant_Review-g312665-d26732350-Reviews-Pizza_Perfect_Richmond-Milnerton_Western_Cape.html", "https://www.mrdfood.com/food-delivery/restaurant/pizza-perfect-richmond-richmond/17357"]'
WHERE slug = 'pizza-perfect-richwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizzeria Villaggio is an Italian restaurant in Howard Centre, Pinelands, serving wood-fired pizza and Mediterranean-style dishes including breakfast and housemade cakes, with vegetarian options and a full liquor licence.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:30-22:00',
    source_urls = '["https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/pizzeria-villaggio-e985fe", "https://www.sluurpy.co.za/pinelands/restaurant/5030747/pizzeria-villaggio", "https://www.pinelandsdirectory.co.za/howardcentre/dir/villaggio.php"]'
WHERE slug = 'pizzeria-villaggio-pinelands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pure Skin & Body is an established beauty salon in Kenridge Centre, Durbanville, operating since 1995 and offering massages, waxing, manicures, pedicures, gel nails, facials, microneedling and male grooming.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Fri 09:00-17:00, Sat 08:00-13:00',
    source_urls = '["https://www.fresha.com/lvp/pure-skin-body-kenridge-mildred-street-cape-town-vv2NWo", "https://pureskinandbody.co.za/contact.php", "https://www.facebook.com/PureKenridge/"]'
WHERE slug = 'pure-skin-and-body-kenridge' AND description_enriched_at IS NULL;
