UPDATE businesses
SET description = 'Neighbourgood 84 Harrington is a 4-star aparthotel in District Six offering serviced apartments with kitchens and en-suite bathrooms, alongside a rooftop pool, co-working space and an on-site cafe.', description_enriched_at = datetime('now'), source_urls = '["https://www.booking.com/hotel/za/neighbourgood-84-harrington.html", "https://www.property24.com/to-rent/cape-town-city-centre/cape-town/western-cape/9138/114341578", "https://www.neighbourgood.co/84-harrington"]'
WHERE slug = 'neighbourgood-84-harrington-district-six' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'O on Kloof is a 4-star boutique hotel and spa in Bantry Bay with rooms across three categories, a heated indoor pool, gym and spa, and ocean-facing dining including breakfast and dinner service.', description_enriched_at = datetime('now')
WHERE slug = 'o-on-kloof-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OHMM Face and Beauty is a beauty and wellness spa in the Dean Street Arcade in Newlands, open since 2005 and offering facials, body treatments, nails and aesthetic treatments using premium skincare brands.', description_enriched_at = datetime('now')
WHERE slug = 'ohmm-face-and-beauty-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Our Local is a pet-friendly all-day breakfast and brunch spot in Sea Point, a sister branch of the original Kloof Street restaurant, serving dishes such as shakshuka and avo toast in an eclectic, plant-filled setting.', description_enriched_at = datetime('now'), hours = 'Sun-Wed 08:00-15:30, Thu-Sat 08:00-late'
WHERE slug = 'our-local-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panarottis Claremont is a branch of the Panarottis Italian restaurant chain in the Stanhope Centre, serving pizza and pasta dishes.', description_enriched_at = datetime('now'), hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun and public holidays 09:00-21:00', source_urls = '["https://crave.co.za/establishment.asp?est=16938", "https://2pos.co.za/2/22420", "https://www.tiendeo.co.za/stores/cape-town/panarottis-shop-stanhope-centre-main-rd/66852"]'
WHERE slug = 'panarottis-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Constantia Village is a supermarket in the Constantia Village shopping centre, part of the Pick n Pay grocery chain, stocking groceries, fresh produce and household goods.', description_enriched_at = datetime('now'), hours = 'Sun 08:00-18:00, Mon-Fri 08:00-20:00, Sat 08:00-19:00', source_urls = '["https://constantiavillage.co.za/stores/pick-n-pay/", "https://za.africabz.com/western-cape/pick-n-pay-constantia-29632", "https://openhours-southafrica.com/en/constantia/pick-n-pay-constantia"]'
WHERE slug = 'pick-n-pay-constantia-village-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay 3Arts Village is a supermarket in the 3 Arts Village Shopping Centre in Plumstead, part of the Pick n Pay grocery chain, stocking groceries, fresh produce and household goods.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-19:00, Sat-Sun 08:00-18:00', source_urls = '["https://za.africabz.com/western-cape/pick-n-pay-3arts-village-555613", "https://bitcoinwide.com/pick-n-pay-3arts-village-080b16c0-562c-4ce7-b5eb-5fa6c0eb66df", "https://www.hellopeter.com/pick-n-pay/reviews/pick-n-pay-3-arts-plumstead-closing-times-3870305"]'
WHERE slug = 'pick-n-pay-3arts-village-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Plan B Copy is a large-format copy and digital printing shop in Plumstead, originally established in 2014 and relocated to its current Main Road premises in 2016, serving built-environment professionals and the public with print, copy and digital services.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:00-17:00, Sat Closed', source_urls = '["https://planbcopy.co.za/contact-us/", "https://za.africabz.com/western-cape/plan-b-copy-digital-printing-479912", "https://printshops.co.za/za/western-cape/cape-town/plan-b-copy-digital-printing-plumstead-cape-town-western-cape"]'
WHERE slug = 'plan-b-copy-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PostNet Tokai-on-Main is a courier and business services outlet in the Tokai-on-Main centre, offering domestic and international courier services, document and printing solutions, mailbox rental and office supplies.', description_enriched_at = datetime('now'), hours = 'Mon-Fri 08:30-17:30, Sat 09:00-13:00, Sun and Public Holidays Closed', source_urls = '["https://www.postnet.co.za/stores/tokai", "https://za.readymap.info/4/11476", "https://opening-hours.co.za/02282722/PostNet_Tokai"]'
WHERE slug = 'postnet-tokai-on-main-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Quince is a deli and restaurant inside Little Orchard Nursery in Diep River, opened in 2019 in a restored farmhouse, serving relaxed garden dining alongside a deli counter of pies, quiches and preserves; it is unlicensed, so patrons may bring their own wine.', description_enriched_at = datetime('now')
WHERE slug = 'quince-diep-river' AND description_enriched_at IS NULL;
