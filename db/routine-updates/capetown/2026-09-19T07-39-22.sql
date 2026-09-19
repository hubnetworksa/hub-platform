-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)
UPDATE businesses
SET description = 'Browns the Diamond Store is a fine jewellery boutique on the upper level of Victoria Wharf Shopping Centre at the V&A Waterfront, specialising in diamond engagement rings and fine diamond jewellery from a South African brand with over 80 years'' heritage.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-20:30',
    source_urls = '["https://www.waterfront.co.za/stores/browns-the-diamond-store", "https://www.fyple.co.za/company/browns-jewellers-south-africas-most-beautiful-diamonds-vanda-waterfront-15o4ho0/", "https://brownsjewellers.com/StoreLocator"]'
WHERE slug = 'browns-the-diamond-store-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Café Neo is a Greek-styled deli, coffee shop and restaurant on Beach Road in Mouille Point, on the beachfront opposite the lighthouse, serving Mediterranean and Greek dishes including paninis, salads, pitas and hearty breakfasts.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-19:00',
    source_urls = '["https://www.eatout.co.za/venue/cafe-neo/", "https://za.africabz.com/western-cape/caffe-neo-1294", "https://www.sa-venues.com/things-to-do/westerncape/cafe-neo/"]'
WHERE slug = 'cafe-neo-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Café Roux is a restaurant at Noordhoek Farm Village serving relaxed, country-style dining, with select evenings hosting live music, comedy and film nights under an outdoor tent.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:30-17:30 (summer), 09:00-17:00 (winter)',
    source_urls = '["https://www.caferoux.co.za", "https://www.capetourism.com/noordhoek-farm-village/", "https://thefarmvillage.co.za/cafe-roux/"]'
WHERE slug = 'cafe-roux-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Campo Marzio Design in Cape Quarter is an Italian leather-goods and design store selling wallets, diaries and accessories, and was Campo Marzio''s first store in Africa when it opened in 2008 -- the only Campo Marzio store in South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'campo-marzio-design-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Castors is a distributor of castors and polyurethane wheels in Kuils River, also supplying pallet jacks, trolleys and scaffolding for industrial and commercial use.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/kuils-river.html", "https://www.yellosa.co.za/location/kuils-river/3", "https://www.yep.co.za/biz/store/cape-castors/688695"]'
WHERE slug = 'cape-castors-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Union Mart''s Adventure Centre at Victoria Wharf, V&A Waterfront, is an outdoor and adventure retail store stocking hiking, camping, trail-running and travel gear, with a specialised testing space and a climbing wall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/cape-union-mart-shop-victoria-wharf-victoria-alfred-waterfront-cape-town/36351", "https://www.guzzle.co.za/cape-union-mart/cape-town", "https://www.waterfront.co.za/stores/cape-union-mart-adventure-centre/"]'
WHERE slug = 'cape-union-mart-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Cape Union Mart store at Victoria Wharf, V&A Waterfront, focuses on travel and safari gear, offering non-seasonal outdoor clothing and equipment for adventure travellers.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-union-mart-travel-safari-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank''s Golden Acre branch in Cape Town CBD, at Shop S41 Golden Acre on Adderley Street, offers everyday retail banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.capitecbank.co.za/branch-locator", "https://www.tiendeo.co.za/stores/cape-town/capitec-bank-shop-s-golden-acre-rooikoppies/62764"]'
WHERE slug = 'capitec-bank-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Carrol Boyes'' Victoria Wharf store at V&A Waterfront sells South African-designed functional art homeware in pewter, stainless steel and resin, and was the brand''s very first retail store, opened in 2003.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterfront.co.za/stores/carrol-boyes", "https://www.fyple.co.za/company/carrol-boyes", "https://carrolboyes.com/en-us/pages/carrol-boyes-story"]'
WHERE slug = 'carrol-boyes-victoria-wharf-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Grassy Park, in the Kismet Building on the corner of 5th Avenue and Italian Road, buys and sells second-hand goods such as electronics, tools and other used merchandise.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun 09:00-14:00',
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/kismet-building-corner-of-5th-avenue-and-italian-road-grassy-park", "https://yandex.com/maps/org/cash_crusaders_grassy_park/148703898621/", "https://cashcrusaders.co.za/locate-a-store/store/11/grassy-park"]'
WHERE slug = 'cash-crusaders-grassy-park-grassy-park' AND description_enriched_at IS NULL;
