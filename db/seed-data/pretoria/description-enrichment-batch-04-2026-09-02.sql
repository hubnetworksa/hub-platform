-- Description enrichment, batch 04 (interactive session, per owner request
-- 2026-09-02 to push job 4 forward as fast as possible). Continues the
-- alphabetical backlog (description_enriched_at IS NULL). Each business
-- researched individually via WebSearch/WebFetch by parallel research
-- agents; "researched" ones cite what was actually found and append new
-- source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Abland Property Developers has been developing office, retail, industrial, residential and motor-dealership properties for over three decades, including the Irene Link precinct in Doringkloof where its Centurion office is based.',
  description_enriched_at = datetime('now')
WHERE slug = 'abland-property-developers-pretoria-doringkloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Abode Real Estate Centurion is a residential estate agency offering bond pre-approval, property valuations, and market analysis, active in Centurion and Pretoria suburbs such as Die Hoewes, Rooihuiskraal, Amberfield, and Val-de-Grace.',
  description_enriched_at = datetime('now')
WHERE slug = 'abode-real-estate-centurion-eldo-lakes-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aboo Attorneys is a firm of attorneys providing legal services in Erasmia, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'aboo-attorneys-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'About IT Group, founded in 2003, provides agile business solutions spanning cloud ERP, infrastructure-as-a-service, and data analytics for small to medium enterprises.',
  source_urls = '["https://aboutitgroup.co.za/", "https://www.itweb.co.za/office/aboutitgroup/about"]',
  description_enriched_at = datetime('now')
WHERE slug = 'about-it-group-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'About Workwear, founded in 1992 and based in Hennopspark, supplies branded workwear, corporate wear, PPE, uniforms, work boots, and promotional clothing, along with embroidery and branding services.',
  source_urls = '["https://www.aboutworkwear.co.za/", "https://za.linkedin.com/company/about-workwear"]',
  description_enriched_at = datetime('now')
WHERE slug = 'about-workwear-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 08:30-15:30, Sat 08:00-11:00',
  source_urls = '["https://www.absa.co.za/personal/", "https://absa.banklocationmaps.com/en/branch/930118-absa-branch-finforum-building-cnr-dr-van-der-merwe-road-and-sefako-makgatho-drive"]',
  description = 'This Absa branch in Montana Gardens offers everyday personal and business banking services to the local community.',
  description_enriched_at = datetime('now')
WHERE slug = 'absa-branch-montana-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Absa branch in Karenpark offers everyday personal and business banking services to the local community.',
  description_enriched_at = datetime('now')
WHERE slug = 'absa-branch-wonderpark-karenpark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 08:30-15:30, Sat 08:00-12:30, Sun Closed',
  source_urls = '["https://africabizinfo.com/ZA/absa-|-branch-|-pretoria-north-012-521-8600", "https://za.polomap.com/pretoria/43535", "https://absa.banklocationmaps.com/en/branch/930115-absa-branch-northpark-mall-526-rachel-de-beer-street"]',
  description = 'This Absa branch, located inside North Park Mall in Florauna, offers everyday personal and business banking services.',
  description_enriched_at = datetime('now')
WHERE slug = 'absa-bank-northpark-mall-florauna' AND description_enriched_at IS NULL;

UPDATE businesses SET
  hours = 'Mon-Fri 08:30-15:30, Sat 08:00-11:00',
  source_urls = '["https://nearbyza.com/place/absa-branch-laudium-shop-5", "https://www.callupcontact.com/b/Banks/ABSA_LAUDIUM/46387", "https://absa.banklocationmaps.com/en/branch/930148-absa-branch-291-tangerine-street"]',
  description = 'This Absa branch, located in Laudium Plaza, offers everyday personal and business banking services to the Laudium community.',
  description_enriched_at = datetime('now')
WHERE slug = 'absa-branch-laudium-laudium' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Absa branch in Olievenhoutbosch offers everyday personal and business banking services to the local community.',
  description_enriched_at = datetime('now')
WHERE slug = 'absa-branch-olievenhoutbosch-business-stand-10038-olievenhoutbosch' AND description_enriched_at IS NULL;
