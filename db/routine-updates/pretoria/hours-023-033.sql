-- Hours backfill for Pretoria chunks 023-033 (researched, sourced from business's own site)
-- Only 2 of 41 candidates with non-empty facts.hours had genuine, business-specific trading hours;
-- the rest were boilerplate, wrong-branch, or unrelated scrape noise. See handback report for detail.

UPDATE businesses SET hours = 'Mon-Fri 07:00-17:30' WHERE slug = 'apac-projects-equestria' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00' WHERE slug = 'mlk-corporation-pty-ltd-lotus-gardens' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

