UPDATE businesses
SET description = 'Deon Stuart Electronics and Installations is a security and installations specialist in Rocklands, Mitchells Plain, offering alarm systems, CCTV surveillance, garage and gate automation, and network and IP cabling services.',
    description_enriched_at = datetime('now')
WHERE slug = 'deon-stuart-electronics-and-installations-rocklands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Medicare Pharmacy is a retail pharmacy serving the Retreat community in Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'medicare-pharmacy-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Poppys Village is a branch of PEP, South Africa''s largest single-brand clothing, footwear and homeware retailer, trading from Shop 7 in Poppys Village, Retreat.',
    description_enriched_at = datetime('now'),
    hours = 'Sun 09:00-13:00, Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:00-14:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-poppys-village-th-avenue-retreat-road-retreat-cape-town-western-cape/11883", "https://za.africabz.com/western-cape/pep-retreat-190829", "https://nearbyza.com/place/pep-store-65", "https://en.wikipedia.org/wiki/Pep_(store)", "https://www.shopshours.co.za/pep-stores/cape-town/c-57f3cabd47d677c3b27e4668"]'
WHERE slug = 'pep-poppys-village-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Retreat Motor Spares is a motor spares and parts supplier serving Retreat, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'retreat-motor-spares-retreat' AND description_enriched_at IS NULL;
