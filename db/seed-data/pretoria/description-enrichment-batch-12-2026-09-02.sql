-- Description enrichment, batch 12 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Adcel Consulting Pty is a business consulting firm based in Die Hoewes, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'adcel-consulting-pty-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Add-Sure Insure is an insurance brokerage in Riviera offering cover for houses, household contents and vehicles.',
  source_urls = '["scraped:google-places-no-website","https://www.snupit.co.za/pretoria/riviera/add_sure-insurance-brokers/72960"]',
  description_enriched_at = datetime('now')
WHERE slug = 'add-sure-insure-riviera' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Addfin is a team of accountants in Monument Park offering accounting and back-office administration, auditing, payroll, budgeting, company tax planning and financial statement services to clients across industries.',
  description_enriched_at = datetime('now')
WHERE slug = 'addfin-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AddVantage is a business consulting firm based in Rietondale, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'addvantage-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adek is a Wapadrand-based estate agency, auctioneer and property developer that has operated since 1972, offering residential, commercial and agricultural property sales as well as auctioneering across Gauteng.',
  source_urls = '["http://www.adek.co.za/","https://www.adek.co.za/about-us","https://www.yep.co.za/biz/store/iyp/17054245_2"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adek-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adelaars Restaurant & Venue is a family-style restaurant and pub in Wonderboom South that also operates as an event and function venue.',
  hours = 'Mon-Thu 10:00-22:00, Fri-Sat 09:00-22:00, Sun 09:00-17:00',
  source_urls = '["https://www.facebook.com/share/1B8VrxzzDU/?mibextid=qi2Omg", "https://wanderlog.com/place/details/10414679/adelaars-restaurant--venue"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adelaars-restaurant-venue-wonderboom-south' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Centurion branch of Adendorff Machinery Mart, in Rooihuiskraal North, supplies tools and machinery including generators, air compressors, welding equipment and woodworking machinery direct to the public.',
  hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  source_urls = '["https://www.adendorff.co.za/", "https://www.tiendeo.co.za/stores/centurion/adendorff-machinery-mart-shop-miracle-retail-park-old-johannesburg-road-rooihuiskraal-north/49981"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adendorff-machinery-mart-centurion-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Pretoria branch of Adendorff Machinery Mart, on the corner of Steve Biko and Adcock Street in Gezina, sells tools and machinery including power tools, hand tools, compressors and generators direct to the public.',
  hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  source_urls = '["https://www.adendorff.co.za/", "https://www.tiendeo.co.za/stores/pretoria/adendorff-machinery-mart-steve-biko-road/25232"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adendorff-machinery-mart-pretoria-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Adendorff Machinery Mart branch at Silver Oaks Crossing in Pretoria East stocks tools and machinery such as generators, air compressors, welding equipment and woodworking machinery.',
  hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  source_urls = '["https://www.adendorff.co.za/", "https://www.tiendeo.co.za/stores/pretoria/silver-oaks-crossing-cnr-solomon-mahlangu-von-backstrom-blvd-pretoria-east-pretoria/49988"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adendorff-machinery-mart-silver-lakes-pretoria-east-kameeldrift-east' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AdjustPro is an independent, 100% black-owned insurance loss adjusting firm in Eersterust, founded by Alison Jafta, who brings over 46 years in the insurance industry including 32 years in loss adjusting.',
  description_enriched_at = datetime('now')
WHERE slug = 'adjustpro-eersterust' AND description_enriched_at IS NULL;
