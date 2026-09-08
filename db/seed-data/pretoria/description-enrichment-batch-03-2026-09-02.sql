-- Description enrichment, batch 03 (interactive session, per owner request
-- 2026-09-02 to push job 4 forward as fast as possible). Continues the
-- alphabetical backlog (description_enriched_at IS NULL). Each business
-- researched individually via WebSearch/WebFetch by parallel research
-- agents; "researched" ones cite what was actually found and append new
-- source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = '{type}DEV is a custom software development studio in Die Hoewes offering application development, technical consulting, staff augmentation, and AI implementation services, working with technologies such as React, Node.js, Java and .NET for clients in fintech, insurtech, banking and healthcare.',
  source_urls = '["https://typedev.io/", "https://typedev.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'type-dev-bronberrik' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bririck Electronics and Construction Company provides electrical and construction services to the Thatchfield Estate area of Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'bririck-electronics-and-construction-company-thatchfield-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aadil Plastics is a plastic bag and packaging materials manufacturer and merchant based in the Sunderland Ridge industrial area of Centurion.',
  source_urls = '["scraped:google-places-no-website", "https://www.sayellow.com/aadil-plastics-centurion"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aadil-plastics-sunderland-ridge' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abacus DIVISIONS is a commercial property firm founded in 2002, operating through three divisions - Commercial Property Broking, Development, and Management - focused on office, retail, and industrial property in the Pretoria and Centurion area.',
  source_urls = '["http://www.abacusdivisions.co.za/", "https://www.property24.com/estate-agents/abacus-divisions/27678"]',
  description_enriched_at = datetime('now')
WHERE slug = 'abacus-divisions-blue-valley-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abacus Verifications (Pty) Ltd is a business consulting firm operating in Muckleneuk, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'abacus-verifications-pty-ltd-muckleneuk' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abacus@work is an accounting firm in Erasmuskloof offering bookkeeping, payroll, accounting, audit, tax advisory, company secretarial, and business consulting services.',
  hours = 'Mon-Fri 08:00-16:00',
  source_urls = '["http://abacusatwork.co.za/", "https://aawa.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'abacus-work-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abbots College in Centurion is a private high school for Grades 8-12 that achieved a 100% matric pass rate in 2022, with top student Zia Hassim earning seven distinctions.',
  source_urls = '["https://about.me/abbotts.college.centurion", "https://www.school-register.co.za/school/abbotts-college-centurion/", "https://www.citizen.co.za/rekord/news-headlines/local-school-news/2023/02/07/abbotts-college-centurion-students-reap-the-fruits-of-their-considerable-efforts/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'abbots-college-centurion' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abdool''s Welding is a welding, general work, and maintenance company in Eersterust handling projects from patio construction and roof painting to industrial and lean-manufacturing work, and operates as a 100% Black male-owned enterprise supporting community job creation and youth apprenticeships.',
  hours = 'Mon-Sat 08:00-17:00, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'abdool-s-welding-eersterust' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abi Ltd is the Hercules, Pretoria manufacturing and distribution facility of Amalgamated Beverage Industries (ABI), part of Coca-Cola Beverages South Africa.',
  source_urls = '["scraped:google-places-no-website", "https://www.ccbc.co.za/business-directory-2/rosslyn-improvement-district/coca-cola-beverages-south-africa"]',
  description_enriched_at = datetime('now')
WHERE slug = 'abi-ltd-pretoria-andeon' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abila International Pty Ltd provides logistics, courier, and transport services from its base in La Montagne, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'abila-international-pty-ltd-la-montagne' AND description_enriched_at IS NULL;
