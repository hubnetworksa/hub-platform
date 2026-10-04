-- Fresh hours research for chunks 044-053 (Pretoria). Businesses already
-- covered by db/routine-updates/pretoria/hours-044-053.sql (consultium-group-muckleneuk,
-- pta-storage-equestria, y2k-print-and-design-montana-park) are intentionally
-- skipped here to avoid duplicate UPDATEs.

-- PostNet Southdowns: own franchise page (southdowns.postnet.co.za)
UPDATE businesses SET hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00, Sun 09:00-13:00' WHERE slug = 'postnet-southdowns-southdowns' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- Nyati Paints Rosslyn: own site (nyatipaints.co.za), nav bullets state hours directly
UPDATE businesses SET hours = 'Mon-Thu 07:30-16:00, Fri 07:30-15:00, Sat-Sun Closed' WHERE slug = 'nyati-paints-rosslyn' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- PostNet Menlyn (Waterkloof Glen): own franchise page (menlyn.postnet.co.za)
UPDATE businesses SET hours = 'Mon-Fri 08:00-17:30, Sat 08:30-13:00, Sun Closed' WHERE slug = 'postnet-menlyn-waterkloof-glen' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- PostNet Station Square (Trevenna): own store page (postnet.co.za/stores/stationsquare)
UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed' WHERE slug = 'postnet-station-square-trevenna' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- PostNet Wonderpark (Karenpark): own store page (postnet.co.za/stores/wonderpark)
UPDATE businesses SET hours = 'Mon-Fri 08:00-18:00, Sat 09:00-15:00, Sun 08:00-15:00' WHERE slug = 'postnet-wonderpark-karenpark' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- Sheet Street Gezina: chain's own branch page (sheetstreet.com/sheet-street-gezina-30236)
UPDATE businesses SET hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00, Sun 08:00-14:00' WHERE slug = 'sheet-street-gezina-gezina' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- BICCCS (Waterkloof Heights): vymaps.com listing with matching phone/website, full week breakdown
UPDATE businesses SET hours = 'Mon 07:00-18:00, Tue-Sat 07:00-21:00, Sun 07:00-16:00' WHERE slug = 'bicccs-waterkloof-heights' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);
