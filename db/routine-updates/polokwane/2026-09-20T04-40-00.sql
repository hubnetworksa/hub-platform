INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'glass-doctor-superbia', 'Glass Doctor',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '63 Nelson Mandela Road, Superbia, Polokwane', '015 292 3992', NULL, NULL,
  'Glass Doctor is an automotive glass specialist in Superbia offering windscreen, side and rear glass replacement and chip repairs.',
  NULL, NULL,
  '["https://za.ypgo.net/Glass+Doctor-22059950956", "https://www.thinklocal.co.za/biz/glass-doctor-polokwane", "https://www.brabys.com/za/limpopo/polokwane/superbia/windscreens-replacements-repairs/glass-doctor"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'glass-doctor-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brilliant-bass-boats-superbia', 'Brilliant Bass Boats',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '9 Rupee Avenue, Superbia, Polokwane, 0699', '015 292 5222', NULL, 'deon@brilliantbass.co.za',
  'Brilliant Bass Boats is a boats and fishing tackle retailer in Superbia.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/brilliant-bass-boats/144141", "https://www.brabys.com/za/limpopo/polokwane/superbia/boating-accessories/brilliant-bass-boats-fishing-tackle", "https://www.cylex.net.za/company/brilliant-bass-boats---fishing-tackle-23722251.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brilliant-bass-boats-superbia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rabe-construction-superbia', 'Rabe Construction',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '16 Mangaan Street, Superbia, Polokwane, 0759', '015 292 0529', NULL, NULL,
  'Rabe Construction is a building contractor in Superbia offering construction, concrete formwork, steel structures and transport services.',
  NULL, NULL,
  '["https://yellowpages.co.za/business/10217931_3", "https://www.netpages.co.za/Polokwane/Rabe+Construction-14289.html", "https://nearfinderza.com/en/business/limpopo/polokwane/building-contractors/rabe-construction_88525+4.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rabe-construction-superbia'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'great-north-workshop-superbia', 'Great North Workshop',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '7 Nikkel Street, Superbia, Polokwane, 0699', '015 292 1293', NULL, NULL,
  'Great North Workshop is a motor vehicle repair workshop in Superbia specialising in brake and clutch repairs and radiator manufacturing and repair.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/great-north-workshop-polokwane", "https://www.brabys.com/za/limpopo/polokwane/superbia/motor-car-repairs/great-north-workshop", "https://www.yep.co.za/biz/store/great-north-workshop/340692"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'great-north-workshop-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
