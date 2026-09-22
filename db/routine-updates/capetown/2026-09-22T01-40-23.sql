-- Job 4: description enrichment sweep, batch 1 (10 records)
UPDATE businesses
SET description = 'Aiyara Thai Restaurant is an authentic Thai restaurant tucked away in Little Mowbray, serving dishes such as Pad Thai, chicken with cashew nut, and fried kingklip in a relaxed dining room.',
    description_enriched_at = datetime('now')
WHERE slug = 'aiyara-thai-restaurant-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Alta Bay is a boutique guesthouse in Higgovale set on the slopes of Table Mountain, with six individually designed rooms, mountain and sea views, and on-site spa treatments and dining for guests.',
    description_enriched_at = datetime('now')
WHERE slug = 'alta-bay-higgovale' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Aneesa''s Take-Aways is a Cape Malay-inspired takeaway in Wynberg dating back to 1976, known for its gatsbys, curries and signature Vienna-and-chips parcels.',
    description_enriched_at = datetime('now')
WHERE slug = 'aneesas-take-aways-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Arlecchino by tashas is a Mediterranean-inspired restaurant in Sea Point from the Tashas Group, with a 1970s-style interior and a menu spanning breakfast through dinner, including seafood dishes such as Bazaruto prawns and whole grilled branzino.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-23:00'
WHERE slug = 'arlecchino-by-tashas-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'B74 is a bar and bistro in Mowbray with two bars and a relaxed courtyard braai area, known for its mussels, curly fries and chicken wings.',
    description_enriched_at = datetime('now')
WHERE slug = 'b74-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bare Necessity is a boutique in Dean Street Arcade, Newlands, selling sleepwear, home accessories and gifts, including body-care products from Charlotte Rhys.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:45',
    source_urls = '["https://opening-hours.co.za/03984294/Bare_Necessity,_Dean_Street_Arcade,_Newlands", "https://business-service-directory.com/za/listing/bare-necessity-18515", "https://deanstreetarcade.co.za/stores/"]'
WHERE slug = 'bare-necessity-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Beau Constantia is a wine estate in the Constantia Valley with vineyard and mountain views, home to the Chefs Warehouse restaurant, which serves a seasonal tasting menu of bold, well-travelled dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Lunch Mon-Sun 12:00-14:00, Dinner Mon-Sat 18:30-20:00',
    source_urls = '["https://constantiawineroute.com/beau-constantia/", "https://www.beauconstantia.com/", "https://www.beauconstantia.com/contact/", "https://www.beauconstantia.com/eat/"]'
WHERE slug = 'beau-constantia-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Best of Asia is a pan-Asian restaurant in Green Point offering dishes spanning Thai curries, Chinese classics and sushi, with vegetarian options and wheelchair access.',
    description_enriched_at = datetime('now')
WHERE slug = 'best-of-asia-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bishopsgrace is a boutique guest house in Bishopscourt on the eastern slopes of Table Mountain, offering nine individually decorated suites, two swimming pools and a floodlit tennis court, a short walk from Kirstenbosch National Botanical Garden.',
    description_enriched_at = datetime('now')
WHERE slug = 'bishopsgrace-bishopscourt' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bobo''s Brasserie is a brasserie on the Mouille Point promenade with Atlantic Ocean and Robben Island views, serving French-inspired comfort food such as steak frites, seafood and gourmet burgers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:30',
    source_urls = '["https://www.eatout.co.za/venue/bobos-brasserie/", "https://crushmag-online.com/bobos-brasserie-mouille-point/", "https://www.restaurants.co.za/bobos"]'
WHERE slug = 'bobos-brasserie-mouille-point' AND description_enriched_at IS NULL;
