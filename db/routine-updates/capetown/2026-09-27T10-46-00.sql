UPDATE businesses
SET description = 'Oakhurst Farmstall is a farm stall and deli on Main Road, Kenilworth, selling fresh fruit and vegetables, homemade cakes and baked goods, imported chocolates and preserves, alongside a coffee shop counter.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:30-17:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/oakhurst-farmstall-27098", "http://oakhurstfarmstallk.co.za/contact_us.html", "https://www.eatout.co.za/venue/oakhurst-farm-stall/"]'
WHERE slug = 'oakhurst-farmstall-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a national discount clothing, footwear and homeware retailer with a branch inside Maynard Mall, Wynberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'pep-maynard-mall-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Penny Lane is a breakfast cafe in Wynberg that has been serving all-day breakfasts and lunches for over 24 years, known for its cosy, homely atmosphere.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/wynberg/coffee-shops/penny-lane-cake-and-coffee-shop", "https://za.africabz.com/western-cape/penny-lane-73445", "https://penny-lane.goto-where.com/"]'
WHERE slug = 'penny-lane-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sorbet Salon Kenilworth on Main is a beauty salon at Pam Golding on Main offering facials and skincare treatments including dermaplaning and microdermabrasion, hair removal, threading, manicures and pedicures.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://za.africabz.com/western-cape/sorbet-kenilworth-207307", "https://stores.salonssorbet.co.za/western-cape/cape-town/pam-golding-on-main-shop-g004", "https://www.fresha.com/lvp/sorbet-salon-kenilworth-summerley-road-cape-town-ovL4gG"]'
WHERE slug = 'sorbet-salon-kenilworth-on-main-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sportscene is a sneaker and sportswear retailer with a branch inside Maynard Mall, Wynberg, stocking footwear and apparel from brands including Nike, Air Jordan, adidas Originals, PUMA, Converse and Vans.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/sportscene/130-main-rd-wynberg", "https://www.africanadvice.com/1345608/Sportswear/Cape_Town/Sportscene/", "https://www.sayellow.com/view/south-africa/sportscene-wynberg-in-cape-town"]'
WHERE slug = 'sportscene-maynard-mall-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Venture Workspace''s Constantia branch, opened in February 2021 on the first floor of Constantia Emporium, offers hot-desking, private offices, meeting rooms and boardrooms with secure tenant parking and biometric access.',
    description_enriched_at = datetime('now')
WHERE slug = 'venture-workspace-constantia-emporium-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths Food is a supermarket outlet inside Constantia Emporium, Constantia, selling food, grocery and other Woolworths retail items.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Fri 08:00-19:00'
WHERE slug = 'woolworths-food-constantia-emporium-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness is a gym chain with a branch inside Maynard Mall, Wynberg, offering fitness equipment and group classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 06:00-21:00, Fri 06:00-20:00, Sat-Sun 07:00-15:00'
WHERE slug = 'zone-fitness-maynard-mall-wynberg' AND description_enriched_at IS NULL;
