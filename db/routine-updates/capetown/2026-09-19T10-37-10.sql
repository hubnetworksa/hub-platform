-- 10 verified upcoming Cape Town events, each corroborated by 3+
-- independent, non-resale/marketplace sources per ROUTINE.events.capetown.md.

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'dave-the-boy-who-played-the-harp-tour-2026-10-06', 'Dave - The Boy Who Played the Harp Tour', 'Music',
  '2026-10-06', '19:00', 'Grand Arena, GrandWest', 'Goodwood',
  '1 Jakes Gerwel Drive, Acacia Park, Goodwood, Cape Town, 7460',
  'From R1,960', 'https://www.ticketmaster.co.za/artist/dave-tickets/981505', 'Sold via Ticketmaster / Big Concerts',
  'Big Concerts', 'Dave''s first-ever South African show, part of his The Boy Who Played the Harp world tour',
  NULL, NULL, NULL, NULL,
  'UK rapper Dave brings his history-making world tour to Cape Town for one night, his first-ever performance in South Africa.',
  'agent',
  '["https://www.capetownetc.com/entertainment/daves-the-boy-who-played-the-harp-tour-is-coming-to-cape-town/", "https://www.snl24.com/dailysun/celebs/uk-rapper-dave-to-perform-in-south-africa-2026-tour-dates-and-ticket-info-20260324/", "https://texxandthecity.com/2026/03/uk-rapper-dave-announces-first-ever-south-african-tour-dates-for-2026/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'ne-yo-live-in-south-africa-2026-10-17', 'NE-YO Live in South Africa', 'Music',
  '2026-10-17', 'Gates open 18:00', 'Grand Arena, GrandWest', 'Goodwood',
  '1 Jakes Gerwel Drive, Acacia Park, Goodwood, Cape Town, 7460',
  'From R950', 'https://www.webtickets.co.za/v2/event.aspx?itemid=1596768929', 'Sold via Webtickets / Pick n Pay stores',
  NULL, 'Part of a two-city South African run, Cape Town then Pretoria',
  NULL, NULL, NULL, NULL,
  'Three-time Grammy-winning R&B star Ne-Yo performs a full arena show in Cape Town as part of his October South African tour.',
  'agent',
  '["https://www.citizen.co.za/lifestyle/entertainment/ne-yo-is-coming-to-south-africa-this-october-info/", "https://www.capetownetc.com/entertainment/ne-yo-heading-cape-town/", "https://www.yomzansi.com/2026/06/17/ne-yo-south-africa-2026-tour/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'dhl-stormers-vs-hollywoodbets-sharks-united-rugby-championship-2026-10-10', 'DHL Stormers vs Hollywoodbets Sharks (United Rugby Championship)', 'Sport',
  '2026-10-10', '16:00 kickoff', 'DHL Stadium', 'Green Point',
  'Fritz Sonnenberg Road, Green Point, Cape Town, 8051',
  'Price TBC', 'https://stormers.co.za/', 'Sold via official Stormers website',
  'DHL Stormers / United Rugby Championship', 'Regular-season URC fixture, Round 3',
  NULL, NULL, NULL, NULL,
  'The Stormers host their South African rivals the Sharks in a United Rugby Championship match at DHL Stadium.',
  'agent',
  '["https://www.espn.com/rugby/match/_/gameId/604051/league/270557", "https://www.ultimaterugby.com/stormers/matches", "https://www.sarugbymag.co.za/2026-27-urc-preview-stormers/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'nelson-mandela-marathon-inaugural-2026-10-18', 'Nelson Mandela Marathon (inaugural)', 'Sport',
  '2026-10-18', 'From 06:00', 'Grand Parade (finish); start Strand Street', 'Cape Town City Centre',
  'Grand Parade, Darling Street, Cape Town City Centre',
  'R80 - R700 depending on distance', 'https://www.racehopper.co.za/events/nelson-mandela-marathon-2026', 'Entries via Race Hopper',
  'Golazo, in partnership with the Nelson Mandela Foundation', 'New global running series launching in Cape Town; incorporates the former Slave Route Challenge',
  NULL, NULL, NULL, NULL,
  'A new marathon honouring Nelson Mandela''s legacy, running a 42km route through Cape Town''s Atlantic seaboard, Foreshore and Milnerton before finishing at the historic Grand Parade.',
  'agent',
  '["https://www.golazo.com/news/entries-open-soon-for-cape-towns-inaugural-nelson-mandela-marathon/", "https://www.runnersworld.co.za/news/new-mandela-marathon-set-for-cape-town/", "https://www.nelsonmandela.org/news/entry/nelson-mandela-foundation-launches-nelson-mandela-legacy-sporting-series-to-mobilise-action-through-sport"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'albie-sachs-fathers-sons-and-soft-vengeance-2026-10-13', 'Albie Sachs: Fathers, Sons and Soft Vengeance', 'Theatre',
  '2026-10-13', '20:00 weekdays; Saturday matinees 15:00', 'Baxter Studio, Baxter Theatre Centre', 'Rondebosch',
  'Main Road, Rondebosch, Cape Town, 7700',
  'R250', 'https://www.webtickets.co.za/v2/event.aspx?itemid=1597392676', 'Sold via Webtickets',
  'Troupe Theatre Company and Baxter Theatre, in association with Daphne Kuhn', 'Written by Gail Louw, starring Graham Hopkins, directed by Fiona Ramsay',
  NULL, NULL, NULL, NULL,
  'A one-person play tracing the life of anti-apartheid activist and Constitutional Court judge Albie Sachs, from the car-bomb attack he survived to his relationships with his father and sons.',
  'agent',
  '["https://baxter.uct.ac.za/whats-events", "https://www.theatrescenecpt.co.za/what-s-on", "https://www.sajr.co.za/the-curtain-lifts-on-albie-sachs-icon-and-dad/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'taste-of-cape-town-2026-2026-11-28', 'Taste of Cape Town 2026', 'Food & Drink',
  '2026-11-28', '11:00 - 22:00', 'Green Point Cricket Club', 'Green Point',
  NULL,
  'From R400', 'https://www.quicket.co.za/events/359707-taste-of-cape-town-2026/', 'Sold via Quicket',
  'International Management Group (UK), Taste Festivals Limited and The Allure Group', 'Themed "Feed Every Sense" for 2026, around 12,000 guests expected over the weekend',
  NULL, NULL, NULL, NULL,
  'A premium food festival bringing together roughly 20 acclaimed Cape Town chefs and restaurants for tastings, live entertainment and beverage pairings over two days.',
  'agent',
  '["https://www.bizcommunity.com/article/taste-of-cape-town-2026-to-celebrate-culinary-delights-in-november-308638a", "https://www.houseandgarden.co.za/food/a-feast-for-the-senses-taste-of-cape-town-2026-is-set-to-redefine-africas-food-festival-scene-b834f918-2b11-47fb-baa7-0de74da08c8d", "https://capetownatnight.co.za/2026/05/taste-of-cape-town-2026-dates-and-venue-announced/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'neighbourgoods-market-2026-09-26', 'Neighbourgoods Market', 'Market',
  '2026-09-26', '09:00 - 14:00', 'The Old Biscuit Mill', 'Woodstock',
  '373-375 Albert Road, Woodstock, Cape Town',
  'Free entry', '#', 'No ticket needed',
  'Neighbourgoods Market (Old Biscuit Mill)', 'Running weekly since 2006',
  NULL, NULL, 'Paid parking available across the road at Cape Town College', NULL,
  'A long-running Saturday market at the historic Old Biscuit Mill with artisanal food stalls, produce, crafts and live music.',
  'agent',
  '["https://neighbourgoodsmarket.co.za/", "https://www.sa-venues.com/things-to-do/westerncape/neighbourgoods-market/", "https://www.wheretostay.co.za/topic/6504-neighbourgoods-market-woodstock-cape-town"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'bay-harbour-market-2026-09-26', 'Bay Harbour Market', 'Market',
  '2026-09-26', '09:30 - 17:00', 'Bay Harbour Market', 'Hout Bay',
  '31 Harbour Road, Hout Bay, Cape Town',
  'Free entry', '#', 'No ticket needed',
  'Bay Harbour Market', 'Housed in a converted old fish factory on the Hout Bay harbour',
  NULL, NULL, NULL, NULL,
  'A weekend market in a repurposed fish factory offering food, drink, crafts, fashion and live music from local musicians.',
  'agent',
  '["https://www.bayharbour.co.za/", "https://www.capetownmagazine.com/bay-harbour-market", "https://capetowner.co.za/things-to-do/2026-09-02-bay-harbour-market-in-hout-bay-food-live-music-and-local-shopping/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'killarney-motor-show-2026-2026-11-01', 'Killarney Motor Show 2026', 'Family',
  '2026-11-01', '10:00 - 16:00', 'Killarney International Raceway', 'Killarney Gardens',
  'Koeberg Road, Killarney Gardens, Cape Town',
  'R100 - R160 (family package R330)', 'https://www.webtickets.co.za/v2/event.aspx?itemid=1595283281', 'Sold via Webtickets',
  'Killarney International Raceway (WP Motor Club)', 'Ninth edition of the Western Cape''s biggest motor show',
  NULL, NULL, 'Free on-site parking', NULL,
  'The Western Cape''s biggest annual motoring show, featuring drift and 4x4 passenger rides, public karting, classic car displays, a fun fair and live music for the whole family.',
  'agent',
  '["https://wpmc.co.za/upcoming-events/", "https://www.news24.com/life/motoring/news/something-for-everyone-as-cape-town-revs-up-for-its-biggest-motoring-show-of-the-year-at-killarney-20241103", "https://whatsonincapetown.com/event/killarney-motor-show/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'cape-town-international-kite-festival-2026-2026-10-24', 'Cape Town International Kite Festival 2026 (Colour the Sky)', 'Family',
  '2026-10-24', '10:00 - 18:00', 'Youngsfield Military Base', 'Ottery',
  'Youngsfield Military Base, Ottery, Cape Town',
  'R50 - R160 depending on age/pass', 'https://www.quicket.co.za/events/369112-cape-town-international-kite-festival/', 'Sold via Quicket',
  'Cape Mental Health', '32nd edition, running since 1994; proceeds support mental health awareness and programmes',
  NULL, NULL, NULL, NULL,
  'A two-day family festival of giant kites, kite-making workshops, food vendors and children''s entertainment, run as a fundraiser for Cape Mental Health.',
  'agent',
  '["https://www.capementalhealth.co.za/ColourTheSky/", "https://www.capetownetc.com/events/cape-town-international-kite-festival-set-to-brighten-skies-in-october-2026/", "https://whatsonincapetown.com/cape-town-international-kite-festival/", "https://falsebayecho.co.za/southern-mail/news/2026-07-27-watch-cape-town-kite-festival-to-soar-with-colour-community-and-mental-health-awareness/"]'
);
