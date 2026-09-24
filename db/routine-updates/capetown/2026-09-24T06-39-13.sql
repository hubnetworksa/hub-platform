UPDATE businesses
SET description = 'Carlyle''s on Derry is an Italian restaurant in Vredehoek known for its wood-fired pizzas and other Italian dishes, on Derry Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 15:00-23:00, Tue-Sun 12:00-23:00',
    source_urls = '["https://carlyles.co.za/contact/", "https://za.africabz.com/western-cape/carlyles-on-derry-26273", "https://www.eatout.co.za/venue/carlyleson-derry/"]'
WHERE slug = 'carlyles-on-derry-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Crema Design is a furniture and lifestyle showroom in Woodstock, showcasing international designer lighting, rugs, and indoor/outdoor furniture in a restored Victorian building dating to 1889.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:00, Fri 08:30-16:00, Sat 09:30-13:30',
    source_urls = '["https://cremadesign.co.za/contact/", "https://za.africabz.com/western-cape/crema-design-50747", "https://visi.co.za/the-new-crema-design-showroom/"]'
WHERE slug = 'crema-design-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Deli''s Pies is a Woodstock bakery specialising in frozen and freshly baked pies.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/delis-pies/329358", "https://www.facebook.com/DeliPiesBakery/", "https://www.africanadvice.com/1078275/Pies/Cape_Town/Delis_Pie/"]'
WHERE slug = 'delis-pies-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fish4Africa is a fresh fish and seafood retailer on Victoria Road in Woodstock, part of a Cape Town chain offering fish filleting and seafood products.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00',
    source_urls = '["https://fish4.africa/stores/", "https://za.africabz.com/western-cape/fish4africa-47431"]'
WHERE slug = 'fish4africa-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Harringtons is a cocktail lounge and restaurant on Harrington Street in Zonnebloem serving grills, light meals and tapas, with outdoor seating and a dancefloor.',
    description_enriched_at = datetime('now'),
    hours = 'Wed-Fri 16:00 till late, Sat 18:00 till late',
    source_urls = '["https://www.harringtonstreet.co.za/harringtons", "https://www.dining-out.co.za/md/Harringtons/10253", "https://www.food-blog.co.za/harringtons-cocktail-lounge/"]'
WHERE slug = 'harringtons-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'New York Bagels is a dedicated bagel bakery in Zonnebloem, hand-rolling, boiling and baking traditional New York-style bagels in a range of varieties.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat-Sun 07:00-14:00',
    source_urls = '["https://www.capetownccid.com/explore/eat/new-york-bagels", "https://www.facebook.com/NYBCT/", "https://bicyclesouth.co.za/listings/new-york-bagels/", "https://www.openhours-southafrica.com/en/cape-town/new-york-bagels"]'
WHERE slug = 'new-york-bagels-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pet Kin is a pet supply store in Vredehoek stocking premium dog and cat food and nutrition brands including Hill''s, Purina, Royal Canin and Acana, with local delivery available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:30',
    source_urls = '["https://www.petkin.co.za/password", "https://bormandumazitha.co.za/pet-kin-pet-supply-store-17255723028012014100/", "https://www.petkin.co.za/", "https://all-opening-hours.co.za/02104969/Pet_Kin_Pet_Supplies"]'
WHERE slug = 'pet-kin-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sidewalk Cafe is a long-standing neighbourhood cafe and restaurant on Derry Street in Vredehoek, serving breakfasts, light meals and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-22:30, Sun 09:00-14:00',
    source_urls = '["https://www.capetownetc.com/food-and-drink/sidewalk-cafe/", "https://oncebitten.co.za/?page_id=640", "https://www.safarinow.com/destinations/vredehoek/restaurants/the-sidewalk-cafe.aspx"]'
WHERE slug = 'sidewalk-cafe-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Kind Kitchen is a small vegan restaurant based at Woodstock Brewery, creating seasonal plant-based comfort food from locally grown and sourced produce.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/the-kind-kitchen/", "https://thekindkitchencoza.wordpress.com/contact/", "https://thekindkitchen.co.za/pages/about"]'
WHERE slug = 'the-kind-kitchen-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wild Eatery is an outdoor cafe in Zonnebloem, accessible from both Harrington Street and via NUDE FOODS, a plastic-free grocery store, on Constitution Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 10:00-15:30, Sat 10:00-15:00, Sun Closed',
    source_urls = '["https://www.wildeatery.co.za/locations", "https://www.corner.inc/place/563497", "https://opening-hours.co.za/02998010/Wild_Eatery"]'
WHERE slug = 'wild-eatery-zonnebloem' AND description_enriched_at IS NULL;
