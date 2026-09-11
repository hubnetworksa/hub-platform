-- Real free-form page builder (GrapesJS), replacing the GridStack "extra
-- sections" canvas and the bolted-on page_colors. Same draft/publish shape
-- as everything else: page_design/draft_page_design hold GrapesJS's own
-- project JSON (what the editor loads back in); page_html/page_css (and
-- their draft_ counterparts) hold the actual rendered output captured at
-- publish time, which the real business page just injects directly — no
-- server-side render step needed.
--
-- template_id/custom_blocks/page_colors and their draft_ columns are left
-- in place, unused, rather than dropped — Featured-tier businesses (below
-- the full builder) still use template_id, and dropping columns in SQLite
-- is more risk than a few unused TEXT columns are worth.
ALTER TABLE businesses ADD COLUMN page_design TEXT;
ALTER TABLE businesses ADD COLUMN draft_page_design TEXT;
ALTER TABLE businesses ADD COLUMN page_html TEXT;
ALTER TABLE businesses ADD COLUMN draft_page_html TEXT;
ALTER TABLE businesses ADD COLUMN page_css TEXT;
ALTER TABLE businesses ADD COLUMN draft_page_css TEXT;
