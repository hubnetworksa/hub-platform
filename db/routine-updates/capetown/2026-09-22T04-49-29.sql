UPDATE businesses
SET description = 'Silver Spoon Indian Restaurant is an Indian cuisine restaurant in Tokai Village Centre.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1770549-d23345530-Reviews-Silver_Spoon_Indian_Cuisine-Tokai_Western_Cape.html", "https://www.facebook.com/silverspoontokai/", "https://silverspoontokai.co.za/"]'
WHERE slug = 'silver-spoon-indian-restaurant-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simply Asia is a Thai and Asian restaurant in Sea Point''s Alice Court on Main Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:30-21:30',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d1582092-Reviews-Simply_Asia_Sea_Point-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/simply-asiasea-point/", "https://www.dining-out.co.za/restaurant-index.aspx?MemberID=1733&SiteVersion=desktop"]'
WHERE slug = 'simply-asia-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportsmans Warehouse Tokai-on-Main is a branch of the sporting goods retail chain, stocking sportswear, footwear and outdoor equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-15:00',
    source_urls = '["https://www.sportsmanswarehouse.co.za/store/tokai-on-main-cape-town/", "https://www.cylex.net.za/company/sportsmans-warehouse-branches-tokai-3-tokai-on-main-main-rd-19634563.html", "https://www.tiendeo.co.za/stores/cape-town/sportsmans-warehouse-shop-tokai-road/15845"]'
WHERE slug = 'sportsmans-warehouse-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Starlings Locale is a coffee shop and restaurant in a residential part of Claremont, the little sibling of Starlings Cafe, known for specialty coffee and indoor/outdoor seating with mountain views.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-17:00',
    source_urls = '["https://www.sluurpy.co.za/claremont/restaurant/5032164/starlings-locale", "https://insideguide.co.za/cape-town/restaurants/starlings-locale/", "https://www.eatout.co.za/venue/starlings-locale/"]'
WHERE slug = 'starlings-locale-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Kromboom Rd is a branch of the Steers flame-grilled burger and chicken chain in Rondebosch East.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-22:00',
    source_urls = '["https://location.steers.co.za/kromboom-rd", "https://www.tripadvisor.co.za/Restaurant_Review-g2426452-d8661780-Reviews-Steers-Rondebosch_Western_Cape.html"]'
WHERE slug = 'steers-kromboom-rd-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sundoo is an Indian tapas restaurant in Sea Point specialising in South Indian and Durban-style cuisine.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-21:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g15134971-d9750909-Reviews-Sundoo-Sea_Point_Western_Cape.html", "https://www.dining-out.co.za/md/Sundoo-Sea-Point/8146", "https://sundoo.co.za/contact/"]'
WHERE slug = 'sundoo-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Super Plants Garden Centre is a nursery and garden centre at Tokai-on-Main, Tokai.',
    description_enriched_at = datetime('now')
WHERE slug = 'super-plants-garden-centre-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sushi Box Newlands is a sushi restaurant in Cardiff Castle Centre on Main Street, Newlands.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/sushi-box-newlands-19507", "https://2pos.co.za/2/9262", "https://www.dining-out.co.za/md/Sushi-Box-Newlands/9926"]'
WHERE slug = 'sushi-box-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swimmattix Swim School is an internationally accredited swim school in Sherwood Shopping Centre, Bergvliet, offering baby, children''s and adult swimming lessons in indoor pools heated to 34 degrees.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://sherwoodshopping.co.za/swimmattix-swim-school/", "http://www.swimmattix.com/contact-us", "https://www.swimmattix.com/"]'
WHERE slug = 'swimmattix-swim-school-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TAH Kenilworth is a branch of The Animal Hospital and Vetshop, offering veterinary consultations and a pet retail shop in Kenilworth.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-13:00, 14:00-17:30, Sat 09:00-12:00, Sun Closed'
WHERE slug = 'tah-kenilworth' AND description_enriched_at IS NULL;
