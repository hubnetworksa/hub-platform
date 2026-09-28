INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romeo-juliet-florist-gifts-polokwane-central', 'Romeo & Juliet Florist & Gifts',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Shop 16, Kirkade Arcade, 56 Schoeman Street, Polokwane Central, Polokwane, 0700', '015 291 1188', 'https://romeo-juliet-florist.business.site/', NULL,
  'Romeo & Juliet Florist & Gifts is a florist and gift shop in the Kirkade Arcade on Schoeman Street in Polokwane Central.',
  NULL, NULL,
  '["https://romeo-juliet-florist.business.site/", "https://searchinafrica.com/business/4731621/south-africa/limpopo/polokwane/hans-van-rensburg-st/florists/romeo-juliet-florist"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romeo-juliet-florist-gifts-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'florists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'torga-optical-limpopo-mall-polokwane-central', 'Torga Optical',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'limpopo-mall-polokwane-central'),
  'Shop 29, Limpopo Mall, Market Street, Polokwane Central, Polokwane', '015 297 5525', 'https://torgaoptical.co.za/pietersburg-76', NULL,
  'Torga Optical is an optometry and eyewear practice inside Limpopo Mall, offering eye tests, spectacles and contact lenses.',
  NULL, NULL,
  '["https://torgaoptical.co.za/pietersburg-76", "https://appsaf.apieproject.com/business/listings/torga-optical-polokwane-limpopo-mall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'torga-optical-limpopo-mall-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eyecatchers-optometrists-polokwane-central', 'Eyecatchers Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '24a Jorissen Street, Medpark Medical Centre, Polokwane Central, Polokwane, 0699', '015 880 1890', 'https://eyecatchers.co.za/polokwane-2/', NULL,
  'Eyecatchers Optometrists is an eye-care practice inside the Medpark Medical Centre on Jorissen Street, part of a nationwide network offering eye exams, spectacles and contact lenses.',
  NULL, NULL,
  '["https://eyecatchers.co.za/polokwane-2/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1831209"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eyecatchers-optometrists-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
