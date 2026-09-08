-- Description enrichment, batch 18 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Alanya Brokers (Pty) Ltd is an insurance brokerage based in Erasmia, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'alanya-brokers-pty-ltd-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 07:00-16:00, Sat-Sun Closed',
  description = 'Alberts Advisory is an accounting and tax advisory firm in Meyerspark, Pretoria, led by CIMA-qualified chartered accountant Martin Alberts and SAIPA-registered professional accountant Rene Alberts, offering bookkeeping, tax returns, payroll and cash flow forecasting services.',
  description_enriched_at = datetime('now')
WHERE slug = 'alberts-advisory-meyerspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Albertyn Consulting is a business consulting firm based in Wierdapark, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'albertyn-consulting-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alchemy Engineers is a computer and IT services business based in Erasmuskloof, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'alchemy-engineers-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This branch of Aldes Business Broker (trading as Aldes Infinity) is led by principal Chris Ferguson, an Independent Certified Financial Planner with a background at Standard Bank structuring large institutional investments, who now helps clients buy and sell small and medium businesses.',
  source_urls = '["scraped:google-places-no-website", "https://aldes.co.za/broker/chris-ferguson"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aldes-business-broker-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aldes Business Brokers Pty Ltd is part of the established Aldes business brokerage network, helping clients buy and sell businesses across sectors such as retail, manufacturing, franchises and property, and offers free business valuations.',
  description_enriched_at = datetime('now')
WHERE slug = 'aldes-business-brokers-pty-ltd-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aldes Orion Business Brokers is the Lynnwood Manor branch of the Aldes Business Brokers network, a franchised firm specialising in helping clients buy and sell small to medium businesses.',
  source_urls = '["http://www.bizxchange.co.za/", "https://aldes.co.za/contact-us"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aldes-orion-business-brokers-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'The Wonderboom branch of Alectra Solutions is the company''s flagship security shop, supplying security and automation products such as gate motors, CCTV systems, electric fencing, intercoms and garage door operators to homeowners and trade installers since 2012.',
  hours = 'Mon-Sun 08:00-16:45',
  description_enriched_at = datetime('now')
WHERE slug = 'alectra-solutions-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alers Jungle Gyms has been manufacturing children''s jungle gyms since 1989, and its Sunderland Ridge premises serve as the family business''s headquarters where customers can view and test equipment such as swings, slides and balancing gear before buying or renting.',
  hours = 'Mon-Thu 08:00-16:30, Fri 08:00-15:00',
  description_enriched_at = datetime('now')
WHERE slug = 'alers-jungle-gyms-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alessa Trading is a Pretoria-based hardware distributor supplying items such as locks, hinges, bolts and welding rods, alongside decorative steel castings, catering equipment and aluminium furniture.',
  description_enriched_at = datetime('now')
WHERE slug = 'alessa-trading-cc-kameeldrift' AND description_enriched_at IS NULL;
