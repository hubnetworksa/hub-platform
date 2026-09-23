INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'twin-peak-spur-ottery', 'Twin Peak Spur',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Pick n Pay Hypermarket, Ottery Road, Ottery, Cape Town, 7808', '021 703 0019', NULL, NULL,
  'Twin Peak Spur is a family-style steakhouse restaurant inside Ottery Hyper, Ottery.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/spur-twin-peak-ottery/", "https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/ottery/twin-peak-spur"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'twin-peak-spur-ottery'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-ottery', 'Clicks Pharmacy Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L-38, Pick n Pay Hyper Ottery, New Ottery Road, Ottery, Cape Town, 7808', '021 488 8470', NULL, NULL,
  'Clicks Pharmacy Ottery is a pharmacy and health, home and beauty store inside Ottery Hyper.',
  NULL, NULL,
  '["https://clicks.co.za/store/Pharmacy-Ottery-(PNP)/2158", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=211685"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-ottery'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-ottery', 'Spec-Savers Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L36, Ottery Centre, 23 Woodlands Road, Ottery, Cape Town', '0860 766 930', NULL, NULL,
  'Spec-Savers Ottery is an optometry practice inside Ottery Hyper.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/ottery/contact", "https://www.tiendeo.co.za/stores/cape-town/spec-savers-shop-l-ottery-centre-woodlands-road-ottery/54680"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-ottery'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tekkie-town-ottery', 'Tekkie Town Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L40, Ottery Centre, 362-364 New Ottery Road, Ottery, Cape Town, 7808', '087 808 2802', NULL, NULL,
  'Tekkie Town Ottery is a footwear retailer inside Ottery Hyper.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/tekkie-town-ottery", "https://m.facebook.com/TekkieTownOttery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tekkie-town-ottery'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-ottery', 'The Crazy Store Ottery',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Shop L41, Pick n Pay Hypermarket, Ottery Road, Ottery, Cape Town, 7808', '021 704 1775', NULL, NULL,
  'The Crazy Store Ottery is a discount variety and homeware retailer inside Ottery Hyper.',
  NULL, NULL,
  '["https://www.southafricabusinessdirectory.co.za/company/1468807997210624/the-crazy-store-ottery/cape-town/retail-stores", "https://www.callupcontact.com/b/businessprofile/The_Crazy_Store_Ottery/7724883"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-ottery'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fairfield-meat-centre-ottery', 'Fairfield Meat Centre',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Inside Food Lover''s Market, Entrance 3, Ottery Hyper, Ottery Road, Ottery, Cape Town, 7808', '079 496 3493', NULL, NULL,
  'Fairfield Meat Centre is a Halaal butchery counter inside Food Lover''s Market at Ottery Hyper.',
  NULL, NULL,
  '["https://fairfieldmeats.co.za/pages/contact", "https://www.facebook.com/Otteryhyper/videos/take-a-sneak-peek-at-the-brand-new-food-lovers-market-space-at-ottery-hyper-exci/3398587086973757/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fairfield-meat-centre-ottery'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-ottery', 'Nando''s (Ottery)',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  (SELECT id FROM shopping_centers WHERE slug = 'ottery-hyper-ottery'),
  'Servitude Road, Ground Floor, Ottery Hyper, Ottery, Cape Town, 7808', '021 703 0022', NULL, NULL,
  'Nando''s (Ottery) is a Nando''s flame-grilled chicken drive-thru restaurant at Ottery Hyper.',
  NULL, NULL,
  '["https://store.nandos.co.za/details/ottery", "https://www.tripadvisor.co.za/Restaurant_Review-g8131527-d8128970-Reviews-Nando_s_Drive_Thru-Ottery_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-ottery'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jafmed-pharmacy-ottery', 'Jafmed Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '328 Ottery Road, Ottery, Cape Town, 7800', '021 703 9791', NULL, NULL,
  'Jafmed Pharmacy is a retail pharmacy on Ottery Road in Ottery.',
  NULL, NULL,
  '["https://jafmed.co.za/", "https://www.thinklocal.co.za/biz/jafmed-pharmacy-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jafmed-pharmacy-ottery'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
