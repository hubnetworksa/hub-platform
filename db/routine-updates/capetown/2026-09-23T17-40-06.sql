UPDATE businesses
SET description = 'Bootlegger Coffee Company''s Muizenberg branch is a corner cafe on Beach Road overlooking Muizenberg''s surf break, serving coffee, ice cream and light food to beachgoers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-18:00',
    source_urls = '["https://www.eatout.co.za/venue/bootlegger-coffee-company-muizenberg/", "https://www.tripadvisor.co.za/Restaurant_Review-g1509162-d12958166-Reviews-Bootlegger_Coffee_Company_Muizenberg-Muizenberg_Western_Cape.html", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerXSMuizenberg"]'
WHERE slug = 'bootlegger-coffee-company-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Caledonian Cycles is a bicycle shop on Main Road in Muizenberg, selling and servicing bikes for the local commuter and surf community.',
    description_enriched_at = datetime('now')
WHERE slug = 'caledonian-cycles-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Muizenberg branch of Checkers supermarket, inside The Muize Shopping Centre, stocks groceries and fresh produce alongside in-store bakery, butchery and deli counters.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-19:00, Sun 09:00-16:00',
    source_urls = '["https://www.checkers.co.za/store-directory-and-leaflets/store-details/369", "https://za.africabz.com/western-cape/checkers-muizenberg-8187", "https://my-catalogue.co.za/stores/muizenberg/checkers/shoprite-centre-cnr-main-and-atlantic-roads"]'
WHERE slug = 'checkers-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Craftart Emporium is a gift and homeware gallery in a historic building on St George''s Street, Simon''s Town, showcasing locally made South African crafts, art and interior decor pieces.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-17:00, Sun 10:30-17:00',
    source_urls = '["https://www.simonstown.com/shop/craftart", "http://www.modernoverland.com/south-africa/cape-town/simons-town/craftart-gallery/", "https://sowdelicious.co.za/retail-outlets/craftart-emporium/"]'
WHERE slug = 'craftart-emporium-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'False Bay Veterinary Clinic in Muizenberg offers general consultations, preventive care, diagnostics and surgical procedures for pets, including complimentary acupuncture treatments.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://falsebayvet.co.za/", "https://www.brabys.com/business/6040946/south-africa/western-cape/cape-town/muizenberg/main-rd/veterinary-clinics/false-bay-veterinary-clinic", "https://savet.co.za/vet/false-bay-veterinary-clinic"]'
WHERE slug = 'false-bay-veterinary-clinic-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fish Hoek Veterinary Clinic, part of the Two Oceans Veterinary Group, provides check-ups, dental care and surgical procedures for pets in Fish Hoek.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-12:00, 15:00-18:00, Sat 09:00-12:00, Sun Closed',
    source_urls = '["https://savet.co.za/vet/fish-hoek-veterinary-clinic", "https://topvet.net/practices/south-africa/western-cape/cape-town/fish-hoek-veterinary-clinic-26581", "https://veterinary.co.za/find-a-vet/fish-hoek-veterinary-clinic-two-oceans-veterinary-group/"]'
WHERE slug = 'fish-hoek-veterinary-clinic-fish-hoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gaslight Cafe is a beachfront coffee shop at Surfers Corner in Muizenberg, popular for its sea views, breakfast and lunch menu, and reliable wifi.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d6485568-Reviews-Gaslight_Cafe-Muizenberg_Western_Cape.html", "https://texxandthecity.com/2019/10/smet-pleks-to-suip-in-the-southern-suburbs-the-gaslight-cafe/", "https://mymuizenberg.co.za/wifi-friendly-coffee-shops-in-muizenberg/"]'
WHERE slug = 'gaslight-cafe-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hang Ten Cafe is a creperie and coffee bar at Muizenberg''s Surfers Corner beachfront, serving crepes, breakfast and coffee to surfers and beachgoers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 06:30-18:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d10067431-Reviews-Hang_Ten_Cafe-Muizenberg_Western_Cape.html", "https://www.eatout.co.za/venue/hang-ten-cafe/", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town-metropolitan-municipality/muizenberg/hang-ten-cafe-430d80/opening-hours"]'
WHERE slug = 'hang-ten-cafe-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Happy Rooster is a Portuguese-style restaurant on the first floor of the Muizenberg Station building, serving trinchado steak and peri-peri chicken with sea views, with dine-in, takeaway and delivery options.',
    description_enriched_at = datetime('now')
WHERE slug = 'happy-rooster-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Muizenberg Medical Practice is a combined medical and dental practice on Main Road, offering general consultations alongside dental services under one roof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:15-17:00'
WHERE slug = 'muizenberg-medical-practice-muizenberg' AND description_enriched_at IS NULL;
