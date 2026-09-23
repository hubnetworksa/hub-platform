UPDATE businesses
SET description = '306 Restaurant and Lounge is a Nigerian restaurant in Eclipse Park, Parklands, serving traditional dishes such as jollof rice, pepper soup and grilled plantain, with dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 09:00-21:00, Wed-Sat 09:30-21:00, Sun 09:00-18:00',
    source_urls = '["https://www.306restaurant.com/contact", "https://www.ubereats.com/za/store/306-restaurant-and-lounge/yQfoFaApRXWLz47li1c6iw", "https://restaurants-southafrica.nears.me/restaurants/south-africa/cape-town/306-restaurant-and-lounge-in-cape-town-complete-african-restaurant-guide/"]'
WHERE slug = '306-restaurant-and-lounge-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Du Noon Community Health Centre is a public health facility on Potsdam Road offering chronic disease treatment and care, child health services, infectious disease care, and obstetrics and gynaecology, alongside a 24-hour emergency service for the greater Du Noon area.',
    description_enriched_at = datetime('now'),
    hours = 'Day services 07:30-16:00, 24-hour emergency service available',
    source_urls = '["https://www.westerncape.gov.za/health-wellness/facility/du-noon-chc", "https://www.xpose.co.za/listings/dunoon-community-health-centre/", "https://d7.westerncape.gov.za/news/emergency-healthcare-service-24-hours-offered-du-noon-chc"]'
WHERE slug = 'du-noon-community-health-centre-dunoon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Stables Shopping Centre is a clothing, footwear and homeware retailer operating within The Stables Shopping Centre in Dunoon.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-stables-shopping-centre-dunoon' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Piazza Centre is a variety and general merchandise retailer in the Piazza Centre, Parklands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'the-crazy-store-piazza-centre-parklands' AND description_enriched_at IS NULL;
