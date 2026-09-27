UPDATE businesses
SET description = 'Barrister''s Grill is a steakhouse and pub-style restaurant in Cardiff Castle, Newlands, known for its prawns and Roquefort steak sauce, pub lunch specials, and live jazz on Sunday evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 11:00-21:00',
    source_urls = '["https://za.africabz.com/western-cape/barristers-grill-cafe-newlands-4086", "http://www.barristersgrill.co.za/about-us", "https://www.eatout.co.za/venue/barristers-grill-cafe/"]'
WHERE slug = 'barristers-grill-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Claremont Dental is a general and cosmetic dental practice in Protea Place, Claremont, offering teeth cleaning, fillings, extractions, teeth whitening and sedation dentistry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=person&personcode=1917841", "https://www.recomed.co.za/dentist/cape-town/shadley-bruintjies/27498/35309/", "https://capedentists.co.za/dentist-open-in-claremont/"]'
WHERE slug = 'claremont-dental-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gogo''s Deli is a free-range butchery and deli in Cardiff Castle, Newlands, stocking free-range meats, biltong, duck, quail, petit poussin and rabbit alongside fresh produce.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/gogos-115728", "http://www.findglocal.com/ZA/Cape-Town/295863350443905/Gogos-Deli", "https://cardiffcastle.co.za/portfolio_page/smash-pop-art-storm/"]'
WHERE slug = 'gogos-deli-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Italo''s is a family-owned Italian deli and bistro in Cardiff Castle, Newlands, open since January 2020, serving pastries, pasta and other Italian dishes alongside its own deli counter.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/italos-deli/", "https://thelittlepersiancafe.com.au/133678-italos-deli/", "https://cardiffcastle.co.za/portfolio_page/italos/"]'
WHERE slug = 'italos-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'John''s Touch Hair and Beauty Salon is a hairdressing and beauty salon in Mowbray offering hair styling and beauty treatments, open seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun 10:00-17:00'
WHERE slug = 'johns-touch-hair-and-beauty-salon-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kristen''s Kick-Ass Ice Cream is an artisanal ice cream parlour in Cardiff Castle, Newlands, churning small-batch seasonal flavours on site, including xylitol-sweetened and vegan options, with custom flavours available for events.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.kristenskickass.co.za/contact-us", "https://cardiffcastle.co.za/portfolio_page/art-design-blvd/", "https://www.capetownetc.com/cape-town/restaurants/have-you-heard-the-scoop-on-kirstens-kick-ass-ice-cream/"]'
WHERE slug = 'kristens-kick-ass-ice-cream-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noodle Box is an Asian noodle bar in Cardiff Castle, Newlands, serving fresh handmade noodles, bao buns and fried rice, with gluten-free, vegan and halaal-friendly options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:30-20:30',
    source_urls = '["https://www.abillion.com/reviews/6581655f276eadf4f05129f0", "https://cardiffcastle.co.za/portfolio_page/noodle-box/", "https://insideguide.co.za/cape-town/restaurants/noodle-box-newlands/"]'
WHERE slug = 'noodle-box-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roseberry is a Chinese and sushi restaurant in Mowbray offering Asian-inspired curries and stir-fries alongside an all-you-can-eat sushi buffet, for dine-in and takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:00'
WHERE slug = 'roseberry-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wine Concepts is a specialist wine, beer and spirits retailer with a branch in Cardiff Castle, Newlands, part of a wider chain of dedicated wine stores across South Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://wineconcepts.co.za/stores/newlands/", "https://www.thinklocal.co.za/biz/wine-concepts-newlands", "https://wineconcepts.co.za/"]'
WHERE slug = 'wine-concepts-newlands' AND description_enriched_at IS NULL;
