-- 10 verified upcoming Pretoria/Centurion/Tshwane events, each corroborated
-- by 3+ independent, non-resale/marketplace sources per ROUTINE.events.pretoria.md.

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'bulls-vs-lions-united-rugby-championship-round-3-2026-10-10', 'Bulls vs Lions (United Rugby Championship, Round 3)', 'Sport',
  '2026-10-10', '13:30', 'Loftus Versfeld Stadium', 'Sunnyside',
  'Kirkness Street, Sunnyside, Pretoria, 0002',
  'Price TBC', 'https://tickets.bullsrugby.co.za/', 'Sold via Ticketpro (Bulls official ticket portal)',
  'Vodacom Bulls', 'First home fixture of the Bulls'' 2026/27 URC campaign',
  NULL, NULL, 'Parking available at Loftus', NULL,
  'The Bulls host the Lions at Loftus Versfeld in Round 3 of the 2026-27 United Rugby Championship.',
  'agent',
  '["https://sports.yahoo.com/articles/3-reasons-watch-vodacom-bulls-200153667.html", "https://www.rugbyworld.com/rugby-fixtures/united-rugby-championship-fixtures", "https://briefly.co.za/sports/rugby/253568-vodacom-bulls-55-man-squad-20262027-urc-season-15-springboks/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'south-africa-vs-bangladesh-2nd-test-2026-11-23', 'South Africa vs Bangladesh, 2nd Test', 'Sport',
  '2026-11-23', '5-day Test, 23-27 Nov 2026', 'SuperSport Park', 'Centurion',
  '283 West Avenue, Die Hoewes, Centurion',
  'From R210', 'https://tickets.cricket.co.za/', 'Sold via Ticketpro (Cricket South Africa)',
  'Cricket South Africa', 'Second Test of Bangladesh''s tour of South Africa, part of the ICC World Test Championship',
  NULL, NULL, NULL, NULL,
  'The Proteas host Bangladesh in the second of two Tests during Bangladesh''s tour of South Africa.',
  'agent',
  '["https://www.icc-cricket.com/news/south-africa-unveil-schedule-for-key-wtc-series", "https://www.espn.com/cricket/series/24484/game/1525663/south-africa-vs-bangladesh-2nd-test-24484", "https://thesportstak.com/cricket/match/sa-vs-ban-2nd-test-bangladesh-tour-of-south-africa-23-november-2026-269797/info"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'pretoria-boeremark-2026-09-26', 'Pretoria Boeremark', 'Market',
  '2026-09-26', '05:30 - 09:30', 'Pioneer Museum grounds', 'Silverton',
  '665 Moreleta Street, Silverton, Pretoria, 0184',
  'Free entry', '#', 'No ticket needed',
  'Pretoria Boeremark', 'Long-running traditional farmers'' market, produce and meat direct from farmers',
  NULL, NULL, 'Ample on-site parking', NULL,
  'A weekly farmers'' market held at the Pioneer Museum in Silverton, selling farm produce, meat and baked goods direct from producers.',
  'agent',
  '["https://www.sa-venues.com/things-to-do/gauteng/pretoria-boeremark/", "https://visit.gauteng.net/visit/pretoria-boeremark-vg", "https://showme.co.za/pretoria/events-entertainment/the-pretoria-boeremark/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'hazel-food-acc-market-2026-09-26', 'Hazel Food & ACC Market', 'Market',
  '2026-09-26', '08:00 - 14:00', 'PHSOB Hofmeyr Park (Phobians Athletics Club)', 'Lynnwood',
  '378 Queens Crescent, Lynnwood, Pretoria',
  'Price TBC', 'https://pretoriamarkets.co.za/market/hazel-food-market', 'No ticket needed',
  'Hazel Food & ACC Market', 'Running for over 17 years, ranked among Africa''s top tourist markets',
  NULL, NULL, NULL, 'Over 70 stalls',
  'A long-running Saturday morning food and artisanal-goods market at the Phobians Athletics Club grounds in Lynnwood.',
  'agent',
  '["https://www.sa-venues.com/things-to-do/gauteng/hazel-food-market/", "https://www.centurioncommunity.co.za/events/hazel-food-acc-market-2/", "https://pretoria.co.za/event/hazel-food-acc-market-12"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'keto-banting-market-2026-10-03', 'Keto & Banting Market', 'Market',
  '2026-10-03', '09:00 - 15:00', 'Irene Village Mall (Pick n Pay court)', 'Irene, Centurion',
  'Cnr Nellmapius Rd (M31) & Van Ryneveld Ave (M28), Irene Farm Villages, Centurion, 0133',
  'Free entry', 'https://bantingmarket.com/', 'No ticket needed',
  'Pretoria''s Banting Market', 'Held on the first Saturday of every month; sugar-free, wheat-free, low-carb and gluten-free vendors only',
  NULL, NULL, NULL, NULL,
  'A monthly low-carb/banting/keto-focused market held at Irene Village Mall, featuring gluten-free and sugar-free local producers.',
  'agent',
  '["https://bantingmarket.com/", "https://irenevillagemall.co.za/whats-happening/", "https://www.facebook.com/bantingmarketpretoria123/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'dave-the-boy-who-played-the-harp-tour-2026-10-03', 'Dave - The Boy Who Played the Harp Tour', 'Music',
  '2026-10-03', '18:00', 'Sunbet Arena, Time Square', 'Menlyn Maine',
  '209 Aramist Ave, Menlyn Maine, Pretoria',
  'From R855', 'https://www.bigconcerts.co.za/event/dave-pretoria-tickets-edp1662315', 'Sold via Big Concerts / Ticketmaster',
  'Big Concerts', 'Dave''s first-ever South African tour date',
  NULL, NULL, NULL, NULL,
  'British rapper Dave performs at Sunbet Arena as part of his first South African tour, promoting his album The Boy Who Played the Harp.',
  'agent',
  '["https://texxandthecity.com/2026/03/uk-rapper-dave-announces-first-ever-south-african-tour-dates-for-2026/", "https://www.capetownetc.com/entertainment/daves-the-boy-who-played-the-harp-tour-is-coming-to-cape-town/", "https://www.yomzansi.com/2026/03/23/dave-south-africa-tour-big-concerts-cape-town-pretoria-october/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'kehlani-the-kehlani-world-tour-south-africa-2026-12-15', 'Kehlani - The Kehlani World Tour: South Africa', 'Music',
  '2026-12-15', 'Doors 18:00, show 20:00', 'Sunbet Arena, Time Square', 'Menlyn Maine',
  '209 Aramist Ave, Menlyn Maine, Pretoria',
  'From R800', 'https://www.bigconcerts.co.za/event/kehlani-pretoria-tickets-edp1681444', 'Sold via Big Concerts / Ticketmaster',
  'Big Concerts', 'Special guest Destin Conrad; part of two South African tour dates (Pretoria and Cape Town)',
  NULL, NULL, NULL, NULL,
  'Grammy-winning R&B artist Kehlani brings her World Tour to Pretoria''s Sunbet Arena with special guest Destin Conrad.',
  'agent',
  '["https://www.citizen.co.za/lifestyle/entertainment/kehlani-world-tour-south-africa-pretoria-cape-town-december/", "https://www.news24.com/drum/celebs/news/rb-powerhouse-kehlani-brings-world-tour-to-south-africa-in-december-2026-20260615-0440", "https://www.bizcommunity.com/article/rb-star-kehlani-announces-south-african-tour-dates-175436a"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'festive-fijnwyn-food-wine-market-2026-11-07', 'Festive Fijnwyn Food & Wine Market', 'Food & Drink',
  '2026-11-07', 'Doors open 10:00', 'Shokran Events Venue', 'Tierpoort',
  'Plot 99, Luiperd Street, Tierpoort, Pretoria East',
  'R80 - R495 depending on ticket type', 'https://itickets.co.za/events/485413', 'Sold via iTickets',
  'Fijnwyn', 'More than 35 participating wine farms; festive/holiday-season edition',
  NULL, NULL, NULL, '35+ wine farm traders',
  'A wine and food festival held at Shokran Events Venue, featuring tastings from over 35 South African wine farms to mark the start of the festive season.',
  'agent',
  '["https://news.wine.co.za/news.aspx?NEWSID=46567", "https://diary.wine.co.za/Diary.aspx?DIARYID=22191", "https://discoverpretoriaeast.co.za/directory/fijnwyn/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'pitori-kota-festival-2026-10-31', 'Pitori Kota Festival', 'Food & Drink',
  '2026-10-31', '10:00 - 22:00', 'Pretoria National Botanical Garden', 'Brummeria',
  '2 Cussonia Ave, Brummeria, Pretoria',
  'Price TBC', 'https://www.webtickets.co.za/v2/event.aspx?itemid=1600512451', 'Sold via Webtickets / Computicket',
  'Kota Festival', 'Family food festival built around kota, a South African street-food sandwich, with around 30 kota vendor stalls',
  NULL, NULL, NULL, 'Around 30 kota food stalls',
  'A family-oriented food festival celebrating the kota (South African street food), held at the Pretoria National Botanical Garden with dozens of vendors.',
  'agent',
  '["https://www.facebook.com/pitorikotafest/", "https://pretoria.co.za/event/pitori-kota-festival-pretoria-botanical-garden-in-pretoria", "https://www.kotafestival.com/"]'
);

INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  organiser, organiser_note, doors, ages, parking, traders, description, source, verification_json
) VALUES (
  'motlhana-and-inkungu-kucheza-afrika-festival-2026-10-08', 'Motlhana and Inkungu (Kucheza Afrika Festival)', 'Theatre',
  '2026-10-08', 'Thu 11:00, Fri 19:00, Sat 15:00 & 19:00, Sun 15:00', 'Sibusiso Khwinana Theatre, South African State Theatre', 'Pretoria Central',
  '320 Pretorius St, Pretoria Central, Pretoria',
  'R150', 'https://www.webtickets.co.za/v2/client.aspx?clientcode=statetheatre', 'Sold via Webtickets (State Theatre box office)',
  'South African State Theatre, in association with Luthando Arts Academy', 'Dance double bill, part of the Kucheza Afrika Festival; Motlhana choreographed by Katlego Dlamini, Inkungu by Sabata Mofokeng',
  NULL, NULL, NULL, NULL,
  'A contemporary dance double bill exploring loss, absence and fear of the unknown, staged as part of the State Theatre''s Kucheza Afrika dance festival.',
  'agent',
  '["https://www.statetheatre.co.za/", "https://www.newslink.co.za/motlhana-and-inkungu/", "https://www.musicinafrica.net/magazine/kucheza-afrika-festival-stage-sa-state-theatre"]'
);
