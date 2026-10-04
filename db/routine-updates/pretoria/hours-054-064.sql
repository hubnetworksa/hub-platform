-- Hours backfill for Pretoria chunks 054-064 (guarded: only fires while hours is empty and the listing is unowned/unclaimed/unpaid/unphotographed).
-- Generated from genuinely sourced trading-hours statements found in content-upgrade/research/pretoria/*.json.

-- chunk-054: Browns (browns-menlyn) -- own official site (brownsjewellers.com) location page for this exact Menlyn Park Shopping Centre store
UPDATE businesses SET hours = 'Mon-Sat 09:00-18:30, Sun 09:00-17:30' WHERE slug = 'browns-menlyn' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-054: Ecotech (ecotech-rietondale) -- Cylex directory profile matches exact address/phone, granular per-day schedule (Monday differs from rest)
UPDATE businesses SET hours = 'Mon 08:15-17:00, Tue-Fri 08:00-17:00, Sat-Sun Closed' WHERE slug = 'ecotech-rietondale' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-055: Fortis Towers (fortis-towers-boardwalk-manor) -- own official site (fortistowers.co.za) states opening hours directly
UPDATE businesses SET hours = 'Mon-Fri 08:00-17:00' WHERE slug = 'fortis-towers-boardwalk-manor' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-055: G-Star Raw (g-star-raw-menlyn) -- own official site (g-star.com) store locator page specific to Menlyn store
UPDATE businesses SET hours = 'Mon-Thu 09:00-19:00, Fri 09:00-21:00, Sat 09:00-19:00, Sun 09:00-17:00' WHERE slug = 'g-star-raw-menlyn' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-056: Jungle Gym World (jungle-gym-world-hermanstad) -- own official site (junglegymworld.com/about) "WORKING DAYS & HOURS" for this factory address
UPDATE businesses SET hours = 'Mon-Thu 08:00-16:00, Fri 08:00-14:00, Sat-Sun Closed' WHERE slug = 'jungle-gym-world-hermanstad' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-057: Oryx Accounting (Pty) Ltd (oryx-accounting-pty-ltd-the-hills-eco-game-estate) -- goafricaonline.com directory profile matches exact address/phone/website, granular per-day schedule
UPDATE businesses SET hours = 'Mon-Thu 08:00-17:00, Fri 08:00-13:00, Sat-Sun Closed' WHERE slug = 'oryx-accounting-pty-ltd-the-hills-eco-game-estate' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-057: PostNet Centurion Lifestyle Centre (postnet-centurion-lifestyle-centre-brakfontein) -- own official site (postnet.co.za) store page, exact branch address match, labelled "Trading Hours"
UPDATE businesses SET hours = 'Mon-Fri 08:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00' WHERE slug = 'postnet-centurion-lifestyle-centre-brakfontein' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-060: Carls Coffee (carls-coffee-kilner-park) -- own official site (carlscoffee.co.za) states weekday/Saturday-only hours
UPDATE businesses SET hours = 'Mon-Fri 06:30-18:00, Sat 06:30-14:00, Sun Closed' WHERE slug = 'carls-coffee-kilner-park' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-060: Beautiful Escape Health and Beauty (beautiful-escape-health-and-beauty-rooihuiskraal-north) -- own official site (beautifulescape.co.za) states "operating hours" explicitly
UPDATE businesses SET hours = 'Mon-Fri 08:00-18:00, Sat 07:00-14:00, Sun Closed' WHERE slug = 'beautiful-escape-health-and-beauty-rooihuiskraal-north' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-061: Crazy Plastics Express Madelief (crazy-plastics-express-madelief-dorandia) -- own official site (crazyplastics.co.za) store locator page for this exact branch
UPDATE businesses SET hours = 'Mon-Fri 09:00-18:00, Sat 08:00-17:00, Sun 09:00-14:00' WHERE slug = 'crazy-plastics-express-madelief-dorandia' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-061: Dante Personnel Recruitment (dante-personnel-recruitment-tijger-valley) -- africabz.com directory profile matches exact address/phone, granular per-day schedule (Friday differs)
UPDATE businesses SET hours = 'Mon-Thu 08:00-16:00, Fri 08:00-15:00' WHERE slug = 'dante-personnel-recruitment-tijger-valley' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-063: NovaCloud (Pty) Ltd (novacloud-pty-ltd-eco-park) -- own official site (novacloud.africa) states "Office hours" directly
UPDATE businesses SET hours = 'Mon-Fri 08:00-16:00' WHERE slug = 'novacloud-pty-ltd-eco-park' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-064: Pest Control | Cleaning & Hygiene Specialists Pretoria City & North (pest-control-cleaning-hygiene-specialists-pretoria-city-north-bergtuin) -- own official site (thespecialists.co.za) branch-specific page matching exact Silverton address
UPDATE businesses SET hours = 'Mon-Fri 07:30-16:30, Sat-Sun Closed' WHERE slug = 'pest-control-cleaning-hygiene-specialists-pretoria-city-north-bergtuin' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);
