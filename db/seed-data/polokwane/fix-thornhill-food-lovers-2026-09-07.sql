-- Correction (2026-09-07, owner report): Food Lover's Market is no longer at
-- Thornhill Shopping Centre. Remove the standalone listing and drop it from
-- the Thornhill centre description and the Sterpark / Thornhill Estate bios.

DELETE FROM businesses WHERE slug = 'food-lovers-market-thornhill-thornhill-estate';

UPDATE shopping_centers
SET description = REPLACE(
  description,
  'Anchored by SuperSpar, with Clicks, Food Lover''s Market and Sportsmans Warehouse.',
  'Anchored by SuperSpar, with Clicks and Sportsmans Warehouse among the tenants.'
)
WHERE slug = 'thornhill-shopping-centre-thornhill-estate';

UPDATE suburbs
SET bio = REPLACE(
  bio,
  'SuperSpar, Clicks, Sportsmans Warehouse and Food Lover''s Market',
  'SuperSpar, Clicks and Sportsmans Warehouse'
)
WHERE slug = 'sterpark';

UPDATE suburbs
SET bio = REPLACE(
  bio,
  'SuperSpar, Clicks, Food Lover''s Market, Sportsmans Warehouse and around twenty more stores',
  'SuperSpar, Clicks, Sportsmans Warehouse and around twenty more stores'
)
WHERE slug = 'thornhill-estate';
