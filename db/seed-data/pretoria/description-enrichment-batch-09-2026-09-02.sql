-- Description enrichment, batch 09 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'This Ackermans store, shop 76 in Menlyn Park Shopping Centre, sells the retailer''s value-priced clothing and accessories range near the mall''s Orange Parking entrance.',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans store in Jubilee Mall, Hammanskraal sells clothing, shoes and accessories, open Monday to Friday 09:00-18:00 and Saturday 08:30-17:00, closed Sundays.',
  hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-hammanskraal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans store in Blaauw Village on Ben Viljoen Street trades later than most branches, open Monday to Friday 09:00-20:00 and Saturday 09:00-18:00, closed Sundays.',
  hours = 'Mon-Fri 09:00-20:00, Sat 09:00-18:00, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-heatherview' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans branch in Sport Park Centre on Napier Road, Lyttelton Manor trades Monday to Friday 09:00-18:00 and Saturday 08:30-17:00, closed Sundays.',
  hours = 'Mon-Fri 09:00-18:00, Sat 08:30-17:00, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-centurion-lyttelton-manor' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ackermans Gezina Galleries, shop 24 in the Gezina Galleries mall, sells value-priced clothing, footwear and accessories for the whole family.',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-gezina-gezina' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans store at North Park Shopping Centre offers fashion for the whole family, with casual and formal clothing for men, women and children.',
  hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00',
  source_urls = '["https://insly.co.za/biz/ackermans-north-park-mall/deals", "https://pretoria.co.za/listing/ackermans-pretoria-north-park-mall-2/", "https://my-catalogue.co.za/stores/pretoria/ackermans/north-park-shopping-centre-co-rachel-de-beer-burger-st"]',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-north-park-mall-florauna' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This branch is billed as the biggest Ackermans store in Pretoria, stocking fashion for men, women and children at Wonderpark Centre in Karenpark.',
  hours = 'Mon-Fri 09:00-19:00, Sat 08:30-18:00, Sun 09:00-15:00',
  source_urls = '["https://www.ackermans.co.za/", "https://pretoria.co.za/listing/ackermans-pretoria-wonderpark/", "https://my-catalogue.co.za/stores/pretoria/ackermans/wonderpark-centre-co-brits-heinrich-roads-karenpark"]',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-pretoria-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans branch trades from the Bougainville Shopping Centre in Daspoort, offering the chain''s family fashion range for men, women and children.',
  hours = 'Mon-Fri 09:00-20:00, Sat 09:00-18:00, Sun 09:00-17:00',
  source_urls = '["https://www.ackermans.co.za/", "https://my-catalogue.co.za/stores/pretoria/ackermans/bouganville-shopping-centre-cnr-relinghuys-en-jennings-str"]',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-pta-daspoort-bouganville-centre-daspoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans Woman store operates from the Pretoria Centre Walk complex on Pretorius Street in the Pretoria CBD.',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-woman-pretoria-central' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acorn Consulting (PTY) LTD is a business consulting firm based in Centurion Central.',
  description_enriched_at = datetime('now')
WHERE slug = 'acorn-consulting-pty-ltd-centurion-central' AND description_enriched_at IS NULL;
