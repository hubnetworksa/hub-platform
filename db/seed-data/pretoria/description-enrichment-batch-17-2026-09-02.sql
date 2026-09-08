-- Description enrichment, batch 17 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Ajins Enterprises is a printing services provider based in Rietondale, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'ajins-enterprises-pty-ltd-rietondale' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ajmer Butchery at Eldo Square is a halal butchery in Eldo Glen, Centurion, offering a range of quality meats and expertly cut selections.',
  source_urls = '["https://za.africabz.com/gauteng/ajmer-butchery-eldosquare-218256", "https://www.findglocal.com/ZA/Centurion/103338368764357/Ajmer-Butchery-at-EldoSquare", "https://nearbyza.com/place/ajmer-butchery-1"]',
  description_enriched_at = datetime('now')
WHERE slug = 'ajmer-butchery-eldoglen-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aka Design, founded by Amanda in Amberfield, Centurion, is a freelance interior design consultancy with over a decade of experience, specialising in kitchen and bathroom renovations, bedroom design and custom home layouts for homeowners, contractors and architects.',
  source_urls = '["http://www.akadesign.co.za/", "https://givingmore.co.za/aka-design"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aka-design-pty-ltd-amberfield-valley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Akani Real Estate (also listed as Akani Realty) is a residential property sales and rental agency based in The Hills Estate, Pretoria East, with listings across estates including The Hills, Faerie Glen, Montana and Waterfall.',
  source_urls = '["scraped:google-places-no-website", "https://www.privateproperty.co.za/estate-agency/akani-real-estate/12773"]',
  description_enriched_at = datetime('now')
WHERE slug = 'akani-real-estate-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Sat 08:00-17:00',
  description = 'Akani Systems is a telecommunications and IT infrastructure firm in Midstream Estate, Centurion, specialising in IP telephony, network design, VoIP/SIP integration, fibre and wireless connectivity and custom software development for businesses across Africa.',
  description_enriched_at = datetime('now')
WHERE slug = 'akani-systems-pty-ltd-midstream-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 07:30-17:30, Sat 08:00-15:00, Sun 09:00-13:00, Public Holidays 09:00-16:00',
  description = 'Akarnia Hardware + Build, established in 2016, is a DIY and hardware retailer in Kloofsig, Centurion, stocking tools, building materials, paint, plumbing and garden supplies, with its own delivery fleet serving Gauteng and a hands-on, one-on-one approach to customer service.',
  description_enriched_at = datetime('now')
WHERE slug = 'akarnia-hardware-build-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Akili System is a software development business based in Celtisdal, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'akili-system-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aklex Bricks (Pty) Ltd manufactures and supplies bricks from its premises in the Klerksoord Industrial Area, Pretoria.',
  source_urls = '["http://www.aklex.co.za/", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/aklex-bricks-pty-ltd"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aklex-bricks-klerksoord' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Al Faris Perfumes specialises in premium attar and perfume oils, including oud and amber musk attars and handcrafted bakhoor burners, sold online with a local collection point in Laudium and nationwide delivery.',
  description_enriched_at = datetime('now')
WHERE slug = 'al-faris-perfumes-laudium' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alanka Fabrics is an industrial fabric supply business based in Heuwelsig Estate, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'alanka-fabrics-heuwelsig-estate' AND description_enriched_at IS NULL;
