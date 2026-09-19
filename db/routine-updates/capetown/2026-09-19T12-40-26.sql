UPDATE businesses
SET description = 'Backyard Brew Coffee Co. is a small-batch, roast-to-order coffee roaster based in Kenwyn, supplying fresh specialty coffee across Cape Town with a monthly free delivery route and an ethically-traded sourcing policy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:30-18:00',
    source_urls = '["https://za.africabz.com/western-cape/backyard-brew-coffee-co-165195", "https://harfield-village.co.za/business/backyard-brew-coffee-company/", "https://www.backyardbrewcoffee.co.za/contact/", "https://www.backyardbrewcoffee.co.za/"]'
WHERE slug = 'backyard-brew-coffee-co-kenwyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Barnyard Theatre Willowbridge is a live entertainment venue inside Willowbridge Shopping Centre in Bellville, staging concerts, tribute shows and comedy performances on weekday and weekend evenings, with occasional Sunday matinees.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.barnyardtheatre.co.za/tygervalley/", "https://www.tripadvisor.co.nz/Attraction_Review-g312656-d7264238-Reviews-Barnyard_Theatre_Willowbridge-Bellville_Western_Cape.html", "https://www.tripadvisor.com/Attraction_Review-g312656-d7264238-Reviews-Barnyard_Theatre_Willowbridge-Bellville_Western_Cape.html"]'
WHERE slug = 'barnyard-theatre-willowbridge-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Chaos Computers is a computer sales and repair shop inside Willowbridge Shopping Centre in Bellville, supplying desktops, laptops, accessories and computer servicing and support.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'chaos-computers-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jam Clothing is a children''s and family clothing store inside Golden Acre Shopping Centre in Cape Town''s CBD, offering budget-friendly kids'' fashion from a range of brands.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'jam-clothing-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jen Kahn Clothing is a South African luxury fashion label with a store inside Cape Quarter Lifestyle Village in De Waterkant, offering women''s and men''s clothing collections it has produced for more than three decades.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://jenkahn.com/"]'
WHERE slug = 'jen-kahn-clothing-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KAUAI Checkers Meadowridge is a health-focused quick-service cafe inside Meadowridge Shopping Centre, serving wraps, salads, smoothies and barista coffee for dine-in, takeaway and delivery.',
    description_enriched_at = datetime('now')
WHERE slug = 'kauai-checkers-meadowridge-meadowridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Cape Town CBD (Golden Acre) is a fried chicken and fast-food outlet inside Golden Acre Shopping Centre in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KFC Waterstone is a fried chicken and fast-food outlet inside Waterstone Village in Somerset West.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-waterstone-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kasu''s Interiors is a family-run interior decorating business in Kenwyn, established in 1998, specialising in curtains, blinds, upholstery and custom-made headboards for residential and corporate projects.',
    description_enriched_at = datetime('now')
WHERE slug = 'kasus-interiors-kenwyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kauai is a health-focused cafe at Isaacs Corner on Victoria Road in Camps Bay, serving smoothies, wraps, salads and juices for a quick, health-conscious meal.',
    description_enriched_at = datetime('now')
WHERE slug = 'kauai-camps-bay' AND description_enriched_at IS NULL;
