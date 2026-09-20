-- Philippi suburb research: Philippi Shopping Centre + tenants, and The Junxion Mall (new, queued for job 3)

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'philippi-shopping-centre-philippi', 'Philippi Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  'Cnr Lansdowne Rd & New Eisleben Rd, Philippi, Cape Town, 7785', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/philippi-shopping-centre.html", "https://www.sa-venues.com/things-to-do/westerncape/bysuburb/philippi/category/malls-and-shopping/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-philippi-shopping-centre-philippi', 'Ackermans Philippi Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Shop 6 & 7, Philippi Shopping Centre, Cnr Lansdowne & Eisleben Rds, Philippi, Cape Town, 7785', '021 371 0284', NULL, NULL,
  'Ackermans Philippi Shopping Centre is a value fashion and homeware retailer, in Philippi.',
  NULL, NULL,
  '["https://www.facebook.com/AckermansPhilippi/", "https://www.tiendeo.co.za/stores/crossroads/ackermans-philippi-shopping-centrecnr-lansdowne-eisleben-rds/15251"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-philippi-shopping-centre-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-philippi-shopping-centre-philippi', 'PEP Philippi Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Shop 13, Shoprite Centre, Cnr Lansdowne & New Eisleben, Philippi, Cape Town, 7758', '021 371 0011', NULL, NULL,
  'PEP Philippi Shopping Centre is a value clothing, footwear and homeware retailer, in Philippi.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-shoprite-centre-cnr-lansdowne-new-eisleben-philippi-cape-town-western-cape/12531", "https://my-catalogue.co.za/stores/philippi/pep-stores/shoprite-centre-cnr-lansdowne-new-eisleben"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-philippi-shopping-centre-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-philippi-philippi', 'Cashbuild Philippi',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Lansdowne Rd, Philippi Shopping Centre, Philippi, Cape Town, 7785', '021 371 9125', NULL, NULL,
  'Cashbuild Philippi is a building materials and hardware retailer, in Philippi.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/bysuburb/philippi/category/malls-and-shopping/", "https://www.yep.co.za/biz/store/iyp/2371682_2", "https://www.brabys.com/za/western-cape/cape-town/philippi/building-materials-supplies/cash-build"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-philippi-philippi'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pharmacy-penlyn-philippi', 'Pharmacy Penlyn',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Shoprite Philippi, Cnr Lansdowne & New Eisleben Rds, Philippi, Cape Town, 7785', '021 691 3179', NULL, NULL,
  'Pharmacy Penlyn is a pharmacy, in Philippi.',
  NULL, NULL,
  '["https://www.gems.gov.za/-/media/Healthcare-Providers-PDFS/network-of-healthcare-providers-pdfs-monthly-update/Primary-healthcare/pharmacies/Western-Cape.pdf", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Philippi/4803"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pharmacy-penlyn-philippi'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

-- New shopping centre discovered this run: The Junxion Mall (25,000+ sqm, completed 2019), also referred to as
-- "The Junction Mall" by several directory sources -- same physical centre (identical Govan Mbeki/New Eisleben
-- address). No accessible official-site tenant directory this run (WebFetch blocked to thejunxionmall.co.za) --
-- full reconciliation deferred to job 3's first sweep; the 3 tenants below were independently confirmable now.
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-junxion-mall-philippi', 'The Junxion Mall',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  'Cnr Govan Mbeki Rd & New Eisleben Rd, Philippi, Cape Town', NULL, NULL,
  '["https://www.pedi.org.za/post/junxion-mall-in-philippi", "https://www.mdaprojects.co.za/portfolio-items/new-junxion-mall/", "https://www.devmark.co.za/project/the-junction/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-the-junction-mall-philippi', 'Clicks Pharmacy The Junction Mall',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 21, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Rd, Philippi, Cape Town, 7750', '021 370 5449', NULL, NULL,
  'Clicks Pharmacy The Junction Mall is a pharmacy, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://clicks.co.za/store/The-Junction-Mall/1856", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=403703", "https://www.jamii.co.za/6432-philippi-pharmacy-clicks-pharmacy-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-the-junction-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
