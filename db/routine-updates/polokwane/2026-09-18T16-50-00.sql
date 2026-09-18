INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'inkrite-moregloed', 'Inkrite',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  (SELECT id FROM shopping_centers WHERE slug = 'palm-centre-moregloed'),
  'Shop 9, Palm Centre, Grobler Street, Moregloed, Polokwane, 0699', '015 295 9677', NULL, NULL,
  'Inkrite is a printer ink and toner consumables shop in Palm Centre, Moregloed, Polokwane, offering ink cartridge refilling and printer supplies.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/inkrite-polokwane", "https://www.netpages.co.za/Polokwane/Inkrite-277819.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'inkrite-moregloed'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trappers-trading-co-moregloed', 'Trappers Trading Co',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  (SELECT id FROM shopping_centers WHERE slug = 'palm-centre-moregloed'),
  'Palm Centre, 23 Grobler Street, Moregloed, Polokwane, 0699', '015 295 3414', 'https://www.trappers.co.za/', NULL,
  'Trappers Trading Co is a camping and outdoor equipment retailer in Palm Centre, Moregloed, Polokwane, part of the Trappers outdoor goods chain.',
  NULL, NULL,
  '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/moregloed/camping-equipment/trappers-trading-co", "https://www.trappers.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trappers-trading-co-moregloed'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
