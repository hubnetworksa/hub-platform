-- Description enrichment, batch 05 (interactive session, per owner request
-- 2026-09-02 to push job 4 forward as fast as possible). Continues the
-- alphabetical backlog (description_enriched_at IS NULL). Each business
-- researched individually via WebSearch/WebFetch by parallel research
-- agents; "researched" ones cite what was actually found and append new
-- source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Absolute Business Consultants (Pty) Ltd is a business consulting firm based in Amandasig.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-business-consultants-pty-ltd-amandasig' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Absolute Business Partners is an accounting firm based in Waterkloof Glen.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-business-partners-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Absolute Credit Control Services (Pty) Ltd is a business consulting firm based in Eldoraigne, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-credit-control-services-pty-ltd-eldoraigne' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 09:00-17:00',
  source_urls = '["https://absolutehosting.co.za/", "https://absolutehosting.co.za/web-hosting", "https://opening-hours.co.za/04172602/Absolute_Hosting"]',
  description = 'Absolute Hosting is a web hosting provider based in Centurion Golf Estate, providing hosting and related IT services to South African businesses.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-hosting-centurion-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 08:00-17:30, Sat 09:00-14:00, Sun Closed',
  description = 'Absolute Industrial Access (Pty) Ltd specialises in rope access and work-at-height solutions, including roof repairs, waterproofing, concrete repair and confined space cleaning using IRATA-trained technicians.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-industrial-access-pty-ltd-zwartkop' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Absolute Infrastructure (Pty) Ltd is an engineering and surveying firm based in Woodhill Golf Estate.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-infrastructure-pty-ltd-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Sun 08:00-19:00',
  description = 'Absolute Pets Groenkloof is a pet supply store in Groenkloof Plaza stocking food, toys and accessories for dogs, cats and small animals, with wheelchair-accessible entrance and parking.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-groenkloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Sun 08:00-19:00',
  source_urls = '["https://www.absolutepets.com/", "https://pretoria.co.za/place/absolute-pets-hazeldean"]',
  description = 'Absolute Pets Hazeldean stocks a wide range of pet foods, toys and accessories for dogs, cats and other pets, with staff on hand to help customers choose products.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-hazeldean' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Absolute Pets Irene is a pet supply store in Irene Village Mall, Irene Farm Villages, offering pet food, toys and accessories for local pet owners.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-irene-village-mall-irene-farm-villages' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Absolute Purified Water supplies purified water refills and bottled water from 350ml to 25L, along with home and office water dispensers and filter systems with replacement parts.',
  description_enriched_at = datetime('now')
WHERE slug = 'absolute-purified-water-monument-park' AND description_enriched_at IS NULL;
