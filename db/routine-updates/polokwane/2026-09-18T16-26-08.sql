UPDATE businesses
SET description = 'Applebox Accounting is an accounting and tax practice in Bendor, Polokwane, providing bookkeeping, tax and financial services to local businesses and individuals.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed'
WHERE slug = 'applebox-accounting-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Deep Blue Accountants is an accounting and bookkeeping practice in Fauna Park, Polokwane, offering audit, tax and bookkeeping services with an emphasis on personal, hands-on client service.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/deep%20blue%20accountants", "https://www.deepblueaccounts.com/"]'
WHERE slug = 'deep-blue-accountants-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dunns is a Lebowakgomo branch of the Dunns fashion retail chain, part of Pepkor Trading and operating since 1978, selling ladies'', men''s and children''s clothing, footwear, accessories and cellular products.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.facebook.com/DunnsLebowakgomo/", "https://www.ananzi.co.za/ads/za/dunns-stores?page=4", "https://www.dunns.co.za/pages/store-locator-dunns"]'
WHERE slug = 'dunns-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Fanus de Beer Ingelyf is an accounting and auditing practice in Bendor, Polokwane, providing auditing and financial services to local businesses.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat-Sun Closed',
    source_urls = '["https://www.shopshours.co.za/accountants/polokwane", "https://www.infoisinfo.co.za/searchname/fanus%20de%20beer", "https://www.yep.co.za/biz/store/iyp/15377914_2"]'
WHERE slug = 'fanus-de-beer-ingelyf-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Franco Marx Attorneys is a law firm in Bendor, Polokwane, providing legal services to clients in the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'franco-marx-attorneys-bendor-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Frank Phahlane Attorneys is a law practice in Polokwane Central, offering legal services to clients in the area.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed'
WHERE slug = 'frank-phahlane-attorneys-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hennie''s is the Thornhill Shopping Centre branch of the Hennie''s sports bar and grill chain, offering casual pub dining and big-screen sports viewing in Thornhill, Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'hennies-thornhill-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Horak De Bruin Oberholzer Inc is a law firm in Polokwane Central practising conveyancing, notarial and property law, with a history dating back to 1989.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:45-16:30, Fri 07:45-16:00, Sat-Sun Closed',
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/horak%20de%20bruin", "https://www.property24.com/attorneys/de-bruin-oberholzer-attorneys/1262"]'
WHERE slug = 'horak-de-bruin-oberholzer-inc-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Isaiah Nyathi Attorneys Incorporated is a law firm in Fauna Park, Polokwane, specialising in debt recovery and debt collection for clients in the area.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.directory101.co.za/legaldir/index.php?page=item&id=1877", "https://www.thinklocal.co.za/biz/isaiah-nyathi-attorneys-incorporated-pietersburg", "https://www.procompare.co.za/providers/isaiah-nyathi-attorneys-incorporated"]'
WHERE slug = 'isaiah-nyathi-attorneys-incorporated-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jacky Mogashoa Attorneys is a 100% women-run law practice in Polokwane Central, specialising in labour law as well as deceased estate administration, debt collection and road accident claims.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun Closed',
    source_urls = '["https://www.shopshours.co.za/lawyers/polokwane", "https://www.infoisinfo.co.za/searchname/jacky%20mogashoa", "https://www.yep.co.za/biz/store/jacky-mogashoa-attorneys/161530"]'
WHERE slug = 'jacky-mogashoa-attorneys-polokwane-central' AND description_enriched_at IS NULL;
