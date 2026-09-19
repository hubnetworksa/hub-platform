UPDATE businesses
SET description = 'SPARC Rehabilitation Centre is a physiotherapy and sports rehabilitation practice inside Cape Quarter, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparc-rehabilitation-centre-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SWEAT1000 Sea Point is a fitness studio inside The Point offering high-intensity group training classes, with early-morning to evening sessions on weekdays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 05:30-20:00, Thu 05:30-22:00, Fri 05:30-20:00, Sat 06:30-12:00, Sun 07:30-12:00',
    source_urls = '["https://sweat1000.com/?studios=sea-point", "http://www.findglocal.com/ZA/Sea-Point/108962222472145/SWEAT-1000", "https://sweat1000.com/studios/cape-town/"]'
WHERE slug = 'sweat1000-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safety Protective Clothing is a supplier of workwear and personal protective equipment based in Epping Industria, serving industrial and commercial customers across Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'safety-protective-clothing-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Santa Ana Spur is a family restaurant and grill inside Victoria Wharf at the V&A Waterfront, part of the Spur Steak Ranches chain, serving steaks, burgers and family-friendly meals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri-Sat 09:00-22:00, Sun 09:00-21:00',
    source_urls = '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/victoria-&-alfred-waterfront/santa-ana-spur", "https://www.eatout.co.za/venue/spur-va-waterfront/", "https://www.waterfront.co.za/eat-and-drink/santa-ana-spur"]'
WHERE slug = 'santa-ana-spur-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'School and Leisure at Rondebosch Main Centre is a schoolwear retailer stocking badged uniforms and sportswear for well over 100 schools across the Cape Town area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/claremont/school-wear-retailers/school-and-leisure", "https://www.cylex.net.za/company/school-and-leisure-19632498.html", "https://www.sayellow.com/school-and-leisure-rondebosch"]'
WHERE slug = 'school-and-leisure-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schoon at The Point is a bakery and cafe serving freshly baked bread and pastries made with local wheat, real butter and pastured eggs, alongside a seasonal breakfast and lunch menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun 08:00-16:00',
    source_urls = '["http://schoon.co.za/", "https://thepointmall.co.za/merchant/schoon/", "https://www.mrdfood.com/food-delivery/restaurant/schoon-seapoint_sea-point/17444"]'
WHERE slug = 'schoon-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shade & Co is a general retail store inside Cape Quarter, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'shade-and-co-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shaheem''s Barber is a barbershop in Southfield offering haircuts and grooming services for men.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-18:00, Thu 09:00-19:30, Fri 09:00-12:00 & 14:00-18:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'shaheems-barber-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street at Golden Acre is a homeware and clothing retailer in the Golden Acre shopping centre in Cape Town CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.sheetstreet.com/sheet-street-cpt-goldenacre-30578", "https://my-catalogue.co.za/stores/cape-town/sheet-street/golden-acre-cnr-strand-adderley-streets"]'
WHERE slug = 'sheet-street-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shift Espresso Bar in Three Anchor Bay is a coffee shop in the Glengariff building serving locally roasted, fair-trade coffee alongside breakfast and lunch dishes, with free wifi and workspace seating for guests.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/western-cape/shift-espresso-bar-glengariff-57942", "https://www.eatout.co.za/venue/shift-espresso-bar/", "https://www.shiftespresso.com/"]'
WHERE slug = 'shift-espresso-bar-three-anchor-bay' AND description_enriched_at IS NULL;
