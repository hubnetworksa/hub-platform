-- Job 4: description enrichment sweep, batch 1 of 3 (10 businesses)
UPDATE businesses
SET description = 'Harringtons Cocktail Lounge is an upstairs cocktail bar and global tapas venue on Harrington Street in Cape Town''s East City district, known for its happy-hour specials and a late-night atmosphere from Wednesday to Saturday.',
    description_enriched_at = datetime('now'),
    hours = 'Wed 17:00-00:00, Thu-Sat 17:00-04:00',
    source_urls = '["https://za.africabz.com/western-cape/harringtons-cocktail-lounge-231210", "https://www.harringtonstreet.co.za/harringtons", "https://insideguide.co.za/cape-town/specials/harringtons-happy-hour-special/"]'
WHERE slug = 'harringtons-cocktail-lounge-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Seebamboes is an intimate 16-seat tasting-menu restaurant on the mezzanine level above Galjoen on Harrington Street, led by chef Adel Hughes and serving an inventive surf-and-turf menu pairing local seafood and game with seasonal Cape ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Dinner Tue-Sat from 18:45, Lunch Fri-Sat from 12:30',
    source_urls = '["https://www.seebamboescpt.co.za/pages/about-seebamboes", "https://www.dineplan.com/restaurants/seebamboes", "https://www.timeout.com/cape-town/restaurants/seebamboes"]'
WHERE slug = 'seebamboes-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Superette is a neighbourhood cafe and restaurant at 66 Albert Road in the Woodstock Exchange building, known for all-day breakfasts and light meals made with seasonal, locally sourced produce from small Cape Town suppliers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://foursquare.com/v/superette/4c1b9f0b624b9c74b4a41204", "https://www.eatout.co.za/venue/superette/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d1596127-Reviews-Superette-Cape_Town_Central_Western_Cape.html", "https://www.capetownmagazine.com/cafes/superette-my-favourite-cafe/93_22_17265"]'
WHERE slug = 'superette-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Surfside Restaurant is a bistro-style restaurant inside the Strand Pavilion complex on Beach Road, Strand, serving seafood, steak and sushi with views over False Bay.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g1236998-d2516086-Reviews-Surfside_Restaurant-Strand_Western_Cape.html", "https://www.eatout.co.za/venue/surfside-bistro/", "https://www.sayellow.com/view/south-africa/surfside-restaurant-and-steakhouse-in-strand"]'
WHERE slug = 'surfside-restaurant-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Woodstock Quarter is a liquor store attached to the SPAR supermarket in the Woodstock Quarter retail precinct on Sir Lowry Road, stocking a wide range of wine, beer and spirits.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-18:30',
    source_urls = '["https://www.hotfrog.co.za/company/646141d43cd6ac2678baba316bde6c37/tops-at-spar-woodstock-quarter/cape-town/food-beverages", "https://www.cylex.net.za/company/tops-at-spar-woodstock-quarter-23862003.html", "https://my-catalogue.co.za/stores/woodstock/tops-at-spar/187-sir-lowry-road"]'
WHERE slug = 'tops-at-spar-woodstock-quarter-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tannin is a wine bar and restaurant at 86 Bree Street in the Cape Town CBD, offering a walk-in bar with hundreds of hand-picked wines by the glass alongside a first-floor sit-down restaurant serving modern dishes for lunch and dinner.',
    description_enriched_at = datetime('now'),
    hours = 'Bar Mon-Sun 11:30-22:00, Restaurant lunch 12:00-14:30 & dinner 18:00-21:30',
    source_urls = '["https://www.dineplan.com/restaurant/tannin", "https://whatsonincapetown.com/tannin-wine-bar-in-cape-town/", "https://starwinelist.com/wine-place/tannin-on-bree"]'
WHERE slug = 'tannin-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Best Laser & Skin is a beauty and skin-care clinic at 25 Derry Street in Vredehoek, offering laser hair removal and skin treatments by appointment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun Closed',
    source_urls = '["https://www.fresha.com/a/the-best-laser-skin-cape-town-25-derry-street-c1683yxs", "https://za.africabz.com/western-cape/the-best-laser-skin-83144", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=412202"]'
WHERE slug = 'the-best-laser-skin-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Strand Square is a discount variety store on Fagan Street selling household goods, toys, stationery and gifts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-17:30, Fri 08:00-14:00, Sat 08:00-16:00, Sun & Public Holidays 09:00-14:00',
    source_urls = '["http://capetown.goveza.co.za/directory/the-crazy-store-strand-square/", "https://www.facebook.com/strandcentre/posts/we-heard-a-rumour-that-the-crazy-store-has-got-some-crazy-specials-running-this-/1149029245950843/", "https://www.tiendeo.co.za/stores/cape-town/crazy-store-shop-strand-square-fagan-st-strand-cape-town-south-africa/7517"]'
WHERE slug = 'the-crazy-store-strand-square-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Mountain View Shopping Centre is a discount variety store on Avondrus Street in Gordon''s Bay selling household goods, toys, stationery and gifts.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-16:00, Sun & Public Holidays 09:00-14:00',
    source_urls = '["https://www.sayellow.com/view/south-africa/the-crazy-store-mountainview-centre-in-gordons-bay-cape-town", "https://www.cybo.com/ZA-biz/the-crazy-store-gordons-bay", "https://za.africabz.com/western-cape/the-crazy-store-gordons-bay-157538"]'
WHERE slug = 'the-crazy-store-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger Wheel & Tyre at Sun Valley Mall is a branch of the national tyre and vehicle-servicing chain, offering tyre sales and fitment, wheel alignment and general vehicle servicing for the Sun Valley and Noordhoek area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://homeappliancerepairs.co.za/8420766342042441448/", "https://www.findglocal.com/ZA/Cape-Town/106074950772806/Tiger-Wheel-&-Tyre", "https://www.facebook.com/sunvalleymallsunnydale/videos/meet-our-tenant-tiger-wheel-tyre-at-sun-valley-mall/305878076804695/"]'
WHERE slug = 'tiger-wheel-tyre-sunnydale' AND description_enriched_at IS NULL;
