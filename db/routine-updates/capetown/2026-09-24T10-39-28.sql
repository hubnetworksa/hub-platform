UPDATE businesses
SET description = 'Crumbs & Cream is a family-run ice-cream parlour in Sea Point known for its build-your-own ice-cream sandwiches -- choose your cookies, gelato and toppings -- alongside milkshake creations. It was founded in 2016 and now also has a branch at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/crumbs-cream-sea-point/", "https://www.eatout.co.za/venue/crumbs-cream/", "https://www.capetownmagazine.com/crumbs-and-cream"]'
WHERE slug = 'crumbs-and-cream-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'FNB Greenpoint is a First National Bank branch in the Media Quarter on Somerset Road, Green Point, offering everyday banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-16:00, Fri 08:30-16:00, Sat 08:30-12:00'
WHERE slug = 'fnb-greenpoint-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grand Diamonds is a Green Point jeweller specialising in custom-made engagement rings, wedding bands and diamond jewellery, sourcing certified, conflict-free diamonds in line with the Kimberley Process. It has been trading for over 15 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://granddiamonds.co.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/grand-diamonds?to=place.ChIJ49IfmmZnzB0RUMD_hxGcnyk", "https://granddiamonds.co.za/about-us/"]'
WHERE slug = 'grand-diamonds-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MAKE is an Asian restaurant in Sea Point specialising in sushi alongside Japanese and Chinese dishes, including dim sum, available for dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-21:30, Fri-Sat 11:00-22:00, Sun 12:00-21:30',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d2468248-Reviews-or30-Make_Restaurant-Cape_Town_Central_Western_Cape.html", "https://www.findglocal.com/ZA/Cape-Town/134495703311920/MAKE-restaurant-Sea-Point", "https://www.makerestaurant.co.za/"]'
WHERE slug = 'make-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Petrie''s Pharmacy is a community pharmacy in Sea Point offering prescription dispensing, chronic medication management and personalised health advice, with free medicine delivery in the surrounding area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://www.yep.co.za/biz/store/iyp/39538_2", "https://www.thinklocal.co.za/biz/petries-pharmacy-cape-town", "https://petriespharmacy.wixsite.com/petriespharm"]'
WHERE slug = 'petries-pharmacy-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Woolworths Food supermarket inside Portside Shopping Centre in Green Point, well stocked with fresh groceries and organic options, and featuring an in-store coffee counter.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 07:00-21:00, Tue-Sun 08:00-21:00',
    source_urls = '["https://my-catalogue.co.za/stores/green-point/woolworths/port-side-centre-cnr-portswood-and-somerset-roads", "https://www.yellowpages.net/phone_27-214302000_grocery-store_Cape-Town_ZA20398.html", "https://foursquare.com/v/woolworths-food/4c0a20216071a593b00edf32"]'
WHERE slug = 'woolworths-green-point' AND description_enriched_at IS NULL;
