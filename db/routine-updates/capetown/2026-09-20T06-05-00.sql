UPDATE businesses
SET description = 'Bird & Co Kromboom is a coffee shop and cafe inside the Kromboom Convenience Centre in Crawford, serving coffee, breakfasts and light meals.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 10:00-21:00, Fri-Sat 10:00-22:00'
WHERE slug = 'bird-and-co-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kromboom Medical Practice is a general practice and travel clinic on the corner of Kromboom and Sunnyside Roads in Crawford, offering general, travel, occupational and insurance medical services.',
    description_enriched_at = datetime('now')
WHERE slug = 'kromboom-medical-practice-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Kromboom is a full-service supermarket in the Kromboom Convenience Centre in Crawford with an in-house deli, bakery and butchery and Halaal-certified stock, and was named SPAR''s National and Regional Store of the Year in 2022.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:30-21:00',
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/crawford/supermarkets/kromboom-quick-spar", "https://www.hotfrog.co.za/company/0816d1c29194aacc5bc335ce6f57cece/kwikspar-kromboom/cape-town/general-stores", "https://www.spar.co.za/Home/Store-View/KWIKSPAR-Kromboom-Western-Cape/"]'
WHERE slug = 'kwikspar-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Kromboom Rd is a flame-grilled burger and chicken takeaway in the Kromboom Centre in Crawford, part of the national Steers chain known for its 100% beef burgers and hand-cut chips.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-22:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d34071294-Reviews-Steers_Kromboom_Rd-Cape_Town_Western_Cape.html", "https://www.southafricabusinessdirectory.co.za/company/33de2ade960dcf16af9a4c32c6dab387/steers/cape-town/restaurants", "https://locations.steers.co.za/restaurants-KromboomCentre-SteersKromboomRd"]'
WHERE slug = 'steers-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The President Hotel is a resort-style hotel on the Atlantic seaboard in Bantry Bay, next to the Sea Point Promenade with Lion''s Head as a backdrop; the site has hosted a hotel in various forms for over 250 years, and the current hotel was reopened by Nelson Mandela in 1998.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-president-hotel-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Raj is a North Indian and tandoori restaurant in The Promenade on Camps Bay''s Victoria Road, known for its ocean views alongside its curry and tandoor dishes.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-raj-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Real Repair Company at Gardens Shopping Centre repairs Apple, Samsung and Huawei devices, including phones, tablets and watches, with a typical one-hour turnaround and a three-month guarantee on parts and labour.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun Closed'
WHERE slug = 'the-real-repair-company-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Shop Restaurant is a casual bistro in Three Anchor Bay serving simple, honest food made with free-range and sustainably sourced ingredients, including meat, fish and vegetarian dishes; it opened in November 2017 in the space previously occupied by the Buzbey Grill steakhouse.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-shop-restaurant-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Sports Concept Store is a performance running shoe and sportswear retailer in Cape Quarter Lifestyle Village, De Waterkant, stocking brands including HOKA, On, Asics and Under Armour; it opened as the brand''s first store in 2013.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 10:00-14:00'
WHERE slug = 'sports-concept-store-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Tux Tailor is a tailoring and alterations shop in Riverlands Mall, Observatory, offering suit fittings, dress alterations and custom tailoring for weddings, matric balls and everyday wear, as part of a chain of about 10 stores across Cape Town and Johannesburg.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-tux-tailor-riverlands-observatory' AND description_enriched_at IS NULL;
