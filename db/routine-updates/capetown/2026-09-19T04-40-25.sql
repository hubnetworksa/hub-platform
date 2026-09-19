-- Job 4: description enrichment sweep, checkpoint 1/2 (10 businesses)

UPDATE businesses
SET description = 'Browns the Diamond Store is a diamond jewellery specialist located within Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now')
WHERE slug = 'browns-the-diamond-store-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Neo is a European-style coffee and fresh food bar on Beach Road in Mouille Point, on the Atlantic seaboard promenade opposite the Mouille Point Lighthouse.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-19:00',
    source_urls = '["https://www.eatout.co.za/venue/cafe-neo/", "https://za.africabz.com/western-cape/caffe-neo-1294", "https://www.sa-venues.com/things-to-do/westerncape/cafe-neo/"]'
WHERE slug = 'cafe-neo-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Roux is a farm-style restaurant in Noordhoek Farm Village serving breakfast and lunch -- including its burgers, salads and wood-fired pizza -- with home-baked cakes, scones and tarts throughout the day, and it also hosts evening live music, comedy and film nights.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 08:30-17:00 (kitchen closes 15:30)',
    source_urls = '["https://www.caferoux.co.za", "https://www.capetourism.com/noordhoek-farm-village/", "https://www.caferoux.co.za/contact/"]'
WHERE slug = 'cafe-roux-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Campo Marzio Design sells Italian leather goods, pens and accessories from a Rome brand tracing back to a 1933 stationery workshop; its Cape Quarter store, opened in 2008, was the brand''s first in Africa.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://www.campomarzio.co.za/capequarter", "https://www.campomarzio.co.za/about-us"]'
WHERE slug = 'campo-marzio-design-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Castors is an industrial supplier of castors and polyurethane wheels in Kuils River, also stocking pallet jacks and trolleys for commercial and industrial use.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville/kuils-river.html", "https://www.yellosa.co.za/location/kuils-river/3", "https://www.yep.co.za/biz/store/cape-castors/688695"]'
WHERE slug = 'cape-castors-kuils-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Union Mart at Victoria Wharf is South Africa''s leading outdoor and adventure retailer, stocking clothing, footwear and gear for hiking, camping and trail running; the Cape Town brand was founded in 1933 and later launched its own K-Way outdoor equipment line in 1981.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/cape-union-mart-shop-victoria-wharf-victoria-alfred-waterfront-cape-town/36351", "https://www.guzzle.co.za/cape-union-mart/cape-town", "https://www.waterfront.co.za/stores/cape-union-mart/"]'
WHERE slug = 'cape-union-mart-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Union Mart Travel & Safari at the V&A Waterfront is a dedicated travel-goods store from the Cape Union Mart outdoor retail group, stocking non-seasonal clothing, luggage and travel gear.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://brabys.com/south-africa/cape-town/verified-business/cape-union-mart-travel-safari", "https://absolutelylife.co.za/cape-union-mart---travel-safari-v-a-waterfront-6196138989481018881/", "https://www.africanadvice.com/1072798/Outdoor_Accessories/Cape_Town/Cape_Union_Mart_Travel_And_Safari/"]'
WHERE slug = 'cape-union-mart-travel-safari-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Capitec Bank Golden Acre is a full-service Capitec branch inside the Golden Acre shopping centre in central Cape Town, offering everyday banking, savings and loan services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.capitecbank.co.za/branch-locator", "https://www.tiendeo.co.za/stores/cape-town/capitec-bank-shop-s-golden-acre-rooikoppies/62764"]'
WHERE slug = 'capitec-bank-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Carrol Boyes (Victoria Wharf) sells the eponymous South African brand''s sculptural, functional-art homeware and gifting pieces -- pewter, aluminium and stainless-steel tableware with fluid, human-form-inspired designs -- from a label founded by artist Carrol Boyes in 1989.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterfront.co.za/stores/carrol-boyes", "https://www.fyple.co.za/company/carrol-boyes", "https://carrolboyes.com/za/our-story"]'
WHERE slug = 'carrol-boyes-victoria-wharf-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cash Crusaders Grassy Park is a branch of Cash Crusaders, Southern Africa''s largest secondhand retailer, buying, selling and pawning new and pre-owned goods; the chain was founded in Plumstead, Cape Town, in 1996.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/kismet-building-corner-of-5th-avenue-and-italian-road-grassy-park", "https://yandex.com/maps/org/cash_crusaders_grassy_park/148703898621/", "https://cashcrusaders.co.za/"]'
WHERE slug = 'cash-crusaders-grassy-park-grassy-park' AND description_enriched_at IS NULL;
