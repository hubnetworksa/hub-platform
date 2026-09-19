UPDATE businesses
SET description = 'New Holland Limpopo''s Polokwane branch sells New Holland agricultural machinery, including tractors ranging from compact to heavy-duty models, combines and other farm equipment, serving the Capricorn District.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00',
    source_urls = '["https://nhlimpopo.co.za/contact/", "https://www.cylex.net.za/company/new-holland-limpopo--polokwane-23866645.html", "https://nhlimpopo.co.za/products-services/"]'
WHERE slug = 'new-holland-limpopo-polokwane-magna-via' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Polokwane Feeds supplies livestock feed, pet food and other animal care products from its Industria store, with an online store and local delivery available across Polokwane.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://polokwanefeeds.co.za/contact-us/", "https://www.goafricaonline.com/za/1340877-polokwane-feeds", "https://polokwanefeeds.co.za/online-store/"]'
WHERE slug = 'polokwane-feeds-industria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Roof King Waterproofing Specialists is a family-owned waterproofing and painting contractor based in Fauna Park that has served corporate and residential clients across Polokwane for over 27 years.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat-Sun By appointment',
    source_urls = '["https://polokwane.infoisinfo.co.za/card/roof-king-waterproofing-specialists/495294", "https://www.yellosa.co.za/company/684345/roof-king-waterproofing-specialists-cc", "https://roofking.co.za/"]'
WHERE slug = 'roof-king-waterproofing-specialists-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Rubberproof Tech has provided liquid rubber waterproofing, backed by a 10-year guarantee, for roofs and concrete surfaces in Polokwane Central since 2015, alongside related painting and building maintenance work.',
    description_enriched_at = datetime('now')
WHERE slug = 'rubberproof-tech-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sizabantu Piping Systems'' Limpopo Division, opened in Laboria in 2003, manufactures and distributes plastic pipe solutions for the agricultural, civil infrastructure, mining and industrial sectors, and has grown into the largest plastic pipe distributor in Limpopo.',
    description_enriched_at = datetime('now')
WHERE slug = 'sizabantu-piping-systems-limpopo-division-laboria' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Snyman Voere supplies day-old chicks and layer, pullet, broiler, cattle, sheep, horse and game feed from its Ladine premises, along with animal medication, sawdust and technical advice for farmers.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearfinderza.com/business/limpopo/polokwane/snyman-voere_86540+9.html", "https://www.thinklocal.co.za/biz/snyman-voere-polokwane", "https://www.brabys.com/za/limpopo/polokwane/ladine/cattle-feeds/snyman-voere"]'
WHERE slug = 'snyman-voere-ladine' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TC Roof Erectors supplies and fits prefabricated roof trusses and roof covering, and also offers waterproofing and the painting of walls, ceilings and roofs, from its Polokwane Central base.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.snupit.co.za/polokwane/central/t-c-roof-erectors/532973", "https://polokwane.infoisinfo.co.za/card/tc-roof-erectors/806106", "https://www.procompare.co.za/providers/tc-roof-erectors"]'
WHERE slug = 'tc-roof-erectors-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TTS Polokwane is a Massey Ferguson tractor dealership in Magna Via, selling new tractors, haymaking equipment, loaders and sprayers, and offering genuine AGCO parts along with workshop or on-farm servicing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-17:00, Sat 07:30-12:00'
WHERE slug = 'tts-polokwane-magna-via' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tax Saviour (Pty) Ltd is an accounting and tax advisory firm, founded in 2017, offering accounting, taxation, consulting and business advisory services to businesses, individuals, trusts and non-profits from its Polokwane Central office.',
    description_enriched_at = datetime('now')
WHERE slug = 'tax-saviour-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Tax Shop Polokwane West provides accounting, payroll, bookkeeping and tax services for individuals and businesses in Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-tax-shop-polokwane-west-bendor' AND description_enriched_at IS NULL;
