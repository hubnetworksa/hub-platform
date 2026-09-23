UPDATE businesses
SET description = 'Oh So Boho is a bohemian-style boutique on Kalk Bay''s Main Road selling artisan jewellery, natural-fibre clothing, and block-print home decor and accessories sourced from small, family-run makers rather than mass factory production.',
    description_enriched_at = datetime('now')
WHERE slug = 'oh-so-boho-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Brass Bell is a long-established seafood restaurant and pub built onto the Kalk Bay harbour wall beside the historic tidal pool, with several distinct dining and bar areas and a reputation as one of Cape Town''s best-known sundowner spots.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-brass-bell-kalk-bay' AND description_enriched_at IS NULL;
