-- template_id: 'classic' | 'gallery' | 'services' — chooseable at Featured
-- (R199) and up, always 'classic' below that. custom_blocks: a JSON array
-- of {type, title, body} extra sections, Premium (R299) only, rendered
-- after the description in the order stored — see the Premium Listings
-- plan's block-editor section.
ALTER TABLE businesses ADD COLUMN template_id TEXT NOT NULL DEFAULT 'classic';
ALTER TABLE businesses ADD COLUMN custom_blocks TEXT;
