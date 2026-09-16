-- Starting suburb/area list for the City of Cape Town metro, sourced from
-- Wikipedia's "Suburbs of Cape Town" category (179 pages) and grouped into
-- 8 broad regions. This is data, not code -- adding more areas later is
-- just another INSERT, not a migration. Owner should review/correct this
-- list (names, spellings, which region each falls under) -- region
-- assignment for boundary-adjacent areas (e.g. Century City, Pinelands,
-- Retreat, Lavender Hill) was judgement-called, not sourced from an
-- official municipal ward map. Excludes Robben Island (heritage site, not
-- a conventional suburb with local businesses) and Tygerberg (a hill/area
-- name, not a specific suburb) from the source category, and the
-- category's own region-summary pages (Atlantic Seaboard, Cape Flats,
-- City Bowl, Helderberg, Northern Suburbs, Southern Peninsula, Southern
-- Suburbs, Blouberg) which aren't individual suburbs either. Several
-- Mitchells Plain and Bellville sub-areas are seeded as their own suburb
-- rows alongside their parent (Mitchells Plain, Bellville), matching how
-- Polokwane seeds Seshego's zones as their own suburbs too.
--
-- region 'city-bowl'          = the CBD and its immediate residential rim
-- region 'atlantic-seaboard'  = the coast from Mouille Point to Camps Bay
-- region 'southern-suburbs'   = inland south along the M3, Rondebosch-Tokai
-- region 'northern-suburbs'   = Bellville/Durbanville/Parow cluster, plus
--                                the Maitland/Paarden Eiland/Voortrekker
--                                Road industrial-fringe belt
-- region 'cape-flats'         = the flats east/south-east of the city
-- region 'west-coast'         = Table View/Blouberg/Milnerton, still metro
-- region 'south-peninsula'    = down the peninsula, Muizenberg to Scarborough
-- region 'helderberg'         = Somerset West/Strand/Macassar cluster

