-- Follow-up to tourism-attractions-2026-09-01.sql: at the user's explicit
-- request, the Ditsong Museum of Military History is listed too, even
-- though it's physically in Saxonwold, Johannesburg (see the new
-- 'saxonwold' suburb in migration 0015, region 'gauteng-other'). Contact
-- details from the museum's own site.

INSERT INTO businesses
  (slug, name, suburb_id, address, phone, description, source_urls, status, origin)
VALUES (
  'ditsong-museum-of-military-history-saxonwold', 'Ditsong Museum of Military History',
  (SELECT id FROM suburbs WHERE slug = 'saxonwold'),
  '22 Erlswold Way, Saxonwold, Johannesburg, 2132', '011 646 5513',
  'South Africa''s national military history museum, covering the colonial era through the World Wars to the present. Located in Saxonwold, Johannesburg — outside the Pretoria/Tshwane metro, but included here as the Pretoria-area Ditsong sites'' sister museum.',
  '["https://ditsong.org.za/en/our-museums/museum-of-military-history/", "https://ditsong.org.za/en/contact-us/"]',
  'published', 'seed_import'
);
INSERT INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ditsong-museum-of-military-history-saxonwold'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
