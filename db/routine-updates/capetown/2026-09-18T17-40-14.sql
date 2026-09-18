UPDATE businesses
SET description = 'Ackermans Golden Acre is a fashion and clothing retailer trading inside the Golden Acre Shopping Centre in Cape Town''s city centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-18:00, Sun 08:30-14:00'
WHERE slug = 'ackermans-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Addis in Cape is an authentic Ethiopian restaurant on Loop Street offering a communal dining experience with traditional hand-wash ceremonies and Ethiopian coffee, alongside vegetarian, vegan and non-vegetarian platters served on injera.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:30',
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/addis-in-cape/", "https://addisincape.co.za", "https://www.eatout.co.za/venue/addis-in-cape-ethiopian-restaurant/"]'
WHERE slug = 'addis-in-cape-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Advanced Electric Fencing is an electric fencing supplier and installer based in Windsor Park, Kraaifontein.',
    description_enriched_at = datetime('now')
WHERE slug = 'advanced-electric-fencing-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Affordable Office Factory Shop is a factory outlet on Voortrekker Road in Salt River selling used and refurbished office furniture -- desks, chairs, cabinets, reception furniture and canteen furniture -- to corporate and small-business buyers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-16:50, Sat 10:00-13:00, Sun Closed',
    source_urls = '["https://www.yellopages.co.za", "https://www.thinklocal.co.za", "https://www.yep.co.za/biz/store/affordable-office-factory-shop/330032"]'
WHERE slug = 'affordable-office-factory-shop-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Amare is a Mediterranean-inspired restaurant on Victoria Road in Bantry Bay, serving breakfast through dinner with sea-facing dining.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Tue 07:30-22:00, Wed-Sat 07:30-23:00',
    source_urls = '["https://insideguide.co.za/cape-town/specials/amare/", "https://purely-local.co.za/cape-town/bantry-bays-amare-restaurant-is-the-latest-culinary-hotspot/", "https://www.dining-out.co.za/md/Amare/11823", "https://amarecapetown.com/"]'
WHERE slug = 'amare-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Artvark Gallery is a classic and contemporary art gallery on Main Road in Kalk Bay, also incorporating a café for visitors.',
    description_enriched_at = datetime('now'),
    hours = 'Nov-Apr 09:00-18:30, May-Oct 09:00-17:00',
    source_urls = '["https://www.artvark.org", "https://insideguide.co.za/cape-town/kalk-bay/", "https://www.tripadvisor.co.za/Attraction_Review-g312659-d7682517-Reviews-Artvark_Gallery-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'artvark-gallery-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Authentic Aesthetics S.A is a beauty and aesthetics salon on Ayrshire Street in Rondebosch East offering treatments such as laser hair removal and skin-lightening treatments by appointment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-15:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/authentic-aesthetics-s-a-ayrshire-street-cape-town-P54oA", "https://www.findmy.co.za/services/business/authentic-aesthetics-sa/1911", "https://authenticaesthetics.co.za/"]'
WHERE slug = 'authentic-aesthetics-sa-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BP Southfield is a fuel station on Victoria Road in Southfield, also offering a car wash and tyre-dealer services.',
    description_enriched_at = datetime('now')
WHERE slug = 'bp-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bailey Haynes Inc is a Kraaifontein-based law firm handling civil litigation, conveyancing, motor vehicle accident claims, and family and criminal law matters, with an extensive correspondent network for matters outside its immediate jurisdiction.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/location/kraaifontein", "https://www.baileyhaynes.co.za/"]'
WHERE slug = 'bailey-haynes-inc-kraaifontein' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Banana Jam Café is a Caribbean-style restaurant and brewpub on Second Avenue in Harfield Village, known for its own craft beer, cocktails and a weekly Jamaican jerk barbecue on Thursday evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 11:00-late, Mon Closed',
    source_urls = '["https://en.wikipedia.org/wiki/Harfield_Village", "https://cape-town.infoisinfo.co.za/card/banana-jam-cafe/222358", "https://www.bananajamcafe.co.za/"]'
WHERE slug = 'banana-jam-cafe-harfield-village' AND description_enriched_at IS NULL;
