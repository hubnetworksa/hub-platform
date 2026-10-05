-- thin-pages pretoria batch 10, checkpoint 1: Colbyn (Vellie Boutique, Yu Furniture,
-- Cafe Barcelona, Colbyn Golf Park & Restaurant -- closes restaurants-takeaways to 3)
-- and Pretoria West (Goolams)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'vellie-boutique-colbyn', 'Vellie Boutique',
  (SELECT id FROM suburbs WHERE slug = 'colbyn'),
  '154 Thomson Street, Colbyn, Pretoria, 0083', '073 866 4670', 'https://vellieboutique.co.za', 'pretoria@vellieboutique.co.za',
  'Vellie Boutique, trading as Vellie Cartel, is a footwear and leather goods retailer specialising in vellies (veldskoene) along with boots, loafers, sandals and sneakers made from genuine leather. The range is sourced from local and international suppliers and sold alongside a selection of clothing and accessories, with new footwear styles added regularly and sized to fit a broad range of customers.

The business operates several branches across South Africa, including locations in Boksburg, Kempton Park and Durbanville, with its Pretoria store on Thomson Street in Colbyn. Customers can shop in person at the Colbyn store or order online for delivery, making it a stop for shoppers in the area looking for durable, comfortable leather footwear and casual accessories.',
  'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/114981597852082/Vellie-Boutique-Pretoria", "https://velliecartel.co.za/pages/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vellie-boutique-colbyn'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'yu-furniture-colbyn', 'Yu Furniture',
  (SELECT id FROM suburbs WHERE slug = 'colbyn'),
  'Shop 12, Hatfield Corner, Stanza Bopape St, Colbyn, Pretoria, 0083', '065 675 7535', 'https://yufurniture.co.za', 'sales@yufurniture.co.za',
  'Yu Furniture is an office furniture retailer supplying imported furnishings to workplaces across Pretoria and the wider Gauteng region. Its range includes executive desks, ergonomic office chairs, boardroom tables, reception counters and office storage units, aimed at businesses setting up new premises or upgrading existing workspaces, with new stock added to the range on an ongoing basis.

The business runs a showroom at Hatfield Corner on Stanza Bopape Street in Colbyn, Pretoria, where customers can view and compare furniture in person before purchasing. Beyond in-store sales, Yu Furniture offers delivery and professional assembly to customers across Pretoria and Gauteng, serving businesses in Hatfield, Arcadia, Brooklyn, Lynnwood and the surrounding areas from its Colbyn showroom.',
  NULL, NULL,
  '["https://www.facebook.com/YuFurniture/", "https://yufurniture.co.za/about-yu-furniture/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'yu-furniture-colbyn'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'cafe-barcelona-colbyn', 'Cafe Barcelona',
  (SELECT id FROM suburbs WHERE slug = 'colbyn'),
  '53 Thomson Street, Colbyn, Pretoria, 0153', '012 430 2495', NULL, 'info@cafebarcelona.co.za',
  'Cafe Barcelona is a restaurant and live music venue set in a Cape Dutch-style building framed by jacaranda trees. It combines a sit-down dining menu with a regular programme of live performances by South African musicians, operating as a restaurant, pub and entertainment space that hosts scheduled gigs and bookable events alongside its everyday food and drink service.

Set on Thomson Street in Colbyn, Pretoria, the venue has built a large local following for combining food, drinks and live music under one roof. Its ongoing schedule of performances and bookable events makes it a regular destination for diners and music audiences in the Colbyn area who are looking for a dinner-and-entertainment outing rather than a standard sit-down meal.',
  '["https://www.facebook.com/CafeBarcelonaGigs/", "https://za.africabz.com/gauteng/cafe-barcelona-26126", "https://www.africabizinfo.com/ZA/cafe-barcelona_3q-012-430-2495"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-barcelona-colbyn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'colbyn-golf-park-and-restaurant-colbyn', 'Colbyn Golf Park & Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'colbyn'),
  '58 Kilnerton Road, Colbyn, Pretoria, 0083', '+27 10 023 1148', NULL, NULL,
  'Colbyn Golf Park & Restaurant combines a golf driving range with an on-site grill restaurant, offering food and drink alongside practice facilities for golfers. The menu includes pizza, grilled meats and coffee, served across indoor and outdoor seating areas, with visitors noting the casual, affordably priced menu and relaxed, outdoor-facing atmosphere of the venue.

Located on Kilnerton Road in Colbyn, Pretoria, the venue functions as both a practice facility for golfers and a casual dining spot for visitors not using the driving range. It offers takeaway service, wheelchair-accessible facilities, parking and card payments, and is open daily, making it an option for a casual meal or a round of golf practice in the Colbyn area.',
  'Mon-Sun 08:00-22:00',
  '["https://restaurantguru.com/Colbyn-Golf-Park-Pretoria", "https://za.africabz.com/gauteng/colbyn-golf-park-19049"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colbyn-golf-park-and-restaurant-colbyn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'goolams-pretoria-west', 'Goolams',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-west'),
  '500 Charlotte Maxeke St, Pretoria West, Pretoria, 0183', '061 784 8335', NULL, NULL,
  'Goolams is a general store in Pretoria West stocking everyday essentials, snacks and household items in a single, convenient location. Reviewers describe a steady range of everyday goods with new stock added regularly, friendly service from staff, and affordable prices, making it a straightforward stop for quick errands or topping up household supplies.

The store is located on Charlotte Maxeke Street in Pretoria West, where it has built a loyal local following as a no-frills neighbourhood general store. It offers in-store shopping with a wheelchair-accessible entrance and parking, serving residents of Pretoria West who need a nearby option for snacks, essentials and household goods without travelling to a larger supermarket.',
  '["https://za.africabz.com/gauteng/goolams-637380", "https://www.cybo.com/ZA-biz/goolams_1x", "https://www.africabizinfo.com/ZA/goolams_1x-061-784-8335"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goolams-pretoria-west'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
