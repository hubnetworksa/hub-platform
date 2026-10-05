-- thin-pages pretoria batch 03: checkpoint 4 (Grootfontein Clinics, Sunderland Ridge Building & Fashion, Weavind Park Computer & IT)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-lize-van-nieuwkoop-grootfontein-country-estate', 'Dr Lize van Nieuwkoop',
  (SELECT id FROM suburbs WHERE slug = 'grootfontein-country-estate'),
  '153 Sinovich Street, Grootfontein Country Estate, Pretoria', '+27 12 111 1076', 'https://docnieuw.co.za', NULL,
  'This general practice operates from Sinovich Street in Grootfontein Country Estate, offering everyday family medicine alongside a particular focus on metabolic health and nutrition-based care. Consultations cover routine GP services such as check-ups, chronic condition management and referrals, together with structured dietary guidance for patients managing weight, blood sugar or digestive issues.

The practice publishes regular nutrition guidance, covering topics such as fibre intake and blood sugar management, as part of its approach to helping patients build sustainable eating habits rather than relying on short-term diets. It serves residents of Grootfontein Country Estate and the surrounding eastern Pretoria suburbs who want a general practitioner with a specific interest in nutrition and metabolic conditions.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1831449", "https://www.findglocal.com/ZA/Pretoria/105756045000721/Dr-Lize-van-Nieuwkoop", "https://www.facebook.com/profile.php/?id=100068941062346"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-lize-van-nieuwkoop-grootfontein-country-estate'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aa-bricks-sunderland-ridge', 'AA Bricks',
  (SELECT id FROM suburbs WHERE slug = 'sunderland-ridge'),
  '137 Ellman Street, Sunderland Ridge, Centurion', '012 666 8948', 'https://aabricks.co.za', NULL,
  'AA Bricks is a clay brick manufacturer trading from Ellman Street in Sunderland Ridge, producing a wide range of stock bricks for residential and commercial building projects. Operating since 1983, the company supplies builders, contractors and homeowners across the greater Pretoria and Centurion area and delivers nationwide.

The Sunderland Ridge operation functions as both a manufacturing site and a sales office, letting customers order directly from the producer rather than through a building-material retailer. It serves builders and construction companies working on projects across Sunderland Ridge and the wider Centurion area who need clay bricks sourced locally rather than trucked in from further afield.',
  NULL, NULL,
  '["https://aabricks.co.za/", "https://pretoria.co.za/place/aa-bricks", "https://www.findglocal.com/ZA/Centurion/1969007273343747/AA-Bricks"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aa-bricks-sunderland-ridge'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'discount-fashion-sunderland-ridge', 'Discount Fashion',
  (SELECT id FROM suburbs WHERE slug = 'sunderland-ridge'),
  '36 Rudolph Street, Sunderland Ridge, Centurion', '012 666 7607', NULL, NULL,
  'Discount Fashion is a clothing retailer with its head office on Rudolph Street in Sunderland Ridge, trading under the tagline ''Dress for Less'' and selling affordably priced clothing for men, women and children. The Sunderland Ridge premises serves as both the company''s head office and a retail outlet for shoppers in the area.

The store focuses on value pricing rather than a single brand or style, carrying a broad general clothing range aimed at budget-conscious shoppers rather than a narrow fashion niche. It serves residents of Sunderland Ridge and the surrounding Centurion suburbs looking for everyday clothing at lower prices than mainstream clothing chains, without needing to travel into central Pretoria.',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/360207158048312/Discount-Fashion", "https://www.cybo.com/ZA-biz/discount-fashion_18w", "https://firmania.co.za/centurion/discount-fashion-199746"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'discount-fashion-sunderland-ridge'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'internet-solutions-weavind-park-weavind-park', 'Internet Solutions: Weavind Park',
  (SELECT id FROM suburbs WHERE slug = 'weavind-park'),
  '140 Westlake Street, Weavind Park, Pretoria, 0184', '012 804 0849', NULL, NULL,
  'Internet Solutions is a South African internet service provider with a branch in Weavind Park, forming part of the company''s national network of offices supporting business connectivity, hosting and managed network services. The Weavind Park location serves as a regional point of contact for the provider''s corporate and business customers in the area.

As an established national ISP, Internet Solutions offers services such as fibre and wireless connectivity, cloud hosting and network security to small and large businesses alike, rather than focusing on residential customers. Its Weavind Park branch gives businesses in Weavind Park and the surrounding Pretoria suburbs a local point of contact for an established, nationally operating internet provider.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/internet-solutions-pty-ltd-weavind-park-012-804-0849", "https://nearfinderza.com/en/business/gp/pretoria/internet-solutions-pty-ltd-weavind-park_383420+9.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'internet-solutions-weavind-park-weavind-park'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
