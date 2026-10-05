-- thin-pages pretoria batch 03: checkpoint 2 (Silverton: Car Dealerships x2, Furniture & Homeware, Motor Spares, Books & Stationery)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'aurinia-ford-silverton-silverton', 'Aurinia Ford Silverton',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  '478 Pretoria Road, Silverton, Pretoria, 0127', '012 804 2369', 'https://www.auriniaauto.co.za', NULL,
  'Aurinia Ford Silverton is a Ford dealership on Pretoria Road in Silverton, selling new and used Ford vehicles alongside a full service and parts department. As a Quality Care Dealer, the branch carries the brand''s current passenger and commercial range and offers trade-ins, finance arrangements and after-sales support for owners in the area.

The workshop handles scheduled servicing, maintenance plans and repairs for Ford owners, backed by a dedicated parts counter stocking genuine components. Open six days a week with extended weekday hours and a Saturday morning slot, the dealership serves Silverton and the wider eastern Pretoria and Centurion area for buyers wanting a factory-backed alternative to independent used-car lots and workshops.',
  'Mon-Fri 07:30-17:30, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/aurinia-ford-silverton-012-804-2369", "https://za.africabz.com/gauteng/aurinia-ford-silverton-27426", "https://www.auriniaauto.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aurinia-ford-silverton-silverton'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bb-nissan-silverton-silverton', 'BB Nissan Silverton',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  'Cnr Pretoria Road and Fountain Street, Silverton, Pretoria', '012 804 8166', 'https://bbsilverton.co.za', NULL,
  'BB Nissan Silverton is a Nissan dealership on the corner of Pretoria Road and Fountain Street in Silverton, selling new Nissan passenger and commercial vehicles including the Magnite and Navara ranges. The dealership also runs a pre-owned sales operation under its Black Hawk used-vehicle brand, giving buyers a factory-linked alternative to independent used-car dealers in the area.

A dedicated service and parts department supports Nissan owners with scheduled maintenance, repairs and genuine parts, and the sales team can arrange trade-ins and vehicle finance. Part of the BB Motor Group, the Silverton branch serves Nissan owners across Silverton and the surrounding eastern Pretoria suburbs who want dealership-backed sales and aftersales care close to home.',
  NULL, NULL,
  '["https://bbsilverton.co.za/contact-us/", "https://www.cars.co.za/groups/Individual-Dealers/BB-Silverton-Nissan/442/", "https://za.africabz.com/gauteng/bb-silverton-nissan-16114"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bb-nissan-silverton-silverton'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cabanas-furniture-and-appliance-silverton', 'Cabanas Furniture & Appliance',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  '682 Pretoria Road, Silverton, Pretoria', '087 821 3564', 'https://www.cabanasfurn.co.za', 'cabanafurn@gmail.com',
  'Cabanas Furniture & Appliance is a furniture and appliance store on Pretoria Road in Silverton, selling both new and second-hand stock at competitive prices. The range covers furniture for every room in the home, from lounge suites and dining tables to bedroom pieces, alongside household appliances, giving shoppers a budget-friendly alternative to buying everything new.

The store can assist in-store with a credit application for personal asset finance through a third-party finance provider, making larger furniture and appliance purchases easier to afford. Trading six days a week with a shorter Saturday morning session, Cabanas serves shoppers furnishing or upgrading homes in Silverton and the surrounding eastern Pretoria suburbs.',
  'Mon-Fri 09:00-17:30, Sat 09:00-15:00, Sun Closed',
  NULL, NULL,
  '["https://www.cabanasfurn.co.za/Contact-Us/", "https://thebranchlocator.com/shop/listing/cabana-furniture-appliances-silverton/", "https://destinali.com/pretoria/home-furnishing/cabanas-furniture-appliances-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cabanas-furniture-and-appliance-silverton'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kotwals-motor-spares-silverton-silverton', 'Kotwals Motor Spares Silverton',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  '525 Pretoria Road, Silverton, Pretoria', '012 004 0779', 'https://www.kotwals.com', NULL,
  'Kotwals Motor Spares Silverton is a vehicle parts shop on Pretoria Road in Silverton, part of the Kotwals Motor Spares group that trades from dozens of branches across Gauteng. The Silverton store supplies new and replacement spares to both members of the public and the trade, covering a broad range of makes and components at competitive pricing.

As with other branches in the group, the store focuses on fast, affordable access to everyday mechanical and body parts rather than specialising in a single brand. Its Silverton location serves motorists and small workshops across Silverton and the surrounding eastern Pretoria suburbs looking for spares without the wait or markup of a dealership parts counter.',
  NULL, NULL,
  '["https://destinali.com/pretoria/automobile-spare-parts/kotwals-motor-spares-silverton-pretoria", "https://www.koreanmotorsparesnearme.co.za/listings/kotwals-motor-spares-silverton", "https://www.facebook.com/KotwalsMS/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kotwals-motor-spares-silverton-silverton'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'silverton-stationery-warehouse-silverton', 'Silverton Stationery Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'silverton'),
  '213 Dykor Street, Silverton, Pretoria', '012 804 9418', NULL, NULL,
  'Silverton Stationery Warehouse is a stationery and printing supplies business trading from Dykor Street in Silverton, Pretoria. It stocks a wide range of office and school stationery alongside continuous and individual-form printing products, serving both households and local businesses that need paperwork, forms and everyday office supplies.

The warehouse format lets the business carry bulk stationery lines at competitive prices, making it a practical stop for schools, offices and small businesses restocking supplies in volume rather than buying individual items at general retail prices. It serves shoppers and businesses across Silverton and the surrounding eastern Pretoria suburbs who need stationery, printed forms or office consumables close to home rather than travelling into central Pretoria.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/silverton-stationery-warehouse-pty-ltd_1W-012-804-9418", "https://www.ivote.co.za/view/south-africa/silverton-stationery-warehouse-in-pretoria", "https://halaman-kuning.cybo.com/ZA-biz/silverton-stationery-warehouse-pty-ltd_1W"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'silverton-stationery-warehouse-silverton'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);
