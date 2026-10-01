-- Optional business logo (Verified and Featured plans), uploaded from the
-- owner dashboard via functions/api/business-logo.ts. R2 key under
-- business-logos/<businessId>/. Kept when a plan lapses; the build only
-- shows it while the plan is paid (logoFor in src/lib/data.ts).
ALTER TABLE businesses ADD COLUMN logo_key TEXT;
