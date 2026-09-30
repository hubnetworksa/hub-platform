UPDATE businesses
SET description = 'Afya Pharmacy is a retail pharmacy inside Tygerberg Centre on Voortrekker Road in Bellville.',
    description_enriched_at = datetime('now')
WHERE slug = 'afya-pharmacy-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Anysberg Biltong & Deli is a butchery and delicatessen inside De Ville Shopping Centre in Durbanville, specialising in beef, game, ostrich and chicken biltong and droewors alongside other deli products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.jamii.co.za/6325-cape-town-biltong-retailer-anysberg-biltong-deli", "https://www.snupit.co.za/durbanville/morningstar/anysberg-biltong-_and_-deli/220321", "https://anysbergbiltong.com/about-us/"]'
WHERE slug = 'anysberg-biltong-and-deli-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BOA Beauty Bar is a nail and beauty salon inside De Ville Centre in Durbanville, offering treatments including gel manicures and pedicures alongside a dedicated men''s pamper package.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:45-18:30, Sat 09:15-18:00, Sun 09:15-17:00'
WHERE slug = 'boa-beauty-bar-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Body 20 Studio is an EMS (electro-muscular stimulation) training studio inside De Ville Shopping Centre in Durbanville, offering coach-guided 20-minute workout sessions with weekly InBody body composition tracking.',
    description_enriched_at = datetime('now')
WHERE slug = 'body-20-studio-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company is a coffee shop and cafe inside The Village Square in Durbanville, part of the South African Bootlegger Coffee Company chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-17:00, Sat-Sun 07:30-15:00'
WHERE slug = 'bootlegger-coffee-company-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fourie Basson & Veldtman is a firm of attorneys operating from Toplinhuis on Voortrekker Road in Parow.',
    description_enriched_at = datetime('now')
WHERE slug = 'fourie-basson-and-veldtman-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harlequin Restaurant is a long-standing Italian restaurant on Voortrekker Road in Parow that has been trading since 1965, known for pastas, seafood and grills alongside dishes such as spinach and ricotta cannelloni and tiramisu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 12:00-16:00, Tue-Fri 12:00-21:30, Sat 18:00-21:30, Sun Closed',
    source_urls = '["https://www.eatout.co.za/venue/harlequin/", "https://www.capetownetc.com/cape-town/harlequin-restaurant-on-voortrekker-road-remains-open-for-business/", "https://vrcid.co.za/2019/08/29/to-harlequin-restaurant-54-years-and-counting/", "https://www.dining-out.co.za/md/Harlequin-Restaurant/821"]'
WHERE slug = 'harlequin-restaurant-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Reno Spur is a branch of the Spur Steak Ranches family restaurant chain inside Bellville Mall, serving steaks, ribs, burgers and wings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-21:00, Fri-Sat 08:00-22:00, Sun 08:00-21:00'
WHERE slug = 'reno-spur-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Hollow Tree on Oxford operates from one of Durbanville''s oldest surviving buildings, dating to the early 1800s and declared a national monument in 1989, serving a menu of South African dishes such as slow-roasted lamb shanks, line fish with Cape Malay spices and bobotie spring rolls.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-hollow-tree-on-oxford-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Van Schaik Bookstore is a branch of the South African academic and general bookshop chain inside Parow Centre on Voortrekker Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:30-16:00, Sun 09:00-13:00'
WHERE slug = 'van-schaik-bookstore-parow' AND description_enriched_at IS NULL;
