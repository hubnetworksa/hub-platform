INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clear-target-optometrist-hospark', 'Clear Target Optometrist',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '73 Burger Street, Hospital Park, Polokwane, 0700', '065 842 2474', 'https://cleartargetoptometrist.co.za', NULL,
  'Clear Target Optometrist is an optometry practice on Burger Street in Hospital Park, offering eye examinations and a range of eyewear frames.',
  NULL, NULL,
  '["https://cleartargetoptometrist.co.za/about-us/", "https://www.tiktok.com/@tshego_seema/video/7397775835014466822"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clear-target-optometrist-hospark'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spectacle-hut-hospark', 'Spectacle Hut',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '64 Burger Street, Hospital Park, Polokwane, 0700', '015 291 2920', 'https://www.spectaclehutsa.co.za', 'burgerst@spectaclehutsa.co.za',
  'Spectacle Hut is an optometrist and eyewear store on Burger Street in Hospital Park, part of a South African optometry chain.',
  NULL, NULL,
  '["https://www.spectaclehutsa.co.za/contact-us-2", "https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/optometry/GEMS-Optometry-Network-Providers---Limpopo.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spectacle-hut-hospark'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
