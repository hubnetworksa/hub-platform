-- Job 4: description enrichment sweep (7 businesses, clears the entire current backlog)

UPDATE businesses
SET description = 'Arc is a brand engagement and shopper marketing agency based at The Harrington in Zonnebloem, part of the global Publicis Groupe network and working across CRM, digital, social and marketing automation for clients'' retail journeys.',
    description_enriched_at = datetime('now')
WHERE slug = 'arc-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Deer Park Cafe is a restaurant in Vredehoek known for a weekly changing menu that always features authentic Indian specials, alongside vegan, gluten-free and free-range options.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:00-21:00 (winter), 08:00-22:00 (summer)',
    source_urls = '["https://southafricafirm.com/western-cape/deer-park-cafe-and-deli-3098", "https://www.facebook.com/deerpark.cafe/", "https://deerparkcafe.co.za/"]'
WHERE slug = 'deer-park-cafe-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Digitas Liquorice is a digital marketing agency based at The Harrington in Zonnebloem, offering web, mobile, social media, CRM and content services across several African offices.',
    description_enriched_at = datetime('now')
WHERE slug = 'digitas-liquorice-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Vredehoek is a SPAR-branded supermarket on Derry Street stocking everyday groceries and convenience essentials for the neighbourhood.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 07:00-20:30',
    source_urls = '["https://za.africabz.com/western-cape/kwikspar-10027", "https://www.thinklocal.co.za/biz/kwikspar-vredehoek-vredehoek", "https://www.tiendeo.co.za/stores/cape-town/kwikspar-derry-street-vredehoek/39546"]'
WHERE slug = 'kwikspar-vredehoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Molteno Road Dental Practice is a general dental practice in Oranjezicht offering routine check-ups alongside cosmetic dentistry, dental implants and orthodontic treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/molteno-road-dental-practice-cape-town-116847", "https://dir.alltrack.org/view/169321-8-molteno-road-dental-practice-cape-town", "https://moltenodental.co.za/"]'
WHERE slug = 'molteno-road-dental-practice-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ou Meul Bakery and Cafe in Oranjezicht is a branch of the Ou Meul Bakkery chain, serving freshly baked bread and pastries alongside coffee and light meals made with locally sourced ingredients.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-20:00, Sun 07:00-19:00'
WHERE slug = 'ou-meul-bakery-oranjezicht' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Red Sofa Cafe & Deli is a neighbourhood cafe on the corner of Exner and Derry Streets in Vredehoek, serving all-day breakfasts, lunches and coffee with views toward Table Mountain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:30, Sat-Sun 08:00-16:30',
    source_urls = '["https://www.yep.co.za/biz/store/red-sofa-cafe/409633", "https://www.redsofacafe.co.za/our-story.html", "https://blog.sa-venues.com/provinces/western-cape/red-sofa-cafe-vredehoek-i-know-this-great-little-coffee-shop/"]'
WHERE slug = 'red-sofa-cafe-vredehoek' AND description_enriched_at IS NULL;
