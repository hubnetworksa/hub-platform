INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cw-pharmaceuticals-sunderland-ridge', 'CW Pharmaceuticals',
  (SELECT id FROM suburbs WHERE slug = 'sunderland-ridge'),
  '135 Rietspruit Street, Sunderland Ridge, Centurion, 0157', '012 666 8391', 'https://cwpharm.co.za', 'info@cwpharm.co.za',
  'CW Pharmaceuticals is a contract manufacturer of cosmetics, skincare and personal care products in Sunderland Ridge, Centurion, offering custom formulation with stability testing, scalable production runs, and private-label and OEM packaging services since 2006.',
  NULL, NULL,
  '["https://citionline.co.za/business-listings/?keywords=Sunderland+Ridge", "https://cwpharm.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cw-pharmaceuticals-sunderland-ridge'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'palmin-kitchens-sunderland-ridge', 'Palmin Kitchens',
  (SELECT id FROM suburbs WHERE slug = 'sunderland-ridge'),
  '27 & 29 Van Tonder Street, Sunderland Ridge, Centurion, 0157', '012 665 8705', 'https://www.palmin.co.za', 'info@palmin.co.za',
  'Palmin Kitchens designs and manufactures custom cabinetry in Sunderland Ridge, Centurion, producing kitchens, built-in cupboards, bathroom vanities and bespoke storage solutions through a consultation, design and on-site installation process.',
  NULL, NULL,
  '["https://citionline.co.za/business-listings/?keywords=Sunderland+Ridge", "https://www.palmin.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'palmin-kitchens-sunderland-ridge'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gimtrac-sunderland-ridge', 'Gimtrac',
  (SELECT id FROM suburbs WHERE slug = 'sunderland-ridge'),
  '120 Ellman Street, Sunderland Ridge, Centurion, 0157', '012 666 8258', 'https://gimtrac.co.za', 'sales@gimtrac.co.za',
  'Gimtrac manufactures sports and play equipment from its Sunderland Ridge factory in Centurion, including soccer, rugby, hockey and netball goals, athletics gear, gymnastics apparatus and playground and early-childhood-development equipment, supplied and installed nationwide. Open Mon-Thu 07:00-15:45, Fri 07:00-13:00.',
  NULL, NULL,
  '["https://citionline.co.za/business-listings/?keywords=Sunderland+Ridge", "https://gimtrac.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gimtrac-sunderland-ridge'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

