INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vdm-optometrists-kenridge-kenridge', 'VDM Optometrists Kenridge',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  'Unit 4A, The Ridge Office Park, Door de Kraal Road, Kenridge, Durbanville, 7550', '021 914 1521', 'https://www.vdmoptom.co.za', 'kenridge@vdmoptom.co.za',
  'VDM Optometrists Kenridge is an optometry practice, in Kenridge.',
  NULL, NULL,
  '["https://www.vdmoptom.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=193025"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vdm-optometrists-kenridge-kenridge'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
