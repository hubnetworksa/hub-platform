INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tshwane-regional-mall-mamelodi', 'Tshwane Regional Mall',
  (SELECT id FROM suburbs WHERE slug = 'mamelodi'),
  'Cnr Tsamaya Avenue & Watloo Road, Mamelodi, Pretoria', NULL, NULL,
  '["https://www.tshwaneregionalmall.co.za/stores", "https://www.shoprite.co.za/Gauteng/Pretoria/Mamelodi/Shoprite-Tshwane-Mall/store-details/99679"]',
  'mall'
);
