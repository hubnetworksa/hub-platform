-- Description enrichment, batch 06 (interactive session, per owner request
-- 2026-09-02 to push job 4 forward as fast as possible). Continues the
-- alphabetical backlog (description_enriched_at IS NULL). Each business
-- researched individually via WebSearch/WebFetch by parallel research
-- agents; "researched" ones cite what was actually found and append new
-- source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed',
  source_urls = '["http://absolute-solar.co.za/", "https://www.homemakersonline.co.za/listings/absolute-solar-solutions/"]',
  description = 'Absolute Solar Solutions is the sister company of Absolute Chilled and a qualified PV GreenCard installer, providing turnkey solar solutions in Hennopspark including solar panels, lithium-ion batteries, inverters and charge controllers, with free onsite consultations across Gauteng.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-solar-solutions-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  source_urls = '["scraped:google-places-no-website", "https://abundantlifecoaching.co.za/"]',
  description = 'Abundant Life Coaching is run by founder and head coach Du Waal Engelbrecht, offering a Christian-based 10-week life transformation coaching program for clients ranging from teenagers to pensioners.',
  description_enriched_at = datetime('now')
WHERE slug = 'abundant-life-coaching-du-waal-engelbrecht-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acassia Group and Holdings (Pty) Ltd is an estate agency based in Heatherview, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'acassia-group-and-holdings-pty-ltd-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Access Consulting Engineers is a 100% black-owned multi-disciplinary engineering and advisory firm, established in 2015, delivering services across the energy, mining, local government, property, transportation and water sectors from its Monument Park office.',
  description_enriched_at = datetime('now')
WHERE slug = 'access-consulting-engineers-monument-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  source_urls = '["http://accolade-consulting.co.za/", "https://www.brabys.com/za/gauteng/centurion/doringkloof/it-services/accolade-consulting-pty-ltd"]',
  description = 'Accolade Consulting is a Level 2 BBBEE-rated IT services company with 23 years of experience, providing Microsoft 365, SharePoint, Power BI and SQL Server implementation, custom application development, network infrastructure and security systems such as CCTV and access control from its Die Hoewes office.',
  description_enriched_at = datetime('now')
WHERE slug = 'accolade-consulting-die-hoewes' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri Open to public',
  description = 'Accolades Decor has been providing wedding and event decor styling and rentals since 2010, offering full styling packages plus individual hire of items such as draping, flowers, staging, dancefloors, cakes and lighting from its Elardus Park office.',
  description_enriched_at = datetime('now')
WHERE slug = 'accolades-decor-elardus-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accommodation 4 SA is an online accommodation listings and directory platform, operated as a division of African Online Marketing, connecting travellers with hotels, guesthouses, lodges, campsites and self-catering properties across southern Africa.',
  description_enriched_at = datetime('now')
WHERE slug = 'accommodation-4-sa-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Account-A-Bill is a business consulting practice operating out of Wapadrand, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'account-a-bill-wapadrand' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accountants in Motion (AIM) has provided accounting, payroll, tax, audit and financial planning services since 2015, serving over 3500 clients through IRBA-registered auditors, from its Pretoria branch in Lynnwood Glen''s Glen Gables office park.',
  description_enriched_at = datetime('now')
WHERE slug = 'accountants-in-motion-aim-pretoria-lynnwood-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = '08:00-17:00',
  description = 'Accounting Avenue is an accounting firm with roughly 20 years of experience, offering accounting, tax, payroll and statutory compliance services including CIPC filings and tax registrations from its Erasmuskloof office.',
  description_enriched_at = datetime('now')
WHERE slug = 'accounting-avenue-erasmuskloof' AND description_enriched_at IS NULL;
