-- Job 4: description enrichment sweep, checkpoint 2 (10 businesses)

UPDATE businesses
SET description = 'Park Health is a general medical practice inside Golden Acre Shopping Centre, offering GP consultations, preventative care and minor procedures, including circumcisions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=25751", "https://za.linkedin.com/company/park-health-medical-centres", "https://www.parkhealthmedicentres.co.za/doctors-near-you/"]'
WHERE slug = 'park-health-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Partners Hair Design is a full-service hair salon in Gardens Shopping Centre offering cuts, colour and keratin treatments, with walk-ins welcome and professional product lines including Kerastase, Redken and Moroccanoil.',
    description_enriched_at = datetime('now')
WHERE slug = 'partners-hair-design-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pathcare Sea Point is a pathology laboratory and blood-draw branch on the third floor of The Point, offering routine blood tests and specimen collection.',
    description_enriched_at = datetime('now')
WHERE slug = 'pathcare-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Peacock Tea & Coffee is a proudly South African coffee and tea shop in Rondebosch Main Centre, offering freshly ground coffee, a range of teas and a small selection of cakes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'peacock-tea-coffee-rondebosch' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pete''s Pizzas is a wood-fired pizza takeaway inside IPIC Shopping Centre, Kenridge.',
    description_enriched_at = datetime('now')
WHERE slug = 'petes-pizzas-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Philip Wulfsohn Jewellery is a fine jewellery boutique in Cape Quarter, De Waterkant, handcrafting bespoke and ready-made pieces in gold, platinum and silver since 1992.',
    description_enriched_at = datetime('now')
WHERE slug = 'philip-wulfsohn-jewellery-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Photo Booth World is a photo booth hire company based in Boston, Bellville, established in 2016 and offering touch-screen booths, instant prints and props for events.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat 09:00-13:00, Sun Closed',
    source_urls = '["https://www.bestdirectory.co.za/business-directory-business-listings-in-western-cape/bellville.html", "https://www.photoboothworld.co.za/", "https://www.yellosa.co.za/company/977630/photo-booth-world"]'
WHERE slug = 'photo-booth-world-boston' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Gardens is a supermarket branch of the national retail chain, trading from Gardens Shopping Centre on Mill Street.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-20:00, Sat 08:00-19:00, Sun 08:00-12:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pick-n-pay-mill-street-gardens-cape-town/27485", "https://vymaps.com/ZA/Pick-n-Pay-Gardens-162802/", "https://www.gardensshoppingcentre.co.za/stores/pick-n-pay/"]'
WHERE slug = 'pick-n-pay-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Waterstone Village is a supermarket branch of the national retail chain, trading from the Waterstone Village centre on the corner of the R44 and Main Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Rondebosch is a supermarket branch of the national retail chain, trading from Rondebosch Main Shopping Centre on Main Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-21:00, Sun 09:00-21:00',
    source_urls = '["https://www.cybo.com/ZA-biz/pick-n-pay-rondebosch", "https://www.rondeboschonline.co.za/item/pick-n-pay-rondebosch/", "https://my-catalogue.co.za/stores/rondebosch/pick-n-pay/main-rd"]'
WHERE slug = 'pick-n-pay-rondebosch' AND description_enriched_at IS NULL;
