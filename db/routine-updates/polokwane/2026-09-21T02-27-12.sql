INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'inkmart-copiers-annadale', 'Inkmart Copiers',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  '44A Doornkraal Street, Annadale, Polokwane, 0699', '015 280 0047', NULL, NULL,
  'Inkmart Copiers is an office equipment and copier supplier and print shop on Doornkraal Street, Annadale.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/lp/polokwane/stationers/inkmart-copiers_411472+5.html", "https://printshops.co.za/za/limpopo/polokwane/inkmart-office-equipment-annadale-polokwane-limpopo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'inkmart-copiers-annadale'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-atm-engen-ladanna-annadale', 'Nedbank ATM Engen Ladanna',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  '15 Witklip Street, Annadale, Polokwane, 0699', '080 011 0929', NULL, NULL,
  'Nedbank ATM Engen Ladanna is a standalone Nedbank cash machine at the Engen filling station on Witklip Street, Annadale.',
  NULL, NULL,
  '["https://www.nedbank.co.za/content/dam/nedbank/site-assets/Personal/Digital/Whatsnew/ATM_1_March.pdf", "https://za.polomap.com/polokwane/6055"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-atm-engen-ladanna-annadale'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
