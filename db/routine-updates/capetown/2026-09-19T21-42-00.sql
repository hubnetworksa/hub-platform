UPDATE businesses
SET description = 'SPARC (Sports Performance and Rehabilitation Centre) is a physiotherapy and sports rehabilitation practice in Cape Quarter, De Waterkant, offering rehabilitation treatment and small-group exercise classes.',
    description_enriched_at = datetime('now')
WHERE slug = 'sparc-rehabilitation-centre-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SWEAT1000 is a boutique group-fitness studio in The Point, Sea Point, offering high-intensity full-body workout classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 05:30-20:00, Thu 05:30-22:00, Fri 05:30-20:00, Sat 06:30-12:00, Sun 07:30-12:00',
    source_urls = '["https://sweat1000.com/?studios=sea-point", "http://www.findglocal.com/ZA/Sea-Point/108962222472145/SWEAT-1000", "https://sweat1000.com/studios/cape-town/"]'
WHERE slug = 'sweat1000-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Safety Protective Clothing (trading as Safepro) is a distributor of personal protective equipment and workwear in Epping Industria, supplying brands such as 3M, Honeywell and Dot Safety Footwear.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.hotfrog.co.za/company/1448401229697024/safety-protective-clothing-pty-ltd/cape-town/security-safety-products", "https://za.africabz.com/western-cape/safepro-safety-protective-clothing-295222", "https://safepro.co.za/"]'
WHERE slug = 'safety-protective-clothing-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Santa Ana Spur is a Spur Steak Ranches family restaurant and grill in Victoria Wharf Shopping Centre, V&A Waterfront, serving the chain''s steaks, burgers and kids'' menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-21:00, Fri-Sat 09:00-22:00, Sun 09:00-21:00'
WHERE slug = 'santa-ana-spur-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'School and Leisure is a school uniform and leisure-wear retailer in Rondebosch Main Centre, Rondebosch.',
    description_enriched_at = datetime('now')
WHERE slug = 'school-and-leisure-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Schoon is a bakery and cafe at The Point in Sea Point, known for breads and pastries made with local wheat and real butter, alongside a seasonal breakfast and lunch menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'schoon-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shade & Co is a general retail store in Cape Quarter Lifestyle Village, De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'shade-and-co-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shaheem''s Barber is a barbershop in Southfield offering haircuts, beard trims and head shaves.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Wed 09:00-18:00, Thu 09:00-19:30, Fri 09:00-12:00 & 14:00-18:00, Sat 08:00-14:00, Sun Closed'
WHERE slug = 'shaheems-barber-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sheet Street Golden Acre is a home textiles and homeware store in Golden Acre Shopping Centre, part of the national Sheet Street chain, selling bedding, blankets and decor items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.sheetstreet.com/sheet-street-cpt-goldenacre-30578", "https://my-catalogue.co.za/stores/cape-town/sheet-street/golden-acre-cnr-strand-adderley-streets"]'
WHERE slug = 'sheet-street-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shift Espresso Bar is a coffee shop in the Glengariff Building, Three Anchor Bay, serving coffee and a breakfast and lunch menu, run by the founders who opened their original Green Point store in 2014.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://southafricafirm.com/western-cape/shift-espresso-bar-glengariff-57942", "https://www.eatout.co.za/venue/shift-espresso-bar/", "https://www.capetownmagazine.com/shift-espresso-bar"]'
WHERE slug = 'shift-espresso-bar-three-anchor-bay' AND description_enriched_at IS NULL;
