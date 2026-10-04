UPDATE businesses SET hours = 'Mon-Fri 09:00-17:00, Sat-Sun Closed' WHERE slug = 'consultium-group-muckleneuk' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

UPDATE businesses SET hours = 'Mon-Sun 06:00-18:00' WHERE slug = 'pta-storage-equestria' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed' WHERE slug = 'y2k-print-and-design-montana-park' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);
