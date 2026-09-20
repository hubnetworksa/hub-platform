-- Social page links, a Featured-plan perk. Only shown on the public page while the
-- business is on the Featured tier; the values are kept if it downgrades.
ALTER TABLE businesses ADD COLUMN social_instagram TEXT;
ALTER TABLE businesses ADD COLUMN social_facebook TEXT;
ALTER TABLE businesses ADD COLUMN social_linkedin TEXT;
ALTER TABLE businesses ADD COLUMN social_youtube TEXT;
