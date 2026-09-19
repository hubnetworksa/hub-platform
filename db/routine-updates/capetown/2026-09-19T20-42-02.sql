UPDATE businesses
SET description = 'SPARC Rehabilitation Centre is a physiotherapy and sports rehabilitation practice in Cape Quarter, De Waterkant, also working alongside podiatry and chiropractic services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'sparc-rehabilitation-centre-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SWEAT1000 is a boutique group fitness studio in The Point, Sea Point, offering treadmill-based interval and functional training classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 05:30-20:00, Thu 05:30-22:00, Fri 05:30-20:00, Sat 06:30-12:00, Sun 07:30-12:00'
WHERE slug = 'sweat1000-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safety Protective Clothing manufactures and distributes personal protective equipment and workwear meeting SABS and CE standards, based in Epping Industria.',
    description_enriched_at = datetime('now')
WHERE slug = 'safety-protective-clothing-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Santa Ana Spur is a Spur Steak Ranches family restaurant in Victoria Wharf Shopping Centre, V&A Waterfront, serving steaks, burgers, ribs and grills with harbour views.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri-Sat 09:00-22:00, Sun 09:00-21:00',
    source_urls = '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/victoria-&-alfred-waterfront/santa-ana-spur", "https://www.eatout.co.za/venue/spur-va-waterfront/", "https://www.waterfront.co.za/eat-and-drink/santa-ana-spur"]'
WHERE slug = 'santa-ana-spur-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'School and Leisure is a schoolwear and sportswear retailer in Rondebosch Main Centre, stocking badged uniforms for a wide range of schools.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:00, Sun Closed'
WHERE slug = 'school-and-leisure-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schoon is a bakery and cafe in The Point, Sea Point, serving freshly baked bread, pastries and a seasonal breakfast and lunch menu made with local ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun 08:00-16:00'
WHERE slug = 'schoon-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shade & Co is a retail store in Cape Quarter Lifestyle Village, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'shade-and-co-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shaheem''s Barber is a barbershop on Victoria Road in Southfield, offering haircuts and grooming services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-18:00, Thu 09:00-19:30, Fri 09:00-12:00 & 14:00-18:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'shaheems-barber-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Golden Acre is a clothing and homeware retail store in Golden Acre Shopping Centre, Cape Town CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.sheetstreet.com/sheet-street-cpt-goldenacre-30578", "https://my-catalogue.co.za/stores/cape-town/sheet-street/golden-acre-cnr-strand-adderley-streets"]'
WHERE slug = 'sheet-street-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shift Espresso Bar is a coffee shop in the Glengariff building in Three Anchor Bay, serving locally roasted, fair trade coffee.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/western-cape/shift-espresso-bar-glengariff-57942", "https://www.eatout.co.za/venue/shift-espresso-bar/", "https://www.shiftespresso.com/"]'
WHERE slug = 'shift-espresso-bar-three-anchor-bay' AND description_enriched_at IS NULL;
