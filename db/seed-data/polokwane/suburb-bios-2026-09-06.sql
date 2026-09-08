-- Suburb bios (suburbs.bio), hand-written from web research 2026-09-06 in the
-- style of the owner-supplied Bendor bio: 3-4 short paragraphs — what the
-- area is / its history, where it sits, nearby amenities, who it suits.
-- Every specific claim (school, mall, hospital, date) traces to a real
-- source. Paragraphs are separated by a blank line; src/pages/suburb/[slug].astro
-- splits on \n\n to render them.
--
-- Owner decisions applied (2026-09-06):
--   aquapark, danville -> dropped (aquapark is a Tzaneen suburb; no real
--                         Polokwane "Danville"). Removed from suburbs,
--                         0002/0004, routine-state.json and areaGroups.ts.
--   capricorn-park     -> renamed to slug 'capricorn' / "Capricorn" (the
--                         real Polokwane suburb; "Capricorn Park" is near
--                         Soekmekaar). Bio added below.
--   extension-71/76    -> kept with short, general bios (little published).

UPDATE suburbs SET bio = 'Bendor is a well-established, middle-class residential suburb of Polokwane, developed since 1973 — known for its modern architecture, secure estates, and balance of tranquility with city convenience.

The suburb sits close to Mall of the North and the Bendor Cycad Centre, giving residents quick access to major shopping and commercial amenities.

Residents have convenient access to schools like Pietersburg Hoërskool and Curro Heuwelkruin, healthcare via Netcare Pholoso Hospital and Mediclinic Limpopo, and recreation at Peter Mokaba Stadium. Bendor is also a short drive from Polokwane Game Reserve and the Bird and Reptile Park.

With its mix of townhouses, family homes, and gated estates, Bendor offers families, professionals, and retirees a comfortable, well-connected base within greater Polokwane.' WHERE slug = 'bendor';

UPDATE suburbs SET bio = 'Bendor Park is the upper, leafier part of the Bendor area on Polokwane''s eastern side, a middle- to upper-income residential suburb that has grown steadily since the 1970s.

It is anchored by the Cycad Shopping Centre on General Maritz Street and the adjoining Cycad Estate, a walled security estate established in 2003, with Mall of the North and Thornhill Shopping Centre both a short drive away.

Streets are quiet and well-treed, and the mix of freestanding homes, townhouse complexes and gated estates suits families, professionals and retirees who want space without leaving the city.

The Polokwane CBD, Peter Mokaba Stadium and Polokwane Game Reserve are all within about ten minutes by car.' WHERE slug = 'bendor-park';

UPDATE suburbs SET bio = 'Polokwane Central is the commercial and civic heart of the city, laid out in 1886 as Pietersburg — named after the Boer general Petrus (Piet) Joubert — and renamed Polokwane, "place of safety" in Sepedi, in 2002.

The CBD is known for its wide streets and mix of jacaranda and coral trees, and packs in the city''s main shopping streets, banks, government offices and the Civic Centre.

Cultural landmarks cluster here too: the Polokwane Art Museum, the Irish House Museum and the Hugh Exton Photographic Museum all sit within the central grid.

For businesses it remains the busiest trading address in Limpopo''s capital, roughly halfway between Pretoria and the Zimbabwean border on the N1.' WHERE slug = 'polokwane-central';

UPDATE suburbs SET bio = 'Flora Park is a well-established, family-oriented residential suburb on the southern side of Polokwane, known for its quiet streets and easy reach of the city centre.

It has its own schools — Flora Park Primary and Florapark Comprehensive — along with the Flora Park Shopping Centre and the Flora Med medical centre for everyday needs.

The Flora Park dam is a local landmark for walking and fishing, and Fauna Park with its Savannah Mall is right next door.

A mix of older houses on generous stands and newer townhouse complexes makes it popular with families and professionals wanting value close to town.' WHERE slug = 'flora-park';

UPDATE suburbs SET bio = 'Fauna Park is one of Polokwane''s oldest suburbs, instantly recognisable for its animal-themed street names and its larger-than-average stands, many with established gardens and swimming pools.

At its centre is Savannah Mall, a city landmark since it opened in 1997, with Checkers, Pick n Pay, Woolworths, Clicks, Dis-Chem and a banking hall.

The suburb borders Flora Park and Sterpark and is a few minutes from the CBD, with residential complexes such as Hyde Park across the road from the mall adding to the older freestanding housing stock.

