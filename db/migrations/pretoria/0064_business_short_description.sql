-- Optional owner-written short description (one paragraph, at most 160
-- visible characters, bold/italic only — the limits live in
-- src/lib/rich-text.ts). Shown on cards, Featured blocks, search results and
-- in meta descriptions; the business page shows the full `description`.
-- NULL = not written: those places fall back to the description, clamped.
-- pending_submissions carries it from the list-your-business form until the
-- listing is approved (src/lib/business-submission.ts copies it across).
ALTER TABLE businesses ADD COLUMN short_description TEXT;
ALTER TABLE pending_submissions ADD COLUMN short_description TEXT;
