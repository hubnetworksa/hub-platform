-- Job 4: description enrichment sweep (5 businesses)

UPDATE businesses
SET description = 'Epping Property is an industrial property brokerage based in Thornton, specialising in the sale and rental of factory, warehouse and industrial premises across Cape Town''s Epping industrial node and surrounds.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eppingproperty.co.za/contact-us/", "https://www.findglocal.com/ZA/29-Thor-Circle%2C-Thornton/426191120743908/Epping-Property", "https://www.eppingproperty.co.za/listings/industrial-property-for-sale/"]'
WHERE slug = 'epping-property-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Thornton is a fast-food restaurant serving the chain''s fried chicken menu, on the corner of Thornton Way and Odin Drive in Thornton.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-thornton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mpact Plastics'' Epping site is the admin and central office of the plastics packaging division of Mpact Group, one of southern Africa''s largest packaging and recycling businesses, serving the food, beverage, personal care, home care, pharmaceutical, agricultural and retail markets.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.webpackaging.com/en/portals/mpactplastics/assets/13082249/epping-admincentral-office/", "https://za.kompass.com/c/mpact-corrugated-epping/zan563149/", "https://mpactplastics.co.za/contact-us/"]'
WHERE slug = 'mpact-plastics-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steel & Pipes for Africa''s Epping branch is a steel, fencing and hardware supplier offering structural tubing, steel bars, channel and flat bar, cold-rolled tube, palisade and steelguard fencing, roofing sections and security hardware, with cutting facilities on site.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-16:45, Fri 08:00-16:00, Sat 08:00-12:30, Sun Closed',
    source_urls = '["https://spfa.co.za/contact/", "https://www.hotfrog.co.za/company/1198140704030720", "https://spfa.co.za/about-us/"]'
WHERE slug = 'steel-pipes-for-africa-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Transcape Steels is a family-owned steel supplier and service centre with nearly 60 years'' experience, operating a 2.5-hectare service centre and head office in Epping that supplies steel sections, plates, tubing and sheeting to the engineering, construction, mining, agriculture, manufacturing and shipping sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://transcapesteels.co.za/contact-us-2/", "https://www.sayellow.com/view/south-africa/transcape-steels-cape-town-hq-in-cape-town", "https://transcapesteels.co.za/about-us/"]'
WHERE slug = 'transcape-steels-epping' AND description_enriched_at IS NULL;
