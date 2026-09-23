-- Suburb: Wetton -- job 1/2 research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southern-boards-hardware-wetton', 'Southern Boards & Hardware',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '137 Wetton Road, Wetton, Cape Town, 7780', '021 761 3615', NULL, NULL,
  'Southern Boards & Hardware is a wholesale hardware and building supplies store on Wetton Road.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/southern-boards---hardware-23744798.html", "https://www.cybo.com/ZA-biz/southern-boards-and-hardware"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southern-boards-hardware-wetton'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wetton-bolt-and-nut-wetton', 'Wetton Bolt and Nut',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '150 Wetton Road, Wetton, Cape Town, 7780', '021 703 4725', NULL, NULL,
  'Wetton Bolt and Nut is a supplier of industrial fasteners, bolts, nuts, tools and anchors on Wetton Road.',
  NULL, NULL,
  '["https://wettonboltandnut.wixsite.com/site", "https://za.africabz.com/western-cape/wetton-bolt-and-nut-267980"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wetton-bolt-and-nut-wetton'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
