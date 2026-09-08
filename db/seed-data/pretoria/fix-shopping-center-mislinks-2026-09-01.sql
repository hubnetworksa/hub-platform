-- scripts/link-businesses-to-shopping-centers.mjs links businesses to the
-- NEAREST shopping_center by lat/lng within 120m, without checking whether
-- the business's own address text names a specific mall. When a business's
-- scraped coordinates happen to sit closer to a different (often smaller)
-- shopping center than the mall named in its own address -- or that mall
-- has no lat/lng on file at all -- it gets silently mislinked. These 4 were
-- found by cross-checking address text against shopping_centers.name; all
-- four have an unambiguous, explicitly-named mall in their address.
UPDATE businesses SET shopping_center_id = 25 WHERE id = 734;  -- CNA: address says Menlyn Park Shopping Centre, was linked to Glenfair Boulevard
UPDATE businesses SET shopping_center_id = 25 WHERE id = 752;  -- Parrots: address says Menlyn Park Shopping Centre, was linked to Ground Parking
UPDATE businesses SET shopping_center_id = 25 WHERE id = 843;  -- Mr Price Sport: address says Menlyn Park Shopping Centre, was linked to Glenfair Boulevard
UPDATE businesses SET shopping_center_id = 184 WHERE id = 920; -- Flight Centre: address says Brooklyn Mall, was linked to Hillcrest Shopping Center
