INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'makgongoana-secondary-school-mankweng', 'Makgongoana Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  '474 Gamakanye Village, Gamothapo, Sovenga, 0727', '083 773 2294', NULL, NULL,
  'Makgongoana Secondary School is a public secondary school in Gamakanye Village, Sovenga, part of the Mankweng Circuit.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/makgongoana/", "https://www.callupcontact.com/b/Public_High_Secondary_Schools/Makgongoana_High_School/19180"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'makgongoana-secondary-school-mankweng'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pentagon-college-mankweng', 'Pentagon College',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  '595 Unit A, Mankweng, 0727', '015 286 8007', 'https://pentagoncollege.co.za/', NULL,
  'Pentagon College is a private FET college in Mankweng, next to the University of Limpopo, offering post-matric courses.',
  NULL, NULL,
  '["https://pentagoncollege.co.za/", "https://www.yep.co.za/biz/store/pentagon-college/650955"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pentagon-college-mankweng'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
