UPDATE businesses
SET description = 'Shimansky is a diamond and fine jewellery boutique in Victoria Wharf Shopping Centre, V&A Waterfront, offering bespoke pieces crafted from GIA-certified diamonds with an on-site view of master diamond cutters and goldsmiths at work.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00'
WHERE slug = 'shimansky-victoria-wharf-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is a supermarket in Golden Acre Shopping Centre in Cape Town CBD, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Bellville is a supermarket on Voortrekker Road in Bellville, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:30, Sat 08:00-15:00, Sun 09:00-14:00',
    source_urls = '["https://www.shoprite.co.za/Western-Cape/Bellville/Shoprite-Bellville/store-details/1048", "https://hombaze.co.za/shoprite-bellville-16898743256480065933/", "https://za.africabz.com/western-cape/shoprite-bellville-58147", "https://my-catalogue.co.za/stores/bellville/shoprite/147-voortrekker-rd"]'
WHERE slug = 'shoprite-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Durbanville is a supermarket in Durbanville Town Centre, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Mowbray is a supermarket on Main Road in Mowbray, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Parow is a supermarket on Voortrekker Road in Parow, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Retreat is a supermarket on the corner of 8th Avenue and Retreat Road in Retreat, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-20:00, Sun 08:00-17:00'
WHERE slug = 'shoprite-retreat-retreat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Southfield is a supermarket on Victoria Road in Southfield, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Side Step is a fashion footwear store in Golden Acre Shopping Centre, Cape Town CBD, part of a South African footwear retail chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'side-step-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Signature Cosmetics is a cosmetics and fragrance store in Golden Acre Shopping Centre, Cape Town CBD, part of a Southern African chain of niche cosmetics and toiletry retailers.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'signature-cosmetics-golden-acre-cape-town-cbd' AND description_enriched_at IS NULL;
