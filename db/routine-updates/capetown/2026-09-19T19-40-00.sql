UPDATE businesses
SET description = 'Cape Biologix is a Ndabeni-based biotechnology company that develops and manufactures plant-made recombinant proteins for scientific research and rapid diagnostic test kits, using a transient expression platform in tobacco plants rather than animal-based methods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capebiologix.com/contact/", "https://www.facebook.com/CapeBiologixTechnologies/", "https://capebiologix.com/"]'
WHERE slug = 'cape-biologix-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ellies Electronics Cape stocks TV, satellite and DStv accessories and spare parts, including aerial fittings and TV mounts, from its Ndabeni premises.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cylex.net.za/company/ellies-electronics-17503526.html", "https://www.yellosa.co.za/company/175825/ellies-electronics-cape", "https://ellies.co.za/contact-us/"]'
WHERE slug = 'ellies-electronics-cape-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Nampak Flexible Packaging''s Ndabeni plant manufactures flexible packaging for the food, beverage and wine industries, including bag-in-box wine packaging and quad-seal bags and pouches, and holds BRC accreditation.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cybo.com/ZA-biz/nampak-flexible-packaging-cape", "https://www.vconnect.com/zar/nampak-flexible-cape-cape_town_b1615742", "https://www.nampak.com/investors/media-release/2012/nampak-flexible-bags-new-era-for-wine"]'
WHERE slug = 'nampak-flexible-packaging-ndabeni' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rage is a South African footwear and clothing retailer specialising in on-trend women''s shoes, with a range that also covers men''s, boys'' and girls'' shoes and some clothing; this branch trades from the Golden Acre Shopping Centre in the CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://golden-acre.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/rage-s-s-golden-acre-adderley-street/10495", "https://ragesa.co.za/"]'
WHERE slug = 'rage-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rain operates a store at Cape Quarter Lifestyle Village offering its uncapped 4G/5G mobile and home internet network services, including SIMs, devices and rainOne plans, to customers in De Waterkant.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat-Sun 08:00-14:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.rain.co.za/store-locator", "https://wanderlog.com/place/details/15133323/rain-office-cape-quarter"]'
WHERE slug = 'rain-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rare Grill is a small, dedicated steakhouse in Harfield Village with around 30 seats, focusing on wet-aged sirloin, rump and fillet steaks that are dry-aged on the premises before serving.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 18:00-22:00, Sun Closed',
    source_urls = '["https://www.eatout.co.za/venue/rare-grill/", "https://www.raregrill.co.za/", "https://www.eatout.co.za/article/rare-grill-harfield-villages-best-kept-secret-reviewed/"]'
WHERE slug = 'rare-grill-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Redemption Burgers is a small burger counter tucked inside The Old Biscuit Mill in Woodstock, known for craft burgers, coffee and breakfasts made with locally sourced ingredients and creative toppings.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://theoldbiscuitmill.co.za/tenants/redemption-burgers/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d6451335-Reviews-Redemption_Burgers-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/redemption-burgers/"]'
WHERE slug = 'redemption-burgers-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rex Hardware is a general hardware store at Bergsig Centre in Stellenberg, opposite Stellenberg Primary School, stocking plumbing, painting, gardening and lighting supplies, and has traded from the same location for more than 20 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/rex-hardware/291246", "https://westerncape.mzansi24.co.za/directory-mzansi24/listings/rex-hardware/", "https://za.asklaila.com/listing/Cape-Town/stellenberg/rex-hardware/um2chxuA/"]'
WHERE slug = 'rex-hardware-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Riley Incorporated is a Wynberg law firm established in 1991, offering criminal litigation, personal injury, commercial litigation and conveyancing services from its Rosmead Avenue offices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.jfrlaw.co.za/", "https://cape-town.infoisinfo.co.za/card/riley-inc/297070", "https://www.southafricanlawyer.co.za/law-firm/riley-incorporated/western-cape/"]'
WHERE slug = 'riley-incorporated-wynberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rizelli is a fashion boutique at Cape Quarter Lifestyle Village stocking brands including Havaianas, Paez, Levi''s, Goliath, Silent Theory, Roberto Morino and Mazeretta.',
    description_enriched_at = datetime('now')
WHERE slug = 'rizelli-fashion-de-waterkant' AND description_enriched_at IS NULL;
