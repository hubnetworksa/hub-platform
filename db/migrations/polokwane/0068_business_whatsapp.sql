-- Featured-plan perk: a WhatsApp number for the "WhatsApp" chat button on the
-- business page and Featured cards. Stored formatted like phone
-- ("082 123 4567"); functions/api/update-business.ts only accepts an SA mobile
-- number and only from a Featured listing. The site shows the button only while
-- the Featured plan is paid up (whatsappFor in src/lib/data.ts), so a lapsed
-- listing keeps its number for when it renews. Routines may never set it
-- (scripts/routines/validate.mjs). NULL = none.
ALTER TABLE businesses ADD COLUMN whatsapp TEXT;
