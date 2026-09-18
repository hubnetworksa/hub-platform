-- Round-4 batch (efficiency-focused re-run). Every business entry verified
-- against 2+ independent sources with mandatory phone+address. Link
-- UPDATEs are for existing businesses whose own stored address already
-- names the centre, confirmed via matching address/phone against the
-- centre's location.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rlh-pharmacy-annadale', 'RLH Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  'Shop 03, Lea Lara Shops, 77 Pietersburg Street, Annadale, Polokwane, 0699', '015 023 1422', NULL, NULL,
  'RLH Pharmacy is a community pharmacy operating from the Lea Lara Shops complex on Pietersburg Street in Annadale, Polokwane.',
  NULL, NULL,
  '["https://www.medpages.info/", "https://www.wooltruhealthcarefund.co.za/static-assets/siteFiles/whf_network_pharmacy_list_limpopo_dec2025.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rlh-pharmacy-annadale'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'standard-bank-square-polokwane-central')
WHERE slug = 'coco-affair-polokwane-central';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'bendor-shopping-centre-bendor')
WHERE slug = 'j-med-pharmacy-bendor';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'tropicana-centre-ladanna')
WHERE slug = 'pizzalitos-tropicana-annadale';

UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'bendor-shopping-centre-bendor')
WHERE slug = 'nguni-grill-bendor';
