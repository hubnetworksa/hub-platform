-- Job 4: description enrichment sweep, batch 1 (10 records)

UPDATE businesses
SET description = 'Browns the Diamond Store is a fine jewellery boutique at Victoria Wharf specialising in natural diamonds, tracing its heritage back to 1934 and offering signature collections including the Protea Collection and Guardian Angel Tanzanite range.',
    description_enriched_at = datetime('now')
WHERE slug = 'browns-the-diamond-store-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Neo is a Mediterranean-style cafe, bar and deli on the Mouille Point beachfront on Beach Road, known for its all-day breakfasts, Greek-inspired dishes and panoramic ocean views, and has been operating for close to two decades.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-19:00',
    source_urls = '["https://www.eatout.co.za/venue/cafe-neo/", "https://za.africabz.com/western-cape/caffe-neo-1294", "https://www.sa-venues.com/things-to-do/westerncape/cafe-neo/"]'
WHERE slug = 'cafe-neo-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Roux is a farm-style restaurant at Noordhoek Farm Village offering all-day country dining, and regularly hosts evening live music, comedy and film events on select nights.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:30-17:30 (summer), 09:00-17:00 (winter)'
WHERE slug = 'cafe-roux-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Campo Marzio Design is an Italian leather goods boutique in Cape Quarter, part of a brand founded in Rome in 1933, and is the only Campo Marzio store in South Africa, selling wallets, diaries and other leather accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'campo-marzio-design-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Castors is an industrial supplier of castors, polyurethane wheels, pallet jacks and trolleys based in Kuils River, serving commercial and industrial clients across the greater Cape Town area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/kuils-river.html", "https://www.yellosa.co.za/location/kuils-river/3", "https://www.yellosa.co.za/company/947706/cape-castors"]'
WHERE slug = 'cape-castors-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Cape Union Mart at Victoria Wharf is a branch of South Africa''s leading outdoor and adventure retailer, stocking clothing, footwear and gear for hiking, camping and other outdoor pursuits.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-21:00'
WHERE slug = 'cape-union-mart-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Union Mart Travel & Safari is a concept store at Victoria Wharf inspired by classic African safaris, offering specialised travel and outdoor adventure gear alongside expert advice and a climbing wall for kit testing.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-union-mart-travel-safari-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Capitec Bank branch is located inside Golden Acre shopping centre in the Cape Town CBD, offering everyday banking services to shoppers and commuters in the city centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.capitecbank.co.za/branch-locator", "https://www.tiendeo.co.za/stores/cape-town/capitec-bank-shop-s-golden-acre-rooikoppies/62764"]'
WHERE slug = 'capitec-bank-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Carrol Boyes at Victoria Wharf was the brand''s very first retail store, opened in 2003, selling the label''s sculptural, human-form-inspired homeware and lifestyle pieces that have since grown into a nationwide network of stores.',
    description_enriched_at = datetime('now')
WHERE slug = 'carrol-boyes-victoria-wharf-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Grassy Park is a branch of the secondhand retail and buy-back chain, dealing in electronics, appliances, tools and other used and new goods at its store on the corner of 5th Avenue and Italian Road.',
    description_enriched_at = datetime('now'),
    hours = 'Retail Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun/PH 09:00-14:00',
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/kismet-building-corner-of-5th-avenue-and-italian-road-grassy-park", "https://yandex.com/maps/org/cash_crusaders_grassy_park/148703898621/", "https://cashcrusaders.co.za/storedetails?location=GrassyPark"]'
WHERE slug = 'cash-crusaders-grassy-park-grassy-park' AND description_enriched_at IS NULL;