It suits families and buyers who want space and a settled, green neighbourhood with shopping on the doorstep.' WHERE slug = 'fauna-park';

UPDATE suburbs SET bio = 'Sterpark is a popular residential suburb wedged between Bendor and Fauna Park, its streets all named after stars.

There are no shops in Sterpark itself, but Savannah Mall is only about 400 m away and Thornhill Shopping Centre — SuperSpar, Clicks and Sportsmans Warehouse — is roughly a kilometre off.

Its closeness to the CBD and to two major shopping centres makes it a favourite with young professionals and small families.

Housing is mostly freestanding homes and townhouse complexes rather than large gated estates.' WHERE slug = 'sterpark';

UPDATE suburbs SET bio = 'Ivy Park is a quiet, settled suburb only a few minutes from the Polokwane CBD — about 3 km, or a six-minute drive, along Marshall Street.

The Ivy Park Centre on the corner of Nelson Mandela Drive and Marshall Street covers day-to-day shopping, with Mall of the North about 4 km away and Polokwane International Airport around 10 km out.

It is a largely residential area of freestanding homes and complexes, valued for being central without the traffic of the busier suburbs.

Schools, clinics and the city''s main hospitals are all a short drive away.' WHERE slug = 'ivy-park';

UPDATE suburbs SET bio = 'Welgelegen is an established residential suburb close to the centre of Polokwane, known for its large stands — typically 950 to 1 400 m² — and for how long its residents tend to stay, which gives it a stable, settled feel.

Day-to-day medical care is covered by GPs and a physiotherapist in the suburb, with Polokwane Provincial Hospital about 2 km away and Mediclinic Limpopo, on Plein Street, close by.

Housing is mostly older freestanding homes on big plots, some now being redeveloped as townhouses.

It appeals to families and buyers wanting room and a central location without paying estate premiums.' WHERE slug = 'welgelegen';

UPDATE suburbs SET bio = 'Nirvana was proclaimed in November 1973 as a Group Area for Polokwane''s Indian community, who had been moved there from 1967 under apartheid, on land that was once the Ivydale Agricultural Holdings.

It has since grown well beyond its origins into a self-contained area open to all residents, with two mosques, a Hindu temple, churches of several denominations, schools, pre-schools and a dense mix of formal and informal businesses.

Together with the adjoining Superbia, it forms the hub of Polokwane''s western business district.

It remains one of the busiest and most diverse trading areas in the city.' WHERE slug = 'nirvana';

UPDATE suburbs SET bio = 'Westenburg lies north-west of the Polokwane city centre and was set aside during the apartheid era as a Group Area for the Coloured community.

Today it is an established residential suburb within the Polokwane Local Municipality and Capricorn District, with a steady local property market.

It sits close to Nirvana, Superbia and the western commercial belt, so shops, schools and services are within easy reach.

Housing is mostly freestanding family homes.' WHERE slug = 'westenburg';

UPDATE suburbs SET bio = 'Ladanna is Polokwane''s main light-industrial and commercial belt on the north-western side of the city, about 2.5 km from the CBD.

It is built on large stands — anywhere from about 900 to nearly 2 900 m², many with their own boreholes — which suits warehousing, workshops and mechanical trades.

The area works almost like a small town in its own right, with shopping centres such as Foodzone, plus pharmacies, vets and banks within walking distance.

It is closely tied to the neighbouring Annadale residential area.' WHERE slug = 'ladanna';

UPDATE suburbs SET bio = 'Superbia was proclaimed in 1973 as a light-industrial extension on part of the old Ivydale Agricultural Holdings, and it still serves as the commercial and industrial engine of Polokwane''s western district.

It sits directly against Nirvana, sharing that area''s community centre, sports grounds, clinic and library, and its schools and places of worship.

Warehousing, trade suppliers, workshops and service businesses make up most of what is here.

For anyone doing business on the western side of the city, Superbia is the address.' WHERE slug = 'superbia';

UPDATE suburbs SET bio = 'Penina Park is a small, quiet and secure suburb about 3 km from the Polokwane CBD.

Most of the housing is townhouses, duplexes and freestanding homes inside gated complexes, which makes it popular with first-time buyers, downsizers and people who want a lock-up-and-go base close to town.

Everyday shopping and the city''s main routes are only a few minutes away.

