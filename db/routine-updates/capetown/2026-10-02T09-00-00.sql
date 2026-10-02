INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-jungle-kids-rugby', 'Cape Jungle Kids',
  (SELECT id FROM suburbs WHERE slug = 'rugby'),
  '397 Koeberg Road, Rugby, Cape Town, 7405', '021 511 0100', 'https://www.capejunglekids.co.za', NULL,
  'Cape Jungle Kids manufactures and installs jungle gyms, themed play structures and playground equipment for homes, schools and municipal playgrounds, in Rugby.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/685594/cape-jungle-kids", "https://www.tuugo.co.za/Companies/cape-jungle-kids/0260003346928", "https://www.fyple.co.za/company/cape-jungle-kids-nj01ln/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-jungle-kids-rugby'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vd-parts-sparco-cape-town-rugby', 'VD Parts - Sparco Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'rugby'),
  '363 Koeberg Road, Rugby, Cape Town, 7405', '083 298 3103', NULL, NULL,
  'VD Parts - Sparco Cape Town is a motorsport parts and accessories store in Rugby; visits are by appointment.',
  NULL, NULL,
  '["https://vdparts.sparcocapetown.com/contact-us", "https://www.facebook.com/sparcocapetown/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vd-parts-sparco-cape-town-rugby'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
