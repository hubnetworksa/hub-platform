-- Job 4: description enrichment sweep, batch 1 of 2 (10 businesses)

UPDATE businesses
SET description = 'Bistro31 Bar & Eatery is the in-house restaurant and bar of the DoubleTree by Hilton Cape Town Upper Eastside hotel, serving breakfast, lunch and dinner with tapas, salads, burgers and steak alongside a full bar and cocktail menu.',
    description_enriched_at = datetime('now'),
    hours = 'Restaurant 06:30-23:00 daily, Bar 11:00-01:00 daily',
    source_urls = '["https://www.dineplan.com/restaurants/bistro31-at-upper-eastside", "https://www.facebook.com/bistro31woodstock/", "https://www.hilton.com/en/hotels/cptuedi-doubletree-cape-town-upper-eastside/dining/"]'
WHERE slug = 'bistro31-bar-eatery-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger XS Salt River is a branch of the Bootlegger Coffee Company chain on Brickfield Road, serving specialty-grade coffee for all-day breakfast, lunch and brunch, with dine-in, takeaway and free wifi available.',
    description_enriched_at = datetime('now')
WHERE slug = 'bootlegger-xs-salt-river-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'La Grange Interiors is a curated furniture and decor destination in Woodstock Quarter offering luxury soft furnishings, antiques and globally sourced or custom-designed pieces, alongside interior design and concept services; the brand was established in 1996 in a Franschhoek barn before opening this Cape Town showroom in 2015.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-17:00, Fri 09:00-16:00, Sat 09:30-13:00, Sun Closed',
    source_urls = '["https://lagrangeinteriors.co.za/contact-us/", "https://swish.co.za/news/la-grange-interiors-have-opened-their-beautiful-new-store-at-woodstock-quarter", "https://www.cape-town-info.co.za/region/business/33304/la-grange-interiors-luxury-furniture-and-interior-design", "https://visi.co.za/new-la-grange-showroom-in-cape-town/"]'
WHERE slug = 'la-grange-interiors-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lekker Vegan is a plant-based comfort-food restaurant on Harrington Street known for its vegan gatsbys, burgers and soft serve; it does not take table bookings but is available via UberEats, Mr D Food and OrderIn.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 11:00-22:00, Fri 11:00-15:00, Sat 12:00-15:00, Sun 12:00-22:00',
    source_urls = '["https://www.ubereats.com/za/store/lekker-vegan-harrington-street/QzrGG1aiRGu3wwCOK4ue6Q", "https://www.dining-out.co.za/md/Lekker-Vegan-Harrington/10093", "https://www.capetownmagazine.com/lekker-vegan"]'
WHERE slug = 'lekker-vegan-zonnebloem' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Letitia Bloemiste/Florist is a florist based in Strand Pavilion that supplies and delivers flowers for all occasions across Strand, Gordon''s Bay and Somerset West.',
    description_enriched_at = datetime('now')
WHERE slug = 'letitia-bloemiste-florist-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mantelli''s Direct Westlake is a factory-direct outlet of the Mantelli''s biscuit and rusk brand, selling individually wrapped biscuits, rusks and cookies at factory prices in food-service and retail packs, including Kosher and Halal options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:30-16:30'
WHERE slug = 'mantellis-direct-westlake' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mark One Hair Design is a hair salon in Strand Pavilion offering cut and colour services including balayage and keratin treatments, in business for more than 30 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:30-13:00, Tue-Fri 08:30-17:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/mark-one-hair-design-western-cape-cape-town-A8P6Nb", "https://www.thinklocal.co.za/biz/mark-one-hair-design-strand", "https://www.facebook.com/mark.one.design"]'
WHERE slug = 'mark-one-hair-design-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a value fashion and homeware retailer with a branch in Strand Square, Strand.',
    description_enriched_at = datetime('now')
WHERE slug = 'mr-price-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA is a stationery, books and office-supplies retailer with a branch in Strand Square, Strand.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:30, Sat 08:00-16:00, Sun & PH 09:00-14:00',
    source_urls = '["https://pna.co.za/store-locator/pna-strand/", "https://za.africabz.com/western-cape/pna-strand-133707", "https://strandsquarecentre.co.za/stores/"]'
WHERE slug = 'pna-strand-square-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PNA is a stationery, books and office-supplies retailer with a branch in Mountain View Shopping Centre, Gordon''s Bay.',
    description_enriched_at = datetime('now')
WHERE slug = 'pna-gordons-bay' AND description_enriched_at IS NULL;
