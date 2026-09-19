-- Job 4: description enrichment sweep, batch 1 of 2 (10 businesses)
UPDATE businesses
SET description = 'Groot Constantia, founded in 1685, is South Africa''s oldest wine estate and a national heritage site in Constantia, restored to its original Cape Dutch architecture after a 1925 fire; it operates today as a working wine farm with a cellar and museum open to visitors.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://grootconstantia.co.za/contact-us/", "https://constantiawineroute.com/groot-constantia/", "https://en.wikipedia.org/wiki/Groot_Constantia"]'
WHERE slug = 'groot-constantia-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'H&M is an international fashion retailer offering on-trend clothing, accessories and homeware for women, men and children, with a large-format store in the Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'hm-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'HCI (Hosken Consolidated Investments) is a JSE-listed investment holding company with interests spanning hotels and leisure, gaming, media and broadcasting, transport, and mining and property, headquartered in Sea Point.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://thepointmall.co.za/", "https://www.hci.co.za/contact-us/", "https://en.wikipedia.org/wiki/Hosken_Consolidated_Investments"]'
WHERE slug = 'hci-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair Studio in Rondebosch East offers a full range of hairdressing services including cutting, colouring, balayage, keratin treatments and hair extensions, alongside a nail bar and facials.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lp/en/bt/hair-salons/in/za-cape-town/rondebosch-east", "https://za.africabz.com/western-cape/hair-studio-59047", "https://beautycafe.co.za/hairstudio-rondebosch/"]'
WHERE slug = 'hair-studio-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hard Rock Cafe Cape Town is part of the global Hard Rock chain, serving burgers and American classics with vegetarian, vegan and gluten-free options in a music-themed setting overlooking the Camps Bay beachfront, inside The Promenade.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 12:00-00:00, Fri-Sat 12:00-01:00'
WHERE slug = 'hard-rock-cafe-cape-town-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hartlief Gourmet is a German delicatessen and eatery in the Gardens Shopping Centre, offering continental deli meats, salamis and sausages alongside coffee and light meals, for sit-down or takeaway.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://hartlief.co.za/visit-us/gardens-deli", "https://za.africabz.com/western-cape/hartlief-deli-gardens-8384", "https://www.eatout.co.za/venue/hartlief-deli-gardens/"]'
WHERE slug = 'hartlief-gourmet-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Healthpoint is a general medical practice inside The Point in Sea Point, offering family medicine alongside aesthetics, radiography and travel medicine services.',
    description_enriched_at = datetime('now')
WHERE slug = 'healthpoint-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hello Indigo Halo is a crystal and gift shop inside The Old Biscuit Mill, stocking raw and polished crystals, jewellery, tarot cards and spiritual tools such as singing bowls and smudge sticks.',
    description_enriched_at = datetime('now')
WHERE slug = 'hello-indigo-halo-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Heroes is a fashion and footwear retailer with a store in the Golden Acre Shopping Centre in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'heroes-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'High Street Lingerie is a lingerie boutique inside the Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'high-street-lingerie-de-waterkant' AND description_enriched_at IS NULL;
