UPDATE businesses
SET description = 'AirCare is an appliance repair specialist in Flora Park, servicing fridges and freezers along with general electrical and refrigeration maintenance, with technicians able to travel to customers.',
    description_enriched_at = datetime('now')
WHERE slug = 'aircare-flora-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'All Seasons Function Hire is an event and tent hire company in Futura, supplying marquee and waterproof stretch tents with full setup, arrangement and dismantling of chairs, tables and staging, plus furniture, decor and mobile toilet hire for functions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://allseasonsfunctionhire.co.za/contact/", "https://www.thinklocal.co.za/biz/all-seasons-function-hire-polokwane", "https://allseasonsfunctionhire.co.za/about/"]'
WHERE slug = 'all-seasons-function-hire-futura' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'BHL&J Steel Services is a family-owned fencing and structural steel business in Ladine, established in 1990, specialising in palisade, clear-view, wire and game/farm fencing as well as structural steel supply, with an in-house fabrication facility for cutting, welding, drilling and punching.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:30'
WHERE slug = 'bhlj-steel-services-ladine' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bakone Malapa is a reconstructed open-air cultural village near Polokwane depicting traditional Northern Sotho life from roughly 250 years ago, with demonstrations of fire-making, maize grinding, beer brewing, pottery, wood carving, beadwork and basket weaving.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/attractionslm/bakone-malapa.php", "https://triptap.com/places/za/limpopo/polokwane/bakone-malapa-open-air-museum-t06117db", "https://sahistory.org.za/place/bakone-malapa-northern-sotho-open-air-museum-polokwane"]'
WHERE slug = 'bakone-malapa-open-air-museum-chuenespoort' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bona Manzi Water Drilling is a borehole drilling company based in Ladanna serving Polokwane and the wider region, offering services from drilling through to pump installation and water tank/stand erection, using geophysical and hydrological methods rather than geological survey equipment to locate water.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://bonamanzidrilling.co.za/", "https://za.polomap.com/polokwane/13340", "https://www.citizen.co.za/review-online/news-headlines/2017/02/16/bona-manzi-water-drilling-celebrates-32-years-of-servicing-limpopo/"]'
WHERE slug = 'bona-manzi-water-drilling-ladanna' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Christ Baptist Church is a multi-ethnic, English-speaking Baptist congregation in Flora Park that has served Polokwane since 1961, originally established as Pietersburg Baptist Church.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 08:00-12:00, office Mon-Fri 07:00-15:00'
WHERE slug = 'christ-baptist-church-flora-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fridge Repairs is a fridge and refrigeration repair service based in Polokwane Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'fridge-repairs-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Masjid-ul-Firdaus is a Sunni mosque in Nirvana serving Polokwane''s Muslim community as a place of worship and community gathering.',
    description_enriched_at = datetime('now')
WHERE slug = 'masjid-ul-firdaus-nirvana' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moseki Function Hire & Catering is an event decor, catering and function management company based in Polokwane Central, providing services for functions across the country.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-19:00, Sun Closed',
    source_urls = '["https://www.mosekifunctionhire.co.za/Contacts/", "https://polokwane.infoisinfo.co.za/card/moseki-function-hire-catering/325793", "https://www.shopshours.co.za/moseki-function-hire-catering/polokwane/c-57f3ca0f47d677c3b27ae885"]'
WHERE slug = 'moseki-function-hire-catering-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mt Horeb Presbyterian Church is a Presbyterian congregation based in Polokwane Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'mt-horeb-presbyterian-church-polokwane-central' AND description_enriched_at IS NULL;
