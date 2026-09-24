-- job 4: description enrichment sweep, batch of 4 (entire backlog)

UPDATE businesses
SET description = 'Infusion on Long is a restaurant, bar and lounge on Long Street offering an eclectic CBD-infused menu spanning Italian, Asian and street food influences, from breakfast items to burgers, tacos, sushi and desserts.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 10:30-23:00'
WHERE slug = 'infusion-on-long-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kluk CGDT is a Cape Town fashion label based in its own showroom and design studio on Bree Street, producing ready-to-wear, bridal and couture collections with a distinctive, colourful South African aesthetic.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://klukcgdt.com/contact/", "https://www.capetownccid.org/explore/shop/kluk-cgdt", "https://visi.co.za/inside-kluk-cgdt-boutique-bree-street/"]'
WHERE slug = 'kluk-cgdt-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Obi Restaurant is a Japanese restaurant on Long Street serving sushi, ramen and traditional Japanese dishes made with SASSI-certified fish, with lunch and dinner sittings from Tuesday to Saturday.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://obirestaurant.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d10523954-Reviews-or90-Obi-Cape_Town_Central_Western_Cape.html", "https://www.capetownmagazine.com/obi-restaurant"]'
WHERE slug = 'obi-restaurant-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rosetta Roastery is a specialty coffee roastery and cafe on the corner of Bree and Shortmarket Streets, roasting single-origin coffee and serving it in a work-friendly cafe setting in the Cape Town CBD.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-16:00, Sat 08:00-16:00, Sun & Public Holidays 08:00-14:00',
    source_urls = '["https://www.rosettaroastery.com/", "https://www.eatout.co.za/venue/rosetta-roastery-bree-street/", "https://www.rosettaroastery.com/pages/contact"]'
WHERE slug = 'rosetta-roastery-cape-town-cbd' AND description_enriched_at IS NULL;
