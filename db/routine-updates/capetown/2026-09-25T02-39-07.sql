UPDATE businesses
SET description = 'Snuffel & Snuif is a home-industry bakery in IPIC Shopping Centre, Kenridge, Durbanville, specialising in home-baked biscuits, cakes and other sweet treats alongside home craft and gift items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed',
    source_urls = '["https://brabys.com/za/western-cape/durbanville/kenridge/bakers-confectioners/snuffel-snuif", "https://www.africanadvice.com/1340728/Bakery_Pastry_Shops/Western_Cape/Snuffel_And_Snuif/", "https://www.facebook.com/Ipickenridge/posts/from-biscuits-to-cakes-snuffel-en-snuif-brings-all-the-sweet-treats-you-need-to-/1228067365985007/"]'
WHERE slug = 'snuffel-and-snuif-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sonstraal Superspar is a supermarket in IPIC Shopping Centre, Kenridge, Durbanville, stocking groceries, fresh produce and household essentials for everyday and weekly family shopping.',
    description_enriched_at = datetime('now')
WHERE slug = 'sonstraal-superspar-kenridge' AND description_enriched_at IS NULL;
