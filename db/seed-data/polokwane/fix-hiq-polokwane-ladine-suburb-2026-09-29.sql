-- Correction (2026-09-29, owner report): "Hi-Q Polokwane Ladine" was
-- filed under Bendor Park, but it's actually in Ladine -- its own address
-- (64 Silicon Street, Ladine's defining street) and its own source
-- (hiq.co.za's store locator names it "hi-q-tyres-&-autocare-polokwane-ladine")
-- both say Ladine, not Bendor Park. Also fixes the address text itself,
-- which still said "Bendor Park" -- would otherwise contradict the
-- corrected suburb. Slug is left unchanged to avoid breaking any existing
-- link to it.

UPDATE businesses
SET suburb_id = (SELECT id FROM suburbs WHERE slug = 'ladine'),
    address = '64 Silicon Street, Ladine, Polokwane, 0699'
WHERE slug = 'hi-q-polokwane-ladine-bendor-park';
