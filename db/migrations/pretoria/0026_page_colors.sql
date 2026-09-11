-- Page-wide primary/secondary/background color override for Premium owners
-- (see the Page Builder plan) — same draft/publish split as template_id/
-- custom_blocks: page_colors/draft_page_colors stay in sync with those.
-- NULL means "no custom colors set" — the page just uses the site's normal
-- theme, same as every other business.
ALTER TABLE businesses ADD COLUMN page_colors TEXT;
ALTER TABLE businesses ADD COLUMN draft_page_colors TEXT;
