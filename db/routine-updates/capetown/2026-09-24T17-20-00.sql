-- Job 1: Tokai general suburb research -- 1 verified standalone business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ou-kaapse-vet-tokai', 'Ou Kaapse Vet',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  '15 Keyser River Drive, Tokai, Cape Town, 7945', '021 715 7517', 'https://oukaapsevet.co.za', NULL,
  'Ou Kaapse Vet is a companion animal veterinary hospital in Tokai.',
  NULL, NULL,
  '["https://oukaapsevet.co.za/contact-us/", "https://za.africabz.com/western-cape/ou-kaapse-vet-178678"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'ou-kaapse-vet-tokai'), (SELECT id FROM categories WHERE slug = 'vets-animal-care'), 1);
