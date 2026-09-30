UPDATE businesses
SET description = 'Bidvest Waltons Brackenfell Corner is a stationery and office-supplies store stocking a wide range of office furniture, stationery and tech accessories, in Brackenfell Corner shopping centre, Brackenfell.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-17:00',
    source_urls = '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.waltons.co.za/store-locator", "https://www.waltons.co.za/about"]'
WHERE slug = 'bidvest-waltons-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bok Lounge & Grill is a casual restaurant and grill in Brackenfell Corner, Brackenfell, serving burgers, ribs, pizza and other pub-style fare for dine-in and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Mon 11:00-01:00, Tue-Sat 11:00-02:00'
WHERE slug = 'bok-lounge-and-grill-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company is a specialty coffee shop in Brackenfell Corner, Brackenfell, offering all-day breakfast, brunch and lunch alongside coffee, toasties and pastries for dine-in or takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-18:00, Sat 07:30-17:00, Sun 07:30-15:00'
WHERE slug = 'bootlegger-coffee-company-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Crazy Pets Brackenfell Corner is a pet-supply store stocking pet food, toys and accessories, part of a pet-shop chain with more than 36 branches nationwide, in Brackenfell Corner, Brackenfell.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-14:00'
WHERE slug = 'crazy-pets-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Crown National Factory Mart is a factory shop in Brackenfell Corner, Brackenfell, selling spices, herbs, seasonings, sauces and meat-processing supplies including packaging and casings for the food industry.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun 09:00-13:00'
WHERE slug = 'crown-national-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Die Weiveld Slaghuis is a butchery in Ipic Shopping Centre, Kenridge, offering a wide range of beef, pork, lamb and chicken alongside specialty meat products.',
    description_enriched_at = datetime('now')
WHERE slug = 'die-weiveld-slaghuis-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dr M.B. Groenewald is an orthodontic practice in Ipic Shopping Centre, Kenridge, specialising in teeth and jaw alignment treatment.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-mb-groenewald-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pizza Perfect Brackenfell Corner is a pizzeria in Brackenfell Corner, Brackenfell, part of a franchise operating since 1989 with more than 100 stores nationwide, serving pizza, pasta, burgers and other fast food for dine-in and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 10:00-21:00, Fri-Sat 10:00-22:00',
    source_urls = '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://app.pizzaperfect.co.za/restaurant/8579/pizza-perfect-brackenfell-corner", "https://www.mrd.com/delivery/restaurant/pizza-perfect-brackenfell-corner-brackenfell/27270"]'
WHERE slug = 'pizza-perfect-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rock Thai Sushi is a Thai and sushi restaurant in Kenridge Shopping Centre, Kenridge, serving a full Asian menu including vegetarian options, with dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 11:00-21:00'
WHERE slug = 'rock-thai-sushi-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Smart Laser Skin & Body Aesthetics is an aesthetic clinic in Brackenfell Corner, Brackenfell, one of several branches across Cape Town, offering laser hair removal, medical-grade skin peels, non-surgical fat-freezing and facial rejuvenation treatments.',
    description_enriched_at = datetime('now')
WHERE slug = 'smart-laser-skin-and-body-aesthetics-brackenfell' AND description_enriched_at IS NULL;