INSERT INTO suburbs (slug, name, region) VALUES
  -- city-bowl
  ('cape-town-cbd', 'Cape Town CBD', 'city-bowl'),
  ('gardens', 'Gardens', 'city-bowl'),
  ('tamboerskloof', 'Tamboerskloof', 'city-bowl'),
  ('oranjezicht', 'Oranjezicht', 'city-bowl'),
  ('vredehoek', 'Vredehoek', 'city-bowl'),
  ('zonnebloem', 'Zonnebloem', 'city-bowl'),
  ('woodstock', 'Woodstock', 'city-bowl'),
  ('observatory', 'Observatory', 'city-bowl'),
  ('salt-river', 'Salt River', 'city-bowl'),
  ('bo-kaap', 'Bo-Kaap', 'city-bowl'),
  ('de-waterkant', 'De Waterkant', 'city-bowl'),
  ('devils-peak-estate', "Devil's Peak Estate", 'city-bowl'),
  ('district-six', 'District Six', 'city-bowl'),
  ('higgovale', 'Higgovale', 'city-bowl'),
  ('university-estate', 'University Estate', 'city-bowl'),
  ('va-waterfront', 'V&A Waterfront', 'city-bowl'),
  ('walmer-estate', 'Walmer Estate', 'city-bowl'),

  -- atlantic-seaboard
  ('sea-point', 'Sea Point', 'atlantic-seaboard'),
  ('green-point', 'Green Point', 'atlantic-seaboard'),
  ('mouille-point', 'Mouille Point', 'atlantic-seaboard'),
  ('bantry-bay', 'Bantry Bay', 'atlantic-seaboard'),
  ('clifton', 'Clifton', 'atlantic-seaboard'),
  ('camps-bay', 'Camps Bay', 'atlantic-seaboard'),
  ('fresnaye', 'Fresnaye', 'atlantic-seaboard'),
  ('three-anchor-bay', 'Three Anchor Bay', 'atlantic-seaboard'),
  ('bakoven', 'Bakoven', 'atlantic-seaboard'),

  -- southern-suburbs
  ('rondebosch', 'Rondebosch', 'southern-suburbs'),
  ('rondebosch-east', 'Rondebosch East', 'southern-suburbs'),
  ('rosebank', 'Rosebank', 'southern-suburbs'),
  ('mowbray', 'Mowbray', 'southern-suburbs'),
  ('claremont', 'Claremont', 'southern-suburbs'),
  ('newlands', 'Newlands', 'southern-suburbs'),
  ('kenilworth', 'Kenilworth', 'southern-suburbs'),
  ('wynberg', 'Wynberg', 'southern-suburbs'),
  ('constantia', 'Constantia', 'southern-suburbs'),
  ('bishopscourt', 'Bishopscourt', 'southern-suburbs'),
  ('tokai', 'Tokai', 'southern-suburbs'),
  ('plumstead', 'Plumstead', 'southern-suburbs'),
  ('diep-river', 'Diep River', 'southern-suburbs'),
  ('bergvliet', 'Bergvliet', 'southern-suburbs'),
  ('kirstenhof', 'Kirstenhof', 'southern-suburbs'),
  ('meadowridge', 'Meadowridge', 'southern-suburbs'),
  ('dreyersdal', 'Dreyersdal', 'southern-suburbs'),
  ('harfield-village', 'Harfield Village', 'southern-suburbs'),
  ('heathfield', 'Heathfield', 'southern-suburbs'),
  ('kenwyn', 'Kenwyn', 'southern-suburbs'),
  ('southfield', 'Southfield', 'southern-suburbs'),

  -- northern-suburbs
  ('bellville', 'Bellville', 'northern-suburbs'),
  ('durbanville', 'Durbanville', 'northern-suburbs'),
  ('parow', 'Parow', 'northern-suburbs'),
  ('goodwood', 'Goodwood', 'northern-suburbs'),
  ('brackenfell', 'Brackenfell', 'northern-suburbs'),
  ('kraaifontein', 'Kraaifontein', 'northern-suburbs'),
  ('panorama', 'Panorama', 'northern-suburbs'),
  ('welgemoed', 'Welgemoed', 'northern-suburbs'),
  ('kuils-river', 'Kuils River', 'northern-suburbs'),
  ('edgemead', 'Edgemead', 'northern-suburbs'),
  ('bothasig', 'Bothasig', 'northern-suburbs'),
  ('boston', 'Boston', 'northern-suburbs'),
  ('eversdal', 'Eversdal', 'northern-suburbs'),
  ('kenridge', 'Kenridge', 'northern-suburbs'),
  ('stellenberg', 'Stellenberg', 'northern-suburbs'),
  ('maitland', 'Maitland', 'northern-suburbs'),
  ('paarden-eiland', 'Paarden Eiland', 'northern-suburbs'),
  ('ysterplaat', 'Ysterplaat', 'northern-suburbs'),
  ('rugby', 'Rugby', 'northern-suburbs'),
  ('thornton', 'Thornton', 'northern-suburbs'),
  ('epping', 'Epping', 'northern-suburbs'),
  ('ndabeni', 'Ndabeni', 'northern-suburbs'),
  ('brooklyn', 'Brooklyn', 'northern-suburbs'),
  ('century-city', 'Century City', 'northern-suburbs'),
  ('kensington', 'Kensington', 'northern-suburbs'),
  ('monte-vista', 'Monte Vista', 'northern-suburbs'),
  ('norwood', 'Norwood', 'northern-suburbs'),
  ('pinelands', 'Pinelands', 'northern-suburbs'),
  ('plattekloof', 'Plattekloof', 'northern-suburbs'),
  ('richwood', 'Richwood', 'northern-suburbs'),
  ('ruyterwacht', 'Ruyterwacht', 'northern-suburbs'),
  ('wallacedene', 'Wallacedene', 'northern-suburbs'),
  ('eerste-river', 'Eerste River', 'northern-suburbs'),

  -- cape-flats
  ('mitchells-plain', 'Mitchells Plain', 'cape-flats'),
  ('khayelitsha', 'Khayelitsha', 'cape-flats'),
  ('gugulethu', 'Gugulethu', 'cape-flats'),
  ('nyanga', 'Nyanga', 'cape-flats'),
  ('langa', 'Langa', 'cape-flats'),
  ('athlone', 'Athlone', 'cape-flats'),
  ('bonteheuwel', 'Bonteheuwel', 'cape-flats'),
  ('manenberg', 'Manenberg', 'cape-flats'),
  ('hanover-park', 'Hanover Park', 'cape-flats'),
  ('delft', 'Delft', 'cape-flats'),
  ('philippi', 'Philippi', 'cape-flats'),
  ('lansdowne', 'Lansdowne', 'cape-flats'),
  ('beacon-valley', 'Beacon Valley', 'cape-flats'),
  ('belhar', 'Belhar', 'cape-flats'),
  ('bishop-lavis', 'Bishop Lavis', 'cape-flats'),
  ('blikkiesdorp', 'Blikkiesdorp', 'cape-flats'),
  ('blue-downs', 'Blue Downs', 'cape-flats'),
  ('browns-farm', "Brown's Farm", 'cape-flats'),
  ('colorado', 'Colorado', 'cape-flats'),
  ('crawford', 'Crawford', 'cape-flats'),
  ('crossroads', 'Crossroads', 'cape-flats'),
  ('de-oude-weg', 'De Oude Weg', 'cape-flats'),
  ('eastridge', 'Eastridge', 'cape-flats'),
  ('elsies-river', "Elsie's River", 'cape-flats'),
  ('grassy-park', 'Grassy Park', 'cape-flats'),
  ('heideveld', 'Heideveld', 'cape-flats'),
  ('joe-slovo', 'Joe Slovo', 'cape-flats'),
  ('lavender-hill', 'Lavender Hill', 'cape-flats'),
  ('lentegeur', 'Lentegeur', 'cape-flats'),
  ('lotus-river', 'Lotus River', 'cape-flats'),
  ('mandalay', 'Mandalay', 'cape-flats'),
  ('mandela-park', 'Mandela Park', 'cape-flats'),
  ('matroosfontein', 'Matroosfontein', 'cape-flats'),
  ('ottery', 'Ottery', 'cape-flats'),
  ('philippi-horticultural', 'Philippi Horticultural Area', 'cape-flats'),
  ('portland', 'Portland', 'cape-flats'),
  ('qq-section', 'QQ Section', 'cape-flats'),
  ('retreat', 'Retreat', 'cape-flats'),
  ('rocklands', 'Rocklands', 'cape-flats'),
  ('steenberg', 'Steenberg', 'cape-flats'),
  ('strandfontein', 'Strandfontein', 'cape-flats'),
  ('tafelsig', 'Tafelsig', 'cape-flats'),
  ('westgate', 'Westgate', 'cape-flats'),
  ('westridge', 'Westridge', 'cape-flats'),
  ('wetton', 'Wetton', 'cape-flats'),
  ('woodlands', 'Woodlands', 'cape-flats'),

  -- west-coast
  ('table-view', 'Table View', 'west-coast'),
  ('bloubergstrand', 'Bloubergstrand', 'west-coast'),
  ('milnerton', 'Milnerton', 'west-coast'),
  ('melkbosstrand', 'Melkbosstrand', 'west-coast'),
  ('parklands', 'Parklands', 'west-coast'),
  ('dunoon', 'Dunoon', 'west-coast'),
  ('joe-slovo-park', 'Joe Slovo Park', 'west-coast'),
  ('killarney-gardens', 'Killarney Gardens', 'west-coast'),
  ('montague-gardens', 'Montague Gardens', 'west-coast'),
  ('summer-greens', 'Summer Greens', 'west-coast'),

  -- south-peninsula
  ('muizenberg', 'Muizenberg', 'south-peninsula'),
  ('fish-hoek', 'Fish Hoek', 'south-peninsula'),
  ('simons-town', "Simon's Town", 'south-peninsula'),
  ('hout-bay', 'Hout Bay', 'south-peninsula'),
  ('noordhoek', 'Noordhoek', 'south-peninsula'),
  ('kommetjie', 'Kommetjie', 'south-peninsula'),
  ('kalk-bay', 'Kalk Bay', 'south-peninsula'),
  ('capri-village', 'Capri Village', 'south-peninsula'),
  ('clovelly', 'Clovelly', 'south-peninsula'),
  ('dennendal', 'Dennendal', 'south-peninsula'),
  ('glencairn', 'Glencairn', 'south-peninsula'),
  ('hangberg', 'Hangberg', 'south-peninsula'),
  ('imizamo-yethu', 'Imizamo Yethu', 'south-peninsula'),
  ('lakeside', 'Lakeside', 'south-peninsula'),
  ('llandudno', 'Llandudno', 'south-peninsula'),
  ('marina-da-gama', 'Marina da Gama', 'south-peninsula'),
  ('masiphumelele', 'Masiphumelele', 'south-peninsula'),
  ('ocean-view', 'Ocean View', 'south-peninsula'),
  ('scarborough', 'Scarborough', 'south-peninsula'),
  ('st-james', 'St James', 'south-peninsula'),
  ('sun-valley', 'Sun Valley', 'south-peninsula'),
  ('sunnydale', 'Sunnydale', 'south-peninsula'),
  ('westlake', 'Westlake', 'south-peninsula'),
  ('da-gama-park', 'Da Gama Park', 'south-peninsula'),

  -- helderberg
  ('somerset-west', 'Somerset West', 'helderberg'),
  ('strand', 'Strand', 'helderberg'),
  ('gordons-bay', "Gordon's Bay", 'helderberg'),
  ('croydon', 'Croydon', 'helderberg'),
  ('faure', 'Faure', 'helderberg'),
  ('firgrove', 'Firgrove', 'helderberg'),
  ('lwandle', 'Lwandle', 'helderberg'),
  ('macassar', 'Macassar', 'helderberg');
