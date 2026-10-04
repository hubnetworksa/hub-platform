-- Fresh hours research for Pretoria chunks 054-064 (guarded: only fires while hours is empty and the listing is unowned/unclaimed/unpaid/unphotographed).
-- These 4 were newly confirmed by this research pass. Of the 425 chunk listings with empty hours in 054-064, 13 were already
-- covered by an earlier pass (see hours-054-064.sql); these 4 are new; the remaining 408 had no confirmable hours
-- (see content-upgrade/_hours-needed-054-064.json).

-- chunk-056: KFC Francis Baard Street (kfc-francis-baard-street-arcadia) -- tiendeo.co.za store-specific listing for this exact address (611 Francis Baard Street, Arcadia), consistent daily hours
UPDATE businesses SET hours = 'Mon-Sun 09:00-22:00' WHERE slug = 'kfc-francis-baard-street-arcadia' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-057: Outdoor Warehouse Zambezi (outdoor-warehouse-zambezi-montana-park) -- own site store-locator page (outdoorwarehouse.co.za/store/outdoor-warehouse-zambezi), store-specific JSON trading_hours matching this exact address
UPDATE businesses SET hours = 'Mon-Fri 08:30-17:30, Sat 08:00-16:00, Sun 09:00-14:00' WHERE slug = 'outdoor-warehouse-zambezi-montana-park' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-057: Padbok Thai Restaurant (padbok-thai-restaurant-waterkloof) -- sa-venues.com listing for this exact restaurant/address in Brooklyn, Pretoria
UPDATE businesses SET hours = 'Mon-Sat 11:00-22:00, Sun 11:00-16:00' WHERE slug = 'padbok-thai-restaurant-waterkloof' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

-- chunk-062: Kalinda Trading Pty Ltd (kalinda-trading-pty-ltd-sunderland-ridge) -- own site (kalindatrading.co.za) contact-page bullet listing address, phone, email and hours together
UPDATE businesses SET hours = 'Mon-Fri 07:00-16:30' WHERE slug = 'kalinda-trading-pty-ltd-sunderland-ridge' AND (hours IS NULL OR length(trim(hours)) < 3)
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

