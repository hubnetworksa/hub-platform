-- Draft/publish split for the page builder (see the Page Builder plan):
-- template_id/custom_blocks stay the LIVE published state; draft_template_id/
-- draft_blocks are what the owner is actively editing, autosaved as they
-- work. "Publish" copies draft -> live; "Revert to published" copies the
-- other way. NULL draft columns mean "no draft started yet" — the builder
-- seeds them from the live values on first open.
ALTER TABLE businesses ADD COLUMN draft_template_id TEXT;
ALTER TABLE businesses ADD COLUMN draft_blocks TEXT;
ALTER TABLE businesses ADD COLUMN draft_updated_at TEXT;