It is one of the more affordable central suburbs.' WHERE slug = 'penina-park';

UPDATE suburbs SET bio = 'Serala View is a newer, quieter extension of the Flora Park area on the southern edge of Polokwane; its name means "place of safety".

It is well placed for shopping — about six minutes from Savannah Mall and ten from Mall of the North, with Flora Park Shopping Centre, Thornhill Shopping Centre and Polokwane Lifestyle Centre all close — and roughly fifteen minutes from Meropa Casino via the N1/R71.

Nearby recreation includes the Flora Park dam and the Polokwane Snake and Reptile Park.

The area is still developing, with a mix of finished homes and vacant stands drawing buyers and investors.' WHERE slug = 'serala-view';

UPDATE suburbs SET bio = 'Annadale is a well-established, centrally located suburb about 2.5 km from the Polokwane CBD, offering some of the more affordable freestanding housing close to town.

It is known for big yards — commonly 900 m² and up, many with boreholes — and sits right against the Ladanna industrial and commercial area, so shops, pharmacies, vets and banks are within walking distance.

Some larger plots are being rezoned for townhouse development as demand for central housing grows.

It suits buyers who want space, a central position and quick access to the city''s work hubs.' WHERE slug = 'annadale';

UPDATE suburbs SET bio = 'Dalmada is a smallholdings belt just outside Polokwane on the R71, popular for combining rural space with quick access to the city and to Savannah Mall.

Plots typically run from about 2 to 8.5 hectares, most with borehole water, three-phase power and good road access, and are used for everything from livestock and cultivation to simple country living.

Splash Polokwane, the local waterpark, is in Dalmada.

It appeals to buyers who want land and a semi-rural lifestyle without a long commute.' WHERE slug = 'dalmada';

UPDATE suburbs SET bio = 'Broadlands is an upmarket gated estate on the eastern side of Polokwane, built around a secure, family-focused lifestyle.

Shared facilities include a clubhouse, swimming pool, tennis courts, a gym and a children''s play area, with 24-hour manned security, controlled access and an electrified perimeter.

Homes are mostly large four- to six-bedroom houses on landscaped stands.

It suits families and professionals wanting security and estate amenities close to Mall of the North and the Bendor node.' WHERE slug = 'broadlands';

UPDATE suburbs SET bio = 'Moregloed is a leafy, established residential suburb close to the Polokwane city centre and next to Hospital Park.

Its quiet streets and older homes on decent stands have also made it a common spot for guesthouses and short-stay accommodation.

The CBD, Polokwane Provincial Hospital and the central shopping streets are all within a few minutes.

It suits buyers who want a settled, central neighbourhood rather than a new estate.' WHERE slug = 'moregloed';

UPDATE suburbs SET bio = 'Hospital Park is a small, central suburb sitting between Polokwane Central and Annadale, named for the Polokwane Provincial Hospital on the corner of Dorp and Hospital streets.

Because of the hospital, the area has a strong cluster of medical practices, plus lodges and guesthouses used by visiting families and patients.

Housing is a mix of older homes and converted properties, all within walking distance of the CBD.

It is as central as Polokwane suburbs get.' WHERE slug = 'hospark';

UPDATE suburbs SET bio = 'Thornhill Estate is a 24-hour guarded residential estate in the fast-growing Bendor area on Polokwane''s eastern side, with landscaped parks and walking paths inside its walls.

It is anchored by the Thornhill Shopping Centre, opened in March 2009 on the R81/Munnik Avenue, whose village-style architecture and tenants — SuperSpar, Clicks, Sportsmans Warehouse and around twenty more stores — make it a local landmark.

Mall of the North and the Cycad node are both a short drive away.

The estate suits families wanting security, greenery and shopping within walking distance.' WHERE slug = 'thornhill-estate';

UPDATE suburbs SET bio = 'Southern Gateway is a fast-growing, Tuscan-styled walled suburb immediately south of Polokwane, right next to the N1 — about five minutes from the city centre and an easy run to Pretoria and Johannesburg.

Developed by Multi Spectrum Property, it is made up of newer, moderately priced family homes aimed at first-time and younger buyers.

Its main draw is location: quick access to work, schools, healthcare and shopping despite being on the city''s edge.

The suburb is still filling in, with homes and stands both on the market.' WHERE slug = 'southern-gateway';

