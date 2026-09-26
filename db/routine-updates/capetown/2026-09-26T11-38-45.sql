-- Job 4: description enrichment sweep (batch of 6, clears the entire current backlog)
UPDATE businesses
SET description = 'CES Forklift is the South African importing and marketing agent for LiuGong forklifts, operating from its head office in Montague Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00',
    source_urls = '["https://cesforklift.co.za/", "https://vymaps.com/ZA/CES-Forklift-642697659174218/", "https://opening-hours.co.za/0686310/CES_Forklift"]'
WHERE slug = 'ces-forklift-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Intellisec is a turnkey supplier of intelligent site management systems -- including CCTV, access control, fire detection and electric fencing -- installed and maintained by its own certified technicians, with a Cape Town office in Montague Gardens.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yellosa.co.za/company/962670/intellisec", "https://www.bestdirectory.co.za/intellisec-cape-town-installation-and-service-fire-and-security-in-montague-gardens-cape-town-western-cape.html", "https://intellisec.co.za/"]'
WHERE slug = 'intellisec-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Joon is a Mediterranean restaurant in Muizenberg serving Italian-style pizzas alongside breakfast, lunch and dinner menus, including a mezze platter, with options for vegans, vegetarians and carnivores alike.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Fri 11:00-22:00, Sat 09:00-22:00, Sun 09:00-14:00',
    source_urls = '["https://www.joonrestaurant.com/", "https://za.africabz.com/western-cape/joon-67449", "https://www.dining-out.co.za/restaurant-menu.aspx?MemberID=8849&SiteVersion=desktop"]'
WHERE slug = 'joon-restaurant-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Monster Plumbing is a Cape Town plumbing company originally established in 1995, offering geyser installation, burst pipe repairs, bathroom and kitchen renovation plumbing, and leak detection and drain cleaning services across the greater Cape Town area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://monsterplumbing.co.za/contact/", "https://nearbyza.com/place/monster-plumbing", "https://monsterplumbing.co.za/about/"]'
WHERE slug = 'monster-plumbing-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Montague Gardens is a courier, printing and postal services outlet located within the John Montague Centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'postnet-montague-gardens-montague-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Commons is a cafe, bar and cultural hub at Surfers Corner in Muizenberg, hosting live music and yoga classes alongside a vinyl and bookstore.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Sun 08:00-23:00',
    source_urls = '["https://thecommons.co.za/", "https://za.africabz.com/western-cape/the-commons-310909", "https://www.capetownmagazine.com/the-commons"]'
WHERE slug = 'the-commons-muizenberg' AND description_enriched_at IS NULL;
