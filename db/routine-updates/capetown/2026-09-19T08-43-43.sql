UPDATE businesses
SET description = 'Dr Zoran Aleksic Ophthalmologist is an ophthalmology practice in The Point, Sea Point, specialising in cataract and lens surgery as well as laser refractive procedures (LASIK/PRK) for short- and long-sightedness and astigmatism, with over 20 years of experience.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=134064", "https://www.eyesurgery.co.za/contact-us", "https://www.eyesurgery.co.za/about"]'
WHERE slug = 'dr-zoran-aleksic-ophthalmologist-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Drifters Xtreme Sport is an outdoor adventure specialist in Cape Quarter, De Waterkant, stocking camping, hiking and rock-climbing gear including tents, sleeping bags, boots, backpacks and technical accessories for outdoor pursuits.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://www.climbing.co.za/listing/drifters-xtreme-sport/", "https://gpokcid.co.za/2016/06/06/drifters-xtreme-sport/"]'
WHERE slug = 'drifters-xtreme-sport-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Epping Industrial Suppliers is a family-owned industrial supplier in Epping, founded in 1973 and now in its third generation, stocking cleaning chemicals, paper products, personal protective equipment and industrial consumables for the manufacturing, hospitality, cleaning and engineering sectors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/za-biz/epping-industrial-suppliers", "https://za.africabz.com/western-cape/epping-industrial-suppliers", "https://eiscape.co.za/about-us"]'
WHERE slug = 'epping-industrial-suppliers-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Epping Motor Spares is a motor spares dealer in Epping specialising in used and reconditioned BMW parts, along with number plates and wholesale Willard batteries.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.netpages.co.za", "https://www.sayellow.com", "https://www.netpages.co.za/Cape+Town/Epping+Motor+Spares-86445.html"]'
WHERE slug = 'epping-motor-spares-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Espresso Lab Microroasters is a specialty coffee roastery and cafe at The Old Biscuit Mill in Woodstock, serving espresso and filter coffee sourced from traceable farms and cooperatives, alongside a range of coffee products and equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-16:00, Sat 08:00-15:00',
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/espresso-lab-microroasters/", "https://www.tripadvisor.com/Restaurant_Review-g6776544-d13183504-Reviews-Espresso_Lab_Microroaster-Woodstock_Western_Cape.html", "https://espressolabmicroroasters.com/pages/about-us"]'
WHERE slug = 'espresso-lab-microroasters-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Estora Home is a furniture retailer in The Palms Décor and Lifestyle Centre, Woodstock, specialising in handcrafted couches, beds, coffee and side tables, and outdoor furniture with customisable finishes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.palms.co.za/tenants", "https://www.estorahome.co.za/", "https://estorahome.co.za/product-category/couches/sleeper-couches/"]'
WHERE slug = 'estora-home-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Exact is a family clothing retailer in Golden Acre, part of the Foschini Group (TFG), offering clothing, footwear and accessories for women, men and children aged 3 to 12.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.facebook.com/exactclothing/posts/our-golden-acre-kids-store-now-open/1770095069731030/", "https://www.sayellow.com/view/south-africa/exact-golden-acre-in-cape-town"]'
WHERE slug = 'exact-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Exclusive Books is a long-established South African bookstore chain in operation since 1951; this Victoria Wharf branch stocks an extensive range of books, magazines and gifts alongside an in-store cafe.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-21:00',
    source_urls = '["https://www.shopshours.co.za/exclusive-books/cape-town", "https://www.tiendeo.co.za/stores/cape-town/exclusive-books", "https://www.waterfront.co.za/stores/exclusive-books-2"]'
WHERE slug = 'exclusive-books-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FNB Gardens is a bank branch inside Gardens Shopping Centre, offering everyday banking services to the Gardens and City Bowl area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 09:00-17:00, Thu-Fri 08:00-17:00, Sat 08:30-12:30, Sun Closed',
    source_urls = '["https://www.africabizinfo.com/ZA/fnb-gardens-branch-087-575-9404", "https://za.statex.info/fnb-gardens-branch-30", "https://openhours-southafrica.com/en/cape-town/fnb-gardens-branch"]'
WHERE slug = 'fnb-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fashion City is a fashion and clothing retailer inside Golden Acre Shopping Centre in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'fashion-city-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;
