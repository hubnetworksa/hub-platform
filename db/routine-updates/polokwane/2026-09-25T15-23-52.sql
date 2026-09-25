UPDATE businesses
SET description = 'Cashbuild Baobab Gardens is a branch of the Cashbuild chain, a major Southern African retailer of building materials, timber, cement, bricks, paint, plumbing and hardware supplies for contractors, DIYers and homeowners, located in the Baobab Gardens retail precinct in Thornhill Estate.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://locations.cashbuild.co.za/Retail-Bendor-CashbuildBaobab", "https://x.com/GelmarOnline/status/1955907269117530477", "https://www.cashbuild.co.za/stores"]'
WHERE slug = 'cashbuild-baobab-gardens-thornhill-estate' AND description_enriched_at IS NULL;
