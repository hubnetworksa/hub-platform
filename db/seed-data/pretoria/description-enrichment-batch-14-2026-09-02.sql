-- Description enrichment, batch 14 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Africasolutionlaboratory is an industrial supplier and manufacturing business based in Buffelsdrift, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'africasolutionlaboratory-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Afrozone Logistics is a logistics, courier and transport company based in De Wilgers, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'afrozone-logistics-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agbiz Grain is the grain-handling industry division of Agbiz, the Agricultural Business Chamber of South Africa, representing the grain storage and handling sector through training, quality standards and industry publications.',
  description_enriched_at = datetime('now')
WHERE slug = 'agbiz-grain-the-willows' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agemn Consulting & Projects is a technology consulting and projects firm on Kniehalter Avenue in Erasmuskloof, whose tagline is When technology meets humanity.',
  source_urls = '["scraped:google-places-no-website","http://www.agemn.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agemn-consulting-projects-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agile Bridge is a Pretoria-based software development firm specialising in custom software for enterprise and business applications, mobile app development, and team capacity augmentation with skills in AI/ML, cloud architecture and DevOps.',
  description_enriched_at = datetime('now')
WHERE slug = 'agile-bridge-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agility Management Consulting is a business consulting firm based in Amberfield, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'agility-management-consulting-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agora Ducting Manufacturers, based in Koedoespoort Industrial, manufactures and supplies industrial, commercial and residential ductwork, including custom ventilation systems and components such as transitions, bends and plenum boxes.',
  description_enriched_at = datetime('now')
WHERE slug = 'agora-ducting-manufacturers-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agrément South Africa, based in the INFOTECH Building on Arcadia Street in Hatfield, is a public entity established in 1969 that evaluates and certifies non-standardised construction products and building systems for fitness of purpose.',
  source_urls = '["scraped:google-places-no-website","https://agrement.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agr-ment-south-africa-infotech-building-bryntirion' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AgriCAD (Pty) Ltd supplies agricultural implements organised by farming stage, including deep rippers for land preparation, fertilizer spreaders with augers for planting, and grain hoppers for harvesting.',
  description_enriched_at = datetime('now')
WHERE slug = 'agricad-pty-ltd-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agricoal, based in Monument Park, provides turnkey logistics solutions including fleet operations and bulk and bagged transport, with more than 12 years of experience operating across nine-plus Southern African regions.',
  description_enriched_at = datetime('now')
WHERE slug = 'agricoal-monument-park' AND description_enriched_at IS NULL;
