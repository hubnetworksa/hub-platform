-- Description enrichment, batch 07 (interactive session, per owner request
-- 2026-09-02 to push job 4 forward as fast as possible). Continues the
-- alphabetical backlog (description_enriched_at IS NULL). Each business
-- researched individually via WebSearch/WebFetch by parallel research
-- agents; "researched" ones cite what was actually found and append new
-- source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Accounting Brilliance CC is an accounting, bookkeeping and tax practice based in Montana Gardens, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'accounting-brilliance-cc-montana-gardens' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AccountItTax is an accounting practice based in Celtisdal, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'accountittax-celtisdal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accountix Inc is a registered accounting and tax firm applying IFRS standards, offering accounting, tax, payroll management and company secretarial services from its Die Wilgers office, alongside a secondary office in Cape Town.',
  description_enriched_at = datetime('now')
WHERE slug = 'accountix-inc-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accquire Consulting has a 30-year track record delivering Sage ERP, Sage CRM and Sage BI business management solutions, having implemented more than 50 systems for clients nationally and internationally from its Pierre van Ryneveld Park office.',
  description_enriched_at = datetime('now')
WHERE slug = 'accquire-consulting-pierre-van-ryneveld-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accu-Prof Insurance Brokers is an Authorised Financial Service Provider that has been providing short-term, commercial, liability and niche insurance solutions for 25 years, including professional indemnity, contractors all risk, commercial transport and niche products such as aviation, marine and drone cover, from its Elardus Park office.',
  description_enriched_at = datetime('now')
WHERE slug = 'accu-prof-insurance-brokers-elardus-park' AND description_enriched_at IS NULL;
