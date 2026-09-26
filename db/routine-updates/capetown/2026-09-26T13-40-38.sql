-- Job 4: description enrichment sweep, batch 1 of 2 (10 records)
UPDATE businesses
SET description = 'Absa is a bank branch located inside Longbeach Mall, offering everyday banking services to the Noordhoek area.',
    description_enriched_at = datetime('now')
WHERE slug = 'absa-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets is a pet supplies and accessories retailer inside Longbeach Mall, serving pet owners in Noordhoek.',
    description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'All Things Earthly is an organic and ethical grocery and lifestyle shop in Noordhoek Farm Village, stocking locally grown produce, preservative-free groceries, natural body-care products and eco-friendly household goods.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/all-things-earthly-310081", "https://thefarmvillage.co.za/all-things-earthly/", "https://www.capetownetc.com/things-to-do-cape-town/all-things-earthly-sustainable-living/"]'
WHERE slug = 'all-things-earthly-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fat Cats and Dogs is a pet store in Noordhoek Farm Village, stocking food and supplies for cats and dogs.',
    description_enriched_at = datetime('now')
WHERE slug = 'fat-cats-and-dogs-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kalk Bay Books is an independent bookshop in the seaside village of Kalk Bay, trading since 2006 and stocking a curated range of new and used fiction and non-fiction for all ages.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00',
    source_urls = '["https://za.africabz.com/western-cape/kalk-bay-books-243723", "https://www.sa-venues.com/things-to-do/westerncape/kalk-bay-books/", "https://kalkbaybooks.co.za/"]'
WHERE slug = 'kalk-bay-books-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kristen''s Kick Ass Ice Cream is an artisanal ice-cream shop in Noordhoek Farm Village, its original location since opening in 2015, making handcrafted ice cream from scratch using local dairy.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-17:00',
    source_urls = '["https://thefarmvillage.co.za/kristens-kick-ass-ice-cream/", "https://www.eatout.co.za/venue/kristens-kick-ass-ice-cream/", "https://www.eatout.co.za/article/cape-towns-newest-scoop-shop-kristens-kick-ass-ice-cream/"]'
WHERE slug = 'kristens-kick-ass-ice-cream-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Makemba Boutique is a bohemian designer shop at Imhoff Farm, selling limited-edition, slow-fashion clothing, leather accessories, macrame pieces and handcrafted jewellery.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://imhofffarm.co.za/makemba-boutique/", "https://www.instagram.com/makembaboutique/", "https://crushmag-online.com/so-much-to-do-at-the-revamped-imhoff-farm-in-kommetjie/"]'
WHERE slug = 'makemba-boutique-kommetjie' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miladys is a women''s fashion retailer inside Longbeach Mall, Noordhoek.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun 09:00-14:00'
WHERE slug = 'miladys-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Noordhoek Village Tack Shop is an equestrian store in Noordhoek Farm Village, selling horse riding tack, gear and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-17:00'
WHERE slug = 'noordhoek-village-tack-shop-noordhoek' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Positano is an Italian-inspired resort-wear and swimwear boutique handmade in Cape Town, with its first retail store opening in Noordhoek Farm Village in 2023.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://positano.co.za/pages/contact", "https://thefarmvillage.co.za/positano/", "https://positano.co.za/pages/markets"]'
WHERE slug = 'positano-noordhoek' AND description_enriched_at IS NULL;