UPDATE suburbs SET bio = 'Eduan Park is a sought-after, established residential suburb on the western side of Polokwane, next to Welgelegen and the industrial area and close to the CBD.

Housing runs to larger family homes — three to seven bedrooms is common — on full-title stands, with an active buy and rental market.

Everyday shopping, schools and the city''s hospitals are all a few minutes away.

It suits families wanting a settled, central suburb with room to grow.' WHERE slug = 'eduan-park';

UPDATE suburbs SET bio = 'Seshego is a large township directly north-west of Polokwane, laid out between 1963 and 1974 as a segregated residential area and, from 1972 to 1974, the interim capital of the Lebowa Bantustan before Lebowakgomo was built.

It is now formally part of the City of Polokwane and home to hundreds of thousands of residents, with local industry spanning food and beverages, textiles, clothing, wood products, metalwork and machinery.

Its own retail — Seshego Circle and Seshego Plaza — plus schools, clinics and sports facilities serve the community, and it is known for a strong local identity despite high unemployment.

For businesses it is one of the biggest consumer markets in the Polokwane area.' WHERE slug = 'seshego';

UPDATE suburbs SET bio = 'Seshego Zone 1 is one of the numbered zones that make up the Seshego township north-west of Polokwane.

It is a mainly residential area, close to Seshego''s own shopping centres — Seshego Circle and Seshego Plaza — and to the township''s schools, clinics and civic amenities.

Like the rest of Seshego it is now part of the City of Polokwane.

Local trade, transport and service businesses serve a dense resident population.' WHERE slug = 'seshego-zone-1';

UPDATE suburbs SET bio = 'Seshego Zone 4 is a residential zone within Seshego, the large township north-west of Polokwane established under apartheid-era planning and now part of the City of Polokwane.

Residents are served by local schools and clinics and by the Seshego Circle and Seshego Plaza shopping centres.

Everyday needs are largely met by businesses within the township itself.

It forms part of one of the biggest consumer markets in the Polokwane area.' WHERE slug = 'seshego-zone-4';

UPDATE suburbs SET bio = 'Mankweng, also known as Turfloop, is a township about 30 km east of Polokwane on the R71 toward Tzaneen, set in the foothills of the Wolkberg.

It grew from the 1960s around what is now the University of Limpopo''s Turfloop Campus, and student life still shapes it: the area is busy year-round and well supplied with the Paledi Mall and Turfloop Plaza shopping centres.

Housing ranges from university accommodation and student rentals to established township homes and newer developments.

For businesses it offers a large, youthful catchment anchored by the university.' WHERE slug = 'mankweng';

UPDATE suburbs SET bio = 'Lebowakgomo is a town south-east of Polokwane, established in 1974 and built up through the early 1980s as the purpose-built capital of the Lebowa Bantustan — Seshego having served as the interim capital first.

The land was donated to the Lebowa government by Chief Mmutle Mphahlele of the Bakgaga ba gaMphahlele.

Since 1994 it has been part of Limpopo Province and functions as a commercial and local-government centre within the Capricorn District, with its own shopping centre (Mall @ Lebo) and government offices.

It anchors trade for the rural communities to the south of Polokwane.' WHERE slug = 'lebowakgomo';

UPDATE suburbs SET bio = 'Capricorn is a compact residential suburb close to central Polokwane, on the north-western side near the Ladanna and Annadale areas.

Most of the housing is older freestanding homes, flats and small complexes, and it has a reputation as an affordable, practical address for singles, young families and people working in the nearby industrial and commercial belt.

Everyday shopping, schools and the CBD are all within a few minutes by car.' WHERE slug = 'capricorn';

UPDATE suburbs SET bio = 'Extension 71 is one of the numbered township extensions on the western side of Polokwane, in the belt of housing between the city centre and Seshego.

It is a mainly residential area of subsidised and lower-cost housing, served by local schools, clinics and small traders.

The Seshego shopping centres and the Polokwane CBD are both a short drive away.' WHERE slug = 'extension-71';

UPDATE suburbs SET bio = 'Extension 76 is a residential township extension on Polokwane''s western edge, toward Seshego, made up largely of RDP and lower-cost housing.

Day-to-day needs are met by local traders, spaza shops and neighbourhood services, with bigger shopping at Seshego Circle, Seshego Plaza and the Polokwane CBD nearby.

It forms part of the fast-growing western residential belt of the city.' WHERE slug = 'extension-76';
