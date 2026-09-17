INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-thornhill-thornhill-estate', 'Tops at Spar Thornhill',
  (SELECT id FROM suburbs WHERE slug = 'thornhill-estate'),
  (SELECT id FROM shopping_centers WHERE slug = 'thornhill-shopping-centre-thornhill-estate'),
  'Thornhill Shopping Centre, Cnr Munnik Ave & Veldspaat St, Thornhill, Polokwane, 0713', '015 296 4801', NULL, NULL,
  'Tops at Spar Thornhill is a liquor store inside Thornhill Shopping Centre, stocking wine, spirits and beer alongside the adjoining SUPERSPAR, in Thornhill Estate.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/lp/polokwane/liquor-store/tops-at-spar-thornhill_714396+7.html", "https://www.thinklocal.co.za/biz/tops-at-spar-thornhill-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-thornhill-thornhill-estate'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
