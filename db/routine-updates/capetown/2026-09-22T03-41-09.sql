UPDATE businesses
SET description = 'BUCO Bergvliet is a hardware and building materials store in the Harry Goemans Centre on Main Road, part of the national BUCO chain, stocking building supplies, tools and home improvement products.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 07:30-17:00, Sat 08:00-13:00, Sun Closed', source_urls = '["https://www.buco.co.za/bergvliet", "https://za.africabz.com/western-cape/buco-bergvliet-181642", "https://cape-town-south-africa.bizfax.co.za/buco-bergvliet.html"]'
WHERE slug = 'buco-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Exclusive Books is a South African book retailer with a branch in Constantia Village, stocking a wide range of fiction, non-fiction and children''s titles alongside stationery and gifts.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00', source_urls = '["https://constantiavillage.co.za/stores/exclusive-books/", "https://www.yep.co.za/biz/store/exclusive-books-pty-ltd/373839", "https://openhours-southafrica.com/en/cape-town/exclusive-books-constantia"]'
WHERE slug = 'exclusive-books-constantia-village-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Perla is a long-established Mediterranean and seafood restaurant on the Sea Point promenade, trading since 1959 and known locally as one of Cape Town''s oldest fine-dining institutions.', description_enriched_at = datetime('now'), source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d799026-Reviews-La_Perla_Restaurant-Cape_Town_Central_Western_Cape.html", "https://laperla.co.za/", "https://www.rossouwsrestaurants.com/index.php/2018/05/11/classics-la-perla/"]'
WHERE slug = 'la-perla-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maharajah Restaurant is a long-running Indian restaurant in Rosebank, part of a family of Maharajah restaurants trading in Cape Town since 1979, serving South African Indian cuisine such as curries served with rice and sambals.', description_enriched_at = datetime('now'), hours = 'Mon-Sun 12:00-21:00', source_urls = '["https://www.maharajah.restaurant/contact-us/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d5597979-Reviews-Maharajah_Indian_Restaurant-Cape_Town_Central_Western_Cape.html", "https://www.mrd.com/delivery/restaurant/maharajah-rondebosch-rosebank/28002"]'
WHERE slug = 'maharajah-restaurant-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Malie Nail and Beauty Salon is a nail and beauty salon in Plumstead offering manicures, pedicures and gel or acrylic nail enhancements.', description_enriched_at = datetime('now')
WHERE slug = 'malie-nail-and-beauty-salon-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mamacita''s is a Cal-Mex restaurant on Harrington Street in District Six, serving tacos, LA-style burgers and Mexican-inspired dishes alongside a cocktail menu.', description_enriched_at = datetime('now')
WHERE slug = 'mamacitas-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moksh Indian Restaurant is a North Indian restaurant in Plumstead specialising in tandoor-cooked dishes and curries prepared by chefs trained in India, also catering for private functions and family celebrations.', description_enriched_at = datetime('now')
WHERE slug = 'moksh-indian-restaurant-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monks Chinese is a Chinese takeaway restaurant on Durban Road in Mowbray, with a menu of traditional dishes including smoked noodles and crispy duck.', description_enriched_at = datetime('now'), source_urls = '["https://readymap.co.za/308/3956", "https://za.africabz.com/western-cape/monks-chinese-28593", "https://restaurantguru.com/Monks-Chinese-Food-Cape-Town-3/menu"]'
WHERE slug = 'monks-chinese-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Home 3 Arts Plumstead is a homeware and decor store in the 3 Arts Village Shopping Centre, part of the Mr Price Home retail chain, stocking furniture, home decor and soft furnishings.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'mr-price-home-3-arts-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nando''s 3Arts Village is a branch of the flame-grilled peri-peri chicken chain Nando''s, located in the 3 Arts Village Shopping Centre in Plumstead.', description_enriched_at = datetime('now')
WHERE slug = 'nandos-3arts-village-plumstead' AND description_enriched_at IS NULL;
