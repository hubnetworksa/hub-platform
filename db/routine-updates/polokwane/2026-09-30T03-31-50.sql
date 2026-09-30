INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-polokwane-polokwane-central', 'Standard Bank Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '49 Landdros Mare Street, Polokwane Central, Polokwane, 0700', '0860 123 000', NULL, NULL,
  'Standard Bank Polokwane is a bank branch on Landdros Mare Street in Polokwane Central, offering everyday banking, card and ATM services.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Banks/Standard_Bank_Polokwane/41614", "https://bankcodesfinder.com/south-africa-bank-branch-codes/standard_bank_of_s_a_ltd/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-polokwane-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-polokwane-central', 'Steers',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '8 Grobler Street, Engen Greycorp Convenience Centre, Polokwane Central, 0700', '015 291 5711', NULL, NULL,
  'Steers is a flame-grilled burger and chicken takeaway at the Engen Greycorp filling station on Grobler Street, part of the national Steers chain.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/steers-engen-vivo-filling-station-grobler-street/36090", "https://my-catalogue.co.za/stores/polokwane/steers/engen-fuel-station-8-grobler-street"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chicken-licken-fly-thru-polokwane-central', 'Chicken Licken Fly-Thru',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '11B Grobler Street, Polokwane Central, Polokwane, 0700', '015 004 0439', NULL, NULL,
  'Chicken Licken Fly-Thru is a fried-chicken fast-food outlet with a drive/fly-thru service on Grobler Street in Polokwane Central, part of the national Chicken Licken chain.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/lp/polokwane/chicken-licken-fly-thru", "https://restaurantguru.com/Chicken-Licken-Fly-Thru-Polokwane-2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chicken-licken-fly-thru-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jacaranda-lodge-polokwane-central', 'Jacaranda Lodge',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '57 Voortrekker Street, Polokwane Central, Polokwane, 0699', '015 295 5554', NULL, NULL,
  'Jacaranda Lodge is a guesthouse on Voortrekker Street offering luxury and standard en-suite rooms, 24-hour security, free Wi-Fi and conference facilities.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/jacaranda-lodge", "https://www.yellosa.co.za/company/168085/jacaranda-overnight-accommodation"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jacaranda-lodge-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-limpopo-mall-polokwane-central', 'Clicks Limpopo Mall',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'limpopo-mall-polokwane-central'),
  'Shop 40, Limpopo Mall, Cnr Market & Rissik Street, Polokwane Central, 0699', '015 297 1594', NULL, NULL,
  'Clicks Limpopo Mall is a pharmacy and health-and-beauty retailer inside Limpopo Mall, part of the national Clicks chain.',
  NULL, NULL,
  '["https://clicks.co.za/store/Middestad-Mall/309", "https://www.tiendeo.co.za/stores/polokwane/clicks-middestad-co-market-street-and-rissik-street/27989"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-limpopo-mall-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-qualisave-limpopo-mall-polokwane-central', 'Pick n Pay Qualisave Limpopo Mall',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'limpopo-mall-polokwane-central'),
  'Limpopo Mall, Cnr Rissik & Kerk Street, Polokwane Central, 0699', '015 297 2210', NULL, NULL,
  'Pick n Pay Qualisave Limpopo Mall is a supermarket inside Limpopo Mall, part of the national Pick n Pay chain.',
  NULL, NULL,
  '["https://www.netpages.co.za/Polokwane/Pick+n+Pay-Limpopo+Mall-170942.html", "https://www.cybo.com/ZA-biz/pick-n-pay-polokwane-cbd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-qualisave-limpopo-mall-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-limpopo-mall-polokwane-central', 'Capitec Bank Limpopo Mall',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'limpopo-mall-polokwane-central'),
  'Shop 16, Limpopo Mall, Market Street, Polokwane Central, 0699', '015 297 7431', NULL, NULL,
  'Capitec Bank Limpopo Mall is a bank branch inside Limpopo Mall, offering everyday banking, card and ATM services.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/capitec-bank-polokwane-middestad-mall-23614257.html", "https://dir.alltrack.org/view/376754-3-capitec-bank-polokwane-middestad-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-limpopo-mall-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'truworths-limpopo-mall-polokwane-central', 'Truworths Limpopo Mall',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  (SELECT id FROM shopping_centers WHERE slug = 'limpopo-mall-polokwane-central'),
  'Shop 37, Limpopo Mall, Cnr Rissik & Market Street, Polokwane Central, 0699', '015 297 4834', NULL, NULL,
  'Truworths Limpopo Mall is a fashion and clothing retailer inside Limpopo Mall, part of the national Truworths chain.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/truworths-limpopo-mall-in-polokwane", "https://www.shopshours.co.za/truworths/polokwane/c-57f3ca0a47d677c3b27ad1e6"]',
  'published', 'agent_research', 'Mon-Sat 10:00-20:00, Sun Closed'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-limpopo-mall-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
