-- Description enrichment, batch 11 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Active TV & Video is a Multichoice-accredited installer offering DStv, Xtra View and Single View installations, plus repairs for TVs, decoders, microwaves, hi-fis and other electronics from its Rubida Street premises in Murrayfield.',
  hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  source_urls = '["scraped:google-places-no-website","https://www.fyple.co.za/company/active-tv-and-video-18esl4o/","http://www.dstvpretoria.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'active-tv-video-murrayfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acu-turn is a close corporation that has operated from its Mosaic Road premises in Silvertondale since being registered in 1986.',
  source_urls = '["scraped:google-places-no-website","https://b2bhint.com/en/company/za/acu-turn--B1986020421"]',
  description_enriched_at = datetime('now')
WHERE slug = 'acu-turn-silvertondale' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acubenne (Pty) Ltd is a business consulting firm in Die Hoewes offering strategy and operational consulting, business analysis and intelligence, and virtual assistant services such as bookkeeping, IT support and digital marketing.',
  description_enriched_at = datetime('now')
WHERE slug = 'acubenne-pty-ltd-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acute Accountants is a cloud-based accounting firm with more than two decades of experience, providing monthly accounting, payroll, tax and SARS debt negotiation services from its Rubenstein Drive office in Moreleta Park.',
  hours = 'Mon-Fri 08:00-16:30, Sat-Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'acute-accountants-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ad Beam is a marketing and advertising agency based in Heuwelsig Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'ad-beam-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ad-Luck Holdings is an education provider based in Midstream Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'ad-luck-holdings-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ad-u-list is a business consulting firm based in Elardus Park, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'ad-u-list-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adab Services (Pty) Ltd is a building and construction company based in Heuwelsig Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'adab-services-pty-ltd-heuwelsig-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adams & Adams is a leading African law firm specialising in intellectual property, commercial law, real estate and dispute resolution, with its head office of more than 100 attorneys based at Lynnwood Bridge.',
  hours = 'Mon-Fri 08:00-16:30',
  source_urls = '["https://www.openstreetmap.org/node/11533729509","https://www.adams.africa/contact-us/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adams-adams-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adapt Management Consulting is a Pretoria-based advisory firm specialising in banking and finance, agri-business development, trade and investment facilitation, and government policy advisory, operating from Beckett Street in Arcadia.',
  description_enriched_at = datetime('now')
WHERE slug = 'adapt-management-consulting-riviera' AND description_enriched_at IS NULL;
