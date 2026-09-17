UPDATE businesses
SET description = 'Tops at Spar Thornhill is a liquor store inside Thornhill Shopping Centre, stocking beer, cider, spirits, whiskey and wine alongside the adjoining SUPERSPAR, in Thornhill Estate.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://nearfinderza.com/en/business/lp/polokwane/liquor-store/tops-at-spar-thornhill_714396+7.html", "https://www.thinklocal.co.za/biz/tops-at-spar-thornhill-polokwane", "https://my-catalogue.co.za/stores/thornhill/tops-at-spar/cnr-munnik-and-veldspaat-road"]'
WHERE slug = 'tops-at-spar-thornhill-thornhill-estate' AND description_enriched_at IS NULL;
