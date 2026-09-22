INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'enterprise-wholesalers-nirvana', 'Enterprise Wholesalers',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '122 Crescent Drive, Nirvana, Polokwane, 0699', '015 292 1619', NULL, NULL,
  'Enterprise Wholesalers is a fabric and haberdashery wholesaler in Nirvana, trading since 1975, stocking fabrics, bridal wear, upholstery, curtains, wallpaper, foam products, mattresses, beds and linen.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/enterprise-wholesalers-or-fabric-shops/593608", "https://www.thinklocal.co.za/biz/enterprise-wholesalers-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'enterprise-wholesalers-nirvana'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fashion-crimp-house-nirvana', 'Fashion Crimp House',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '10 Ashoka Street, Nirvana, Polokwane, 0699', '015 292 0532', 'http://www.fashioncrimphouse.co.za/', NULL,
  'Fashion Crimp House is a curtain, blind and upholstery specialist in Nirvana trading since 1977, manufacturing and installing curtains, blinds and curtain accessories and offering upholstery recovery and restoration alongside fabric and linen retail.',
  NULL, NULL,
  '["https://www.nearfinderza.com/en/business/lp/polokwane/blinds/fashion-crimp-house_291806+7.html", "https://www.brabys.com/za/limpopo/polokwane/nirvana/curtains-pelmets-loose-covers/nirvana-fashion-crimp-house", "https://www.thinklocal.co.za/biz/fashion-crimp-house-nirvana-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fashion-crimp-house-nirvana'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
