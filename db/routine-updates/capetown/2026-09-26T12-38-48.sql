UPDATE businesses
SET description = 'Asserum Electronics is a cellphone, tablet and computer specialist in Fish Hoek Town Square, selling and repairing iPhones, Android devices, iPads and computers, including cracked-screen repairs, and backing devices sold with a 24-month guarantee.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://textmap.co.za/3/43650", "https://www.thinklocal.co.za/biz/asserum-iphones-computers-fish-hoek", "https://www.aiyellow.com/asserum/"]'
WHERE slug = 'asserum-electronics-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cheyne''s Restaurant is an Asian-inspired eatery in Hout Bay serving Pacific Rim-influenced cuisine sourced from local suppliers, set around a Balinese-style garden used for both dining and cocktails.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g469392-d4737813-Reviews-Cheyne_s-Hout_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/cheynes1/", "https://thevillagehoutbay.co.za/cheynes/"]'
WHERE slug = 'cheynes-restaurant-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Collectables Hub & Cafe is an antiques and retro-memorabilia store combined with a cafe in Simon''s Town, stocking vintage clothing, toys, vinyl records, militaria and other collectables alongside coffee, sandwiches, wraps and light meals, with a deck overlooking Simon''s Town harbour.',
    description_enriched_at = datetime('now'),
    hours = 'Fri-Mon 10:00-17:00, Tue-Thu Closed',
    source_urls = '["https://www.capetownmagazine.com/collectables-hub", "https://www.tripadvisor.com/Restaurant_Review-g319718-d23888880-Reviews-Collectables_Hub_Cafe-Simon_s_Town_Western_Cape.html", "https://www.foodandhome.co.za/entertaining/its-a-thrifters-paradise-at-collectables-hub-and-cafe-in-simons-town"]'
WHERE slug = 'collectables-hub-and-cafe-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kukoma Coffee Co. is a specialty coffee roastery and cafe in Simon''s Town sourcing and roasting ethically traded Arabica beans from Rwanda, Uganda, Tanzania, Burundi and Ethiopia, with an on-site barista bar, fast Wi-Fi and home-brewing workshops.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-16:00, Sun 07:00-13:00',
    source_urls = '["https://www.capetownmagazine.com/kukoma", "https://kukomacoffee.com/", "https://www.facebook.com/Kukomacoffee/"]'
WHERE slug = 'kukoma-coffee-co-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mantelli''s Direct Fish Hoek is a privately owner-run factory-outlet store in the Valyland Centre selling Mantelli''s branded biscuits and bakery products, both retail and in bulk, at factory pricing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun 09:00-14:00',
    source_urls = '["https://mantellisdirect.com/fish-hoek", "https://www.southpeninsulamoms.co.za/business-directory/mantellis-direct-fish-hoek/", "https://mantellis.com/direct-stores"]'
WHERE slug = 'mantellis-direct-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Massimo''s is a family-run Italian restaurant at Oakhurst Farm Park in Hout Bay, known for thin-based wood-fired pizzas and a menu with vegetarian, vegan and gluten-free options, and named Best Pizzeria in Africa in 2019 and 2021.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g469392-d2100905-Reviews-Massimo_s-Hout_Bay_Western_Cape.html", "https://www.houtbaytourism.com/index.php/catalogue/eat/massimos-1-detail", "https://www.massimos.co.za/"]'
WHERE slug = 'massimos-hout-bay' AND description_enriched_at IS NULL;
