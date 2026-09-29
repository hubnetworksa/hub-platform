-- Job 4: description enrichment sweep, batch 2 of 2 (10 records)

UPDATE businesses
SET description = 'Ohana Cafe is a walk-in breakfast and lunch spot on Main Road in Kalk Bay, known for all-day breakfasts and freshly baked goods; it does not take table bookings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-16:00',
    source_urls = '["https://www.capetown.travel/listing/ohana-cafe/", "https://www.facebook.com/ohana.kalkbay", "https://www.eatout.co.za/venue/ohana-cafe/"]'
WHERE slug = 'ohana-cafe-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Big Bay is a supermarket at Eden on the Bay Mall in Big Bay, Bloubergstrand, offering groceries and household essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 09:00-20:00',
    source_urls = '["https://www.shopshours.co.za/pick-n-pay/cape-town/c-57f3cac247d677c3b27e5ca0", "https://www.yep.co.za/biz/store/big-bay-family-store-pty-ltd-t-or-a-pick-n-pay/493445", "https://www.pukkapure.co.za/outlets/pick-n-pay-local-big-bay/", "https://www.edenonthebaymall.co.za/pick-n-pay/"]'
WHERE slug = 'pick-n-pay-big-bay-bloubergstrand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Emporium Parklands is a postal, courier and printing services outlet at The Emporium Centre in Parklands.',
    description_enriched_at = datetime('now')
WHERE slug = 'postnet-emporium-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Protea Chemicals is an industrial and specialty chemicals supplier serving the Western Cape from its Killarney Gardens site, part of a national chemical distribution network.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.proteachemicals.co.za/contact-us/contact-details", "https://www.cybo.com/ZA-biz/protea-chemicals-pty-ltd_1g", "https://www.proteachemicals.co.za/protea/contact-us/protea-sites/coastal-region"]'
WHERE slug = 'protea-chemicals-killarney-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roman''s Pizza Parklands is a pizza takeaway and delivery outlet at Parklands Junction Shopping Centre, part of the Roman''s Pizza chain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 10:00-21:00, Fri-Sat 10:00-22:00, Sun 10:00-21:00',
    source_urls = '["https://za.africabz.com/western-cape/romans-pizza-parklands-17247", "https://tableviewinfo.co.za/romans-pizza-parklands/", "https://romansmenu.co.za/locations/romans-pizza-parklands/"]'
WHERE slug = 'romans-pizza-parklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rustenburg Pharmacy is a community pharmacy in Muizenberg, part of the Alpha Pharmacies group, that has served the Muizenberg, Marina da Gama, Lakeside, St James and Kalk Bay community for over three decades.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-19:00, Sat 08:30-14:00, Sun 09:00-13:00',
    source_urls = '["https://za.africabz.com/western-cape/rustenburg-pharmacy-144329", "https://www.brabys.com/za/western-cape/cape-town/muizenberg/pharmacies/rustenburg-pharmacy-muizenberg", "https://www.alphapharmacies.co.za/department/rustenburg-pharmacy/"]'
WHERE slug = 'rustenburg-pharmacy-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SBG Cape Town is a martial arts and fitness gym at Noordhoek Garden Emporium, offering Brazilian Jiu-Jitsu, MMA, kickboxing and submission wrestling training for all ages and skill levels.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://sbgcapetown.co.za/contact/", "https://www.slapbump.co.za/gym/sbg-noordhoek", "https://sbgcapetown.co.za/"]'
WHERE slug = 'sbg-cape-town-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simon''s Town Bottle Store is an owner-managed liquor store on St George''s Street, stocking a range of spirits, wines and other refreshments with regular monthly promotions.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun Closed',
    source_urls = '["https://www.yellosa.co.za/company/756859/simons-town-bottle-store", "https://www.brabys.com/za/western-cape/simons-town/bottle-stores-off-sales-retail/simons-town-bottle-store", "https://www.thinklocal.co.za/biz/simons-town-bottle-store-simons-town"]'
WHERE slug = 'simons-town-bottle-store-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Simon''s Town Guest House is a five-suite guest house in Cairnside, Simon''s Town, offering en-suite rooms with sea views, free WiFi and a five-minute walk to Glencairn Beach; check-in is from 14:00 and check-out by 10:00.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.simonstownguesthouse.co.za/contact/contact-us/", "https://cape-town.infoisinfo.co.za/card/simons-town-guest-house/404737", "https://www.booking.com/hotel/za/simonstownguesthouse.html"]'
WHERE slug = 'simons-town-guest-house-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Melkbosstrand is a flame-grilled burger, chicken and ribs takeaway restaurant at Birkenhead Shopping Centre, part of the Steers chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'steers-melkbosstrand' AND description_enriched_at IS NULL;
