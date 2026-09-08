-- Merge "Guesthouses & B&Bs" into "Accommodation" (owner decision 2026-09-08).
-- Guesthouses/B&Bs are accommodation; a separate slice added nothing but
-- split the listings. 0003 no longer seeds the category on fresh databases;
-- this migration folds it away on an existing one. Idempotent (re-running
-- after the category is gone is a no-op).

-- Move every guesthouse/B&B business into Accommodation. OR IGNORE covers the
-- rare business already tagged Accommodation (composite PK clash).
UPDATE OR IGNORE business_categories
SET category_id = (SELECT id FROM categories WHERE slug = 'accommodation')
WHERE category_id = (SELECT id FROM categories WHERE slug = 'guesthouses-bnbs');

-- Drop any links left behind by an OR IGNORE clash.
DELETE FROM business_categories
WHERE category_id = (SELECT id FROM categories WHERE slug = 'guesthouses-bnbs');

DELETE FROM categories WHERE slug = 'guesthouses-bnbs';
