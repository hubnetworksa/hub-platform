UPDATE businesses
SET description = 'Fair Cape Factory Shop is the factory outlet of Fair Cape Dairies, selling fresh milk, cheese, yoghurt and other dairy products, along with jams and confectionery, directly to the public at reduced prices, in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-13:00',
    source_urls = '["https://www.facebook.com/faircape/photos/a.156631697721913/1005977366120671/?type=3", "https://za.africabz.com/western-cape/fair-cape-factory-shop-215584", "https://www.factoryshophub.co.za/fair-cape-factory-shops/"]'
WHERE slug = 'fair-cape-factory-shop-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Millennium Foods is a convenience-food manufacturer, founded in 1997 and now part of the Libstar group, producing ready-to-eat and ready-to-heat meals, snacks, desserts and side dishes, in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://inkillarneygardens.co.za/listing/millennium-foods/", "https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/food-manufacturers-distributors/millennium-foods-pty-ltd", "https://nearfinderza.com/business/western-cape/cape-town/millennium-foods-pty-ltd_591561+2.html", "https://www.just-food.com/news/libstar-adds-frozen-meals-capability-to-millennium-foods/"]'
WHERE slug = 'millennium-foods-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Printech Engineering, founded in 1981, supplies Heidelberg offset printing presses and bindery, cutting and finishing equipment to the printing industry, along with after-sales service, maintenance and spare parts, in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://www.printech.co.za/home/", "http://inkillarneygardens.co.za/listing/printech-engineering/", "https://www.brabys.com/za/western-cape/cape-town/killarney-gardens/printers-engineers/printech-engineering", "https://za.linkedin.com/company/printech-engineering"]'
WHERE slug = 'printech-engineering-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sinenjongo High School is a public, no-fee high school in Joe Slovo Park, Milnerton, serving grades 8 to 12.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://schoolsdigest.co.za/listings/sinenjongo-high-school/", "https://www.school-register.co.za/school/sinenjongo-high-school/", "https://skools.co.za/listings/sinenjongo-high-school/", "https://en.wikipedia.org/wiki/Sinenjongo_High_School"]'
WHERE slug = 'sinenjongo-high-school-joe-slovo-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tableview Coachworks is a family-run automotive body repair business, established in 2003, offering panel beating and paintwork services in Killarney Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/panelling/tableview-coachworks", "https://panelbeatersdirectory.co.za/listing-contact.php?listings_id=1332", "https://za.africabz.com/western-cape/tableview-coachworks-82666", "https://www.facebook.com/tvcoachworks"]'
WHERE slug = 'tableview-coachworks-killarney-gardens' AND description_enriched_at IS NULL;
