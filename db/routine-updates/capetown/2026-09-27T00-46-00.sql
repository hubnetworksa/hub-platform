UPDATE businesses
SET description = 'Club Kloof is an Italian-inspired restaurant and bar on Kloof Street, Tamboerskloof, set in a restored heritage building with a retro 1970s-style interior, serving dishes such as sourdough pizzettes, salads, grilled prawns and beef fillet, with a dog-friendly patio and upstairs balcony.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 12:00-18:00, Mon Closed, Tue-Wed 18:00-23:30, Thu-Sat 12:00-23:30'
WHERE slug = 'club-kloof-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Culture Wine Bar is a wine bar on Bree Street in the Cape Town CBD, offering more than 50 wines by the glass from local and international producers, a small food menu of charcuterie and cheese, and weekly live music.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-late, Sun Closed'
WHERE slug = 'culture-wine-bar-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dis-Chem is a pharmacy and health, beauty and baby-care retailer with a store in Sun Valley Mall, Sunnydale.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'dis-chem-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Excentric Hair Artists is a hair and beauty salon on Kloof Street, Gardens, known among Cape Town''s curly-hair community for its treatments and styling services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00'
WHERE slug = 'excentric-hair-artists-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Firgrove Primary School is a public primary school in Firgrove, part of the Western Cape Education Department''s Metro East district, with around 950 learners.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/firgrove-primary-school/", "https://www.school-register.co.za/school/firgrove-primary-school/", "https://www.westerncape.gov.za/education/facility/firgrove-primary-school"]'
WHERE slug = 'firgrove-primary-school-firgrove' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harri''s Barber is a retro-styled barbershop on Harrington Street, Zonnebloem, offering classic cuts and beard shaping with more than 20 years of barbering experience.',
    description_enriched_at = datetime('now')
WHERE slug = 'harris-barber-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hawkes & Findlay is a long-standing hardware store in Observatory, trading since 1972, stocking paint, timber and roofing supplies, masonry materials, tools and general hardware with personalised advice from its staff.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:30, Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'hawkes-and-findlay-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Just Fencing is a fencing contractor based in Sunnydale, installing fencing for residential and commercial properties in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'just-fencing-sunnydale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kelfords Ford & Mazda is an independent Ford franchise dealership in Somerset West, selling new and used vehicles and running a Ford-accredited service centre and parts department.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-17:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'kelfords-ford-and-mazda-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kiosk is a café, deli and convenience store on Kloof Nek Road, Gardens, serving coffee, artisanal baked goods, wood-fired pizzas and pantry staples alongside craft beers.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-23:00'
WHERE slug = 'kiosk-gardens' AND description_enriched_at IS NULL;
