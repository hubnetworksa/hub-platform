-- content-upgrade:pretoria:address-fix: owner-confirmed address precision fixes (same suburb, not SQL from to-sql.mjs)
UPDATE businesses SET address = '70 Sefako Makgatho Drive (R513), Sinoville, Pretoria, 0129'
WHERE slug = 'bp-sinoville-sinoville'
  AND address = 'Sefako Makgatho Dr, Sinoville, Pretoria, 0129'
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id);

UPDATE businesses SET address = '182 Hendrik Street, Wierda Park, Centurion, 0149'
WHERE slug = 'garmar-supermarket-wierdapark'
  AND address = 'Hendrik St, Wierdapark, Pretoria, 0149'
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id);

UPDATE businesses SET address = 'Block B, Zambesi Office Park, Roodeplaat, Pretoria, 0182'
WHERE slug = 'kieskeurige-bruidjie-roodeplaat'
  AND address = 'Shop number 104, Zambesi China Mall, Pretoria, 0182'
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id);
