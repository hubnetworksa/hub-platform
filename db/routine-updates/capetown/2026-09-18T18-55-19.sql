-- Round-6 batch. Every entry verified against 2+ independent,
-- branch-appropriate sources with mandatory phone+address. Covers Golden
-- Acre, Victoria Wharf and Cape Quarter discard-recovery passes, plus
-- Fish Hoek Town Square tenants.

-- Golden Acre (cape-town-cbd) discard recovery

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('fashion-city-golden-acre-cape-town-cbd', 'Fashion City', (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'), (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'), 'Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '083 303 8680', NULL, NULL, 'Fashion City is a fashion and clothing retailer, trading from Golden Acre.', NULL, NULL, '["https://golden-acre.co.za/stores/", "https://wanderlog.com/place/details/1778535/fashion-city"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'fashion-city-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('signature-cosmetics-golden-acre-cape-town-cbd', 'Signature Cosmetics', (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'), (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'), 'Golden Acre Shopping Centre, 9 Adderley St, Cape Town', '021 425 8338', NULL, NULL, 'Signature Cosmetics is a beauty and fragrance retailer, trading from Golden Acre.', NULL, NULL, '["https://golden-acre.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/signature-cosmetics-adderley-street/26063"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'signature-cosmetics-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('golden-acre-pharmacy-cape-town-cbd', 'Golden Acre Pharmacy', (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'), (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'), 'Golden Acre Shopping Centre, Shop 75, 9 Adderley St, Cape Town', '021 425 8786', NULL, NULL, 'Golden Acre Pharmacy is a retail pharmacy, trading from Golden Acre.', NULL, NULL, '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=87014", "https://www.brabys.com/za/western-cape/cape-town/central/pharmacies/golden-acre-pharmacy"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'golden-acre-pharmacy-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'pharmacies'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('park-health-golden-acre-cape-town-cbd', 'Park Health', (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'), (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'), 'Golden Acre Shopping Centre, Shop 46B, 9 Adderley St, Cape Town', '021 418 7224', NULL, NULL, 'Park Health is a general medical practice offering GP consultations and minor procedures, trading from Golden Acre.', NULL, NULL, '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=25751", "https://za.linkedin.com/company/park-health-medical-centres"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'park-health-golden-acre-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'doctors-gps'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('golden-acre-dental-practice-cape-town-cbd', 'Golden Acre Dental Practice', (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'), (SELECT id FROM shopping_centers WHERE slug = 'golden-acre-cape-town-cbd'), 'Golden Acre Shopping Centre, Shop 21A, 9 Adderley St, Cape Town', '021 461 7886', NULL, NULL, 'Golden Acre Dental Practice is a dental practice offering general dentistry, trading from Golden Acre.', NULL, NULL, '["https://www.recomed.co.za/dentist/cape-town/a-a-mia/5543/5336/", "https://nearbyza.com/medical-specialists/dentists/9-adderley-street-shop-21a-golden-acre-cbd-cape-town-city-centre-cape-town-8001-south-africa"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'golden-acre-dental-practice-cape-town-cbd'), (SELECT id FROM categories WHERE slug = 'dentists'), 1);

-- Victoria Wharf (va-waterfront) remaining leads

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('breitling-va-waterfront', 'Breitling', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 107, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 013 7800', NULL, NULL, 'Breitling is a Swiss luxury watch boutique specialising in aviation-inspired chronographs and timepieces, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.thevault.co.za/en/our-shops-the-vault/the-vault-cape-town-breitling", "https://www.breitling.com/za-en/stores/breitling-boutiques/za/breitling-boutique-cape-town/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'breitling-va-waterfront'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('browns-the-diamond-store-va-waterfront', 'Browns the Diamond Store', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 241, Upper Level, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 425 4045', NULL, NULL, 'Browns the Diamond Store is a fine jewellery and diamond retailer, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.waterfront.co.za/stores/browns-the-diamond-store", "https://www.fyple.co.za/company/browns-jewellers-south-africas-most-beautiful-diamonds-vanda-waterfront-15o4ho0/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'browns-the-diamond-store-va-waterfront'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('cape-union-mart-travel-safari-va-waterfront', 'Cape Union Mart Travel & Safari', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 142, Victoria Wharf Shopping Centre, 19 Dock Rd, V&A Waterfront, Cape Town', '021 419 0019', NULL, NULL, 'Cape Union Mart Travel & Safari is an outdoor and travel gear retailer offering safari-inspired clothing and equipment, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://brabys.com/south-africa/cape-town/verified-business/cape-union-mart-travel-safari", "https://absolutelylife.co.za/cape-union-mart---travel-safari-v-a-waterfront-6196138989481018881/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'cape-union-mart-travel-safari-va-waterfront'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('santa-ana-spur-va-waterfront', 'Santa Ana Spur', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 280, Victoria Wharf Shopping Centre, Breakwater Boulevard, V&A Waterfront, Cape Town', '+27 64 630 6224', NULL, NULL, 'Santa Ana Spur is a family-style steakhouse and grill restaurant overlooking the harbour, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/victoria-&-alfred-waterfront/santa-ana-spur", "https://www.eatout.co.za/venue/spur-va-waterfront/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'santa-ana-spur-va-waterfront'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('superdry-va-waterfront', 'Superdry', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Victoria Wharf Shopping Centre, 1 Breakwater Blvd, V&A Waterfront, Cape Town', '021 418 2748', NULL, NULL, 'Superdry is a British fashion retailer offering clothing, footwear and accessories for men and women, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://stores.superdry.com/za/cape-town/victoria-wharf-shopping-centre", "https://www.waterfront.co.za/stores/superdry-store/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'superdry-va-waterfront'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('cotton-on-va-waterfront', 'Cotton On', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 146B, Ground Level, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 418 1057', NULL, NULL, 'Cotton On is an affordable fashion and lifestyle retailer offering clothing, accessories and homeware, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.waterfront.co.za/stores/cotton-on", "https://www.tiendeo.co.za/stores/cape-town/cotton-on-shop-b-va-waterfront/74619"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'cotton-on-va-waterfront'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('swatch-va-waterfront', 'Swatch', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shop 246, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 421 0155', NULL, NULL, 'Swatch is a Swiss watch retailer offering colourful contemporary timepieces, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.waterfront.co.za/stores/swatch/", "https://www.tiendeo.co.za/stores/cape-town/swatch-victoria-wharf/24488"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'swatch-va-waterfront'), (SELECT id FROM categories WHERE slug = 'jewellers'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('old-khaki-va-waterfront', 'Old Khaki', (SELECT id FROM suburbs WHERE slug = 'va-waterfront'), (SELECT id FROM shopping_centers WHERE slug = 'victoria-wharf-shopping-centre-va-waterfront'), 'Shops 7245-7246, Upper Level, Victoria Wharf Shopping Centre, 3 Dock Rd, V&A Waterfront, Cape Town', '021 418 2240', NULL, NULL, 'Old Khaki is a casual lifestyle clothing retailer for men and women, trading from Victoria Wharf Shopping Centre.', NULL, NULL, '["https://www.waterfront.co.za/stores/old-khaki-2", "https://www.tiendeo.co.za/stores/cape-town/old-khaki-shop-va-shopping-centre-breakwater-boulevard-waterfront/15548"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'old-khaki-va-waterfront'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

-- Cape Quarter (de-waterkant) discard recovery

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('high-street-lingerie-de-waterkant', 'High Street Lingerie', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop 41, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '074 885 1927', NULL, NULL, 'High Street Lingerie is a lingerie and intimate apparel boutique stocking brands such as KAAL by Roxy Louw, Victoria''s Secret and DKNY, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.highstreetshopping.co.za/pages/about-us"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'high-street-lingerie-de-waterkant'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('shade-and-co-de-waterkant', 'Shade & Co', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop 037, The Square, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '076 257 8362', NULL, NULL, 'Shade & Co is a boutique eyewear retailer selling handmade designer sunglasses and optical frames from premium brand ateliers, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.shadeandcompany.co.za/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'shade-and-co-de-waterkant'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('olivia-grey-de-waterkant', 'Olivia Grey', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop 011, Cape Quarter, 27 Somerset Road, De Waterkant, Cape Town', '087 012 5099', NULL, NULL, 'Olivia Grey is an intimate lifestyle and adult-products store selling sexual wellness items and accessories, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.findglocal.com/ZA/Cape-Town/305574869882419/Olivia-Grey"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'olivia-grey-de-waterkant'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('palladium-hair-co-de-waterkant', 'Palladium Hair Co', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop 17a, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '021 418 2242', NULL, NULL, 'Palladium Hair Co is a hair salon offering cutting, colouring and styling services, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://palladiumhair.com/contact/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'palladium-hair-co-de-waterkant'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('sorbet-salon-de-waterkant', 'Sorbet', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop SH037, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '021 418 4308', NULL, NULL, 'Sorbet is a beauty salon and nail bar offering manicures, pedicures, waxing and beauty treatments, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://stores.salonssorbet.co.za/western-cape/cape-town/cape-quarter-sh037"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'sorbet-salon-de-waterkant'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('wunders-furniture-de-waterkant', 'Wunders Furniture', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), '32 Napier Street, Cape Quarter, De Waterkant, Cape Town', '021 418 0331', NULL, NULL, 'Wunders is a South African furniture design and manufacturing showroom selling handcrafted, customisable furniture, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://wunders.co.za/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'wunders-furniture-de-waterkant'), (SELECT id FROM categories WHERE slug = 'furniture-homeware'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('left-field-tattoo-de-waterkant', 'Left Field Tattoo', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Unit A21, Cape Quarter Square, Dixon Street, De Waterkant, Cape Town', '079 988 6067', NULL, NULL, 'Left Field Tattoo is a tattoo and piercing studio offering custom tattoo work and body piercing, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.fresha.com/lvp/left-field-tattoo-dixon-street-cape-town-Ly9xR2"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'left-field-tattoo-de-waterkant'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('ryans-car-wash-de-waterkant', 'Ryan''s Car Wash', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Cape Quarter Lifestyle Village, 27 Somerset Road (Parking Level F), De Waterkant, Cape Town', '021 425 2523', NULL, NULL, 'Ryan''s Car Wash is a car wash and valet service offering vehicle cleaning, polishing and detailing, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://ryanscarwash.co.za/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'ryans-car-wash-de-waterkant'), (SELECT id FROM categories WHERE slug = 'automotive-repairs'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('veloce-luxury-car-rental-de-waterkant', 'Veloce Luxury Car Rental', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop 103C, 1st Floor, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '083 556 4717', NULL, NULL, 'Veloce Luxury Car Rental is a self-drive and chauffeur-driven luxury and supercar rental company, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.veloceluxurycarrental.co.za/about"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'veloce-luxury-car-rental-de-waterkant'), (SELECT id FROM categories WHERE slug = 'automotive-repairs'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('drifters-xtreme-sport-de-waterkant', 'Drifters Xtreme Sport', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '021 110 5473', NULL, NULL, 'Drifters Xtreme Sport is an outdoor and adventure gear retailer stocking camping, hiking and rock-climbing equipment, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://www.climbing.co.za/listing/drifters-xtreme-sport/"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'drifters-xtreme-sport-de-waterkant'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin) VALUES
('sports-concept-store-de-waterkant', 'The Sports Concept Store', (SELECT id FROM suburbs WHERE slug = 'de-waterkant'), (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'), 'Shop D03, Cape Quarter Lifestyle Village, 27 Somerset Road, De Waterkant, Cape Town', '021 286 9070', NULL, NULL, 'The Sports Concept Store is a performance running-shoe and sporting-apparel retailer stocking brands such as HOKA, On, Asics and Under Armour, trading from Cape Quarter.', NULL, NULL, '["https://capequarter.co.za/shops/", "https://thesportsconceptstore.co.za/pages/about-us"]', 'published', 'agent_research');
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES ((SELECT id FROM businesses WHERE slug = 'sports-concept-store-de-waterkant'), (SELECT id FROM categories WHERE slug = 'fashion-clothing'), 1);

-- Fish Hoek Town Square tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, shopping_center_id)
VALUES (
  'woolworths-fish-hoek-town-square-fish-hoek', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Fish Hoek Town Square, 61 Main Road, Fish Hoek, Cape Town', '021 782 0410', NULL, NULL,
  'Woolworths is a supermarket and grocery store located in Fish Hoek Town Square on Main Road, Fish Hoek.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/fish-hoek/woolworths/town-square-shopping-centre-main-rd", "http://www.fishhoek.com/pages/stores.html"]',
  'published', 'agent_research',
  (SELECT id FROM shopping_centers WHERE slug = 'fish-hoek-town-square-fish-hoek')
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'woolworths-fish-hoek-town-square-fish-hoek'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, shopping_center_id)
VALUES (
  'zone-fitness-fish-hoek-town-square-fish-hoek', 'Zone Fitness',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '1st Floor, Fish Hoek Town Square, Main Road, Fish Hoek, Cape Town', '021 782 7287', 'https://www.zonefitness.co.za', NULL,
  'Zone Fitness is a gym located on the first floor of Fish Hoek Town Square on Main Road, Fish Hoek.',
  NULL, NULL,
  '["https://www.fishhoektownsquare.co.za/a-z-stores/", "https://www.zonefitness.co.za/clubs/fish-hoek"]',
  'published', 'agent_research',
  (SELECT id FROM shopping_centers WHERE slug = 'fish-hoek-town-square-fish-hoek')
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'zone-fitness-fish-hoek-town-square-fish-hoek'), (SELECT id FROM categories WHERE slug = 'fitness-gyms'), 1);
