INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lipco-law-for-all-polokwane-central', 'LIPCO - LAW FOR ALL',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '17A Landdros Mare Street, Polokwane Central, Polokwane, 0699', '015 294 9400', NULL, NULL,
  'LIPCO - Law For All is a legal services branch in Polokwane Central offering affordable legal advice and representation to the public.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/5310", "https://readymap.co.za/188/4248"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lipco-law-for-all-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crystal-coffee-shop-polokwane-central', 'Crystal Coffee Shop',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '142 Marshall Street, Polokwane Central, Polokwane, 0699', '083 321 4533', NULL, NULL,
  'Crystal Coffee Shop is a coffee shop and cake specialist on Marshall Street in Polokwane Central, also offering an on-site hair and beauty salon.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/coffee-shops/crystal-coffee-shop", "https://www.searchinafrica.com/business/6155557/south-africa/limpopo/polokwane/marshall-st/coffee-shops/crystal-coffee-shop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crystal-coffee-shop-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eva-clothing-polokwane-central', 'Eva Clothing',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '81 Market Street, Polokwane Central, Polokwane, 0699', '060 949 4787', NULL, NULL,
  'Eva Clothing is a women''s clothing store on Market Street in Polokwane Central, selling dresses and fashion pieces in a wide size range, with nationwide courier available.',
  NULL, NULL,
  '["https://m.facebook.com/110831611046729/photos/a.112051054258118/112060614257162/?type=3", "https://www.instagram.com/p/DR4Yz9pCFv-/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eva-clothing-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mavuna-netshimbupfe-inc-polokwane-central', 'Mavuna & Netshimbupfe Inc',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '28A Bodenstein Street, Polokwane, 0699', '015 880 0618', NULL, NULL,
  'Mavuna & Netshimbupfe Inc is a law firm on Bodenstein Street in Polokwane Central, providing conveyancing and civil litigation services.',
  NULL, NULL,
  '["https://www.mavnetshlaw.co.za/contact/", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=1720"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mavuna-netshimbupfe-inc-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dadas-world-of-hardware-polokwane-central', 'Dada''s World of Hardware',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '73 Genl Joubert Street, Polokwane Central, Polokwane, 0700', '086 100 3232', 'www.dadasworld.co.za', NULL,
  'Dada''s World of Hardware is a large hardware, building material, plumbing, electrical and DIY store in Polokwane Central.',
  NULL, NULL,
  '["https://za.near-place.com/dadas-world-of-hardware-73-genl-joubert-street-polokwane-central-polokwane", "https://za.africabz.com/limpopo/dadas-world-of-hardware-104065"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dadas-world-of-hardware-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
