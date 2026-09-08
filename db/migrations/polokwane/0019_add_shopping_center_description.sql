-- Short editorial description per shopping centre / mall, shown on its page
-- (src/pages/shopping-center/[slug].astro). Hand-written, not routine-managed
-- — the research routine only ever adds centres and links tenants, it does
-- not touch this column.
ALTER TABLE shopping_centers ADD COLUMN description TEXT;
