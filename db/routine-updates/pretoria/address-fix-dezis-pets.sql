-- content-upgrade:pretoria:address-fix: owner-confirmed address/suburb correction,
-- not a description change. Dezi's Pets' Google/Maps listing and several
-- directories place it at 653 Meyer St, Wonderboom South (suburb id 168), not
-- 470 Van Der Hoff Road, Hermanstad (suburb id 142) as currently stored.
-- Guarded the same way as the description updates: only applies if nobody
-- owns/claims/pays for the listing, and only if the address on file still
-- matches what we read it as (so an admin/owner fix made since isn't undone).
UPDATE businesses SET address = '653 Meyer St, Wonderboom South, Pretoria, 0084', suburb_id = 168
WHERE slug = 'dezis-pets-hermanstad'
  AND address = '470 Van Der Hoff Road, Hermanstad, Pretoria, 0082'
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id);
