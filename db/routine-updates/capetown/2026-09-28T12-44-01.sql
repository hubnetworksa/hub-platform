INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'electrician-cpt-lotus-river', 'Electrician CPT',
  (SELECT id FROM suburbs WHERE slug = 'lotus-river'),
  '12 Lake Road, Lotus River, Cape Town, 7805', '067 724 9789', 'https://electriciancpt.co.za/lotus-river-electrician/', NULL,
  'Electrician CPT is an electrical contractor in Lotus River offering installations, house wiring and repairs.',
  NULL, NULL,
  '["https://electriciancpt.co.za/lotus-river-electrician/", "https://www.biznizdirectory.co.za/electriciancpt-maintenance-construction-and-maintenance-in-lotus-river-grassy-park-western-cape-73805.html", "https://www.bestdirectory.co.za/electrician-cpt-building-types-construction-and-maintenance-in-lotus-river-grassy-park-western-cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'electrician-cpt-lotus-river'),
  (SELECT id FROM categories WHERE slug = 'electricians'),
  1
);
