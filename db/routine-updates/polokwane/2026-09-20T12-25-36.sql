UPDATE businesses
SET description = 'Alpha Nursery is a plant nursery and landscaping business in Bendor offering irrigation installation (manual and computerized), paving, instant lawn, water features and general garden services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/limpopo/polokwane/bendor/nursery/alpha-nursery", "https://www.yep.co.za/biz/store/iyp/5035034_2", "https://www.sayellow.com/view/south-africa/alpha-nursery-in-polokwane", "https://www.procompare.co.za/providers/alpha-nursery"]'
WHERE slug = 'alpha-nursery-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Concor Technicrete Polokwane is a concrete block and building-products plant in Futura, part of the national Technicrete/Concor group supplying roof tiles and precast concrete products to the building trade.',
    description_enriched_at = datetime('now')
WHERE slug = 'concor-technicrete-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr MM Pula Inc is a dental practice in Bendor offering general dentistry including teeth bleaching, cosmetic crowns and crown-and-bridge work, and preventive scaling, polishing and cleaning.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-mm-pula-inc-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Limparts Limpopo supplies mechanical and body spare parts for Scania, Volvo, MAN and Shacman trucks and buses from its Futura branch, part of a group founded in 2017 with branches across Gauteng, Mpumalanga and Limpopo.',
    description_enriched_at = datetime('now')
WHERE slug = 'limparts-limpopo-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masana Cafe is an award-winning restaurant at Masana Hotel in Moregloed, serving traditional Limpopo cuisine through an a la carte menu and buffet, with breakfast and dinner service, weekly braai specials, and catering for groups and events.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 10:00-22:00',
    source_urls = '["https://www.facebook.com/masanacafe99/", "http://www.findglocal.com/ZA/Polokwane/710158632346247/Masana-Lodge", "https://masanahotels.co.za/our-cafe.html"]'
WHERE slug = 'masana-cafe-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Northern Forklifts (Pty) Ltd is a forklift sales, service and repair business in Futura, also offering seasonal forklift rental and hire.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/439984/northern-forklifts-pty-ltd", "https://polokwane.infoisinfo.co.za/card/northern-forklifts/563334", "https://www.yep.co.za/biz/store/iyp/5075872_3"]'
WHERE slug = 'northern-forklifts-futura' AND description_enriched_at IS NULL;
