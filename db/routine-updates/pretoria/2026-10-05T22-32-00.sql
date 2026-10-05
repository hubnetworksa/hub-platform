INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'hindsight-motors-clubview', 'Hindsight Motors',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  '732 Old Johannesburg Road, Clubview, Centurion, 0157', '012 772 7797', NULL, NULL,
  'Hindsight Motors - Cartocash.co.za is a used car dealership located at 732 Old Johannesburg Road in Clubview, Centurion. The dealership offers a selection of well-priced used vehicles across a range of budgets, paired with thorough vehicle checks before sale and guidance intended to help buyers reach a decision with confidence.

The business is housed in a dedicated showroom and accepts credit card payments, with wheelchair-accessible parking and an accessible entrance on site. It is one of several used car dealers serving the Clubview and wider Centurion area, giving buyers a local alternative to the big dealership chains when shopping for a pre-owned vehicle.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/hindsight-motors-cartocashcoza","https://www.africabizinfo.com/ZA/hindsight-motors-cartocash-co-za-012-772-7797","https://www.yellowpages.net.za/phone-27-127727797-car-dealer-Centurion-ZA113224.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hindsight-motors-clubview'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mfi-auto-clubview', 'MFI Auto',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'Shop No. 11, Cnr Lyttelton & Riverview Road, Clubview Centre, Clubview, Centurion', '087 543 8211', NULL, NULL,
  'MFI Auto is a used car dealership operating from Shop No. 11 on the corner of Lyttelton Road and Riverview Road at Clubview Centre in Centurion. The dealership carries a rotating stock of used vehicles spanning hatchbacks, sedans, SUVs and double-cab bakkies, with brands on the floor including BMW, Mercedes-Benz, Volkswagen, Toyota, Ford and Hyundai.

Vehicles are listed individually with details such as mileage, year, transmission and fuel type, and the dealership has built up a base of customer reviews through the online vehicle marketplaces it trades on. Based inside the Clubview Centre shopping node, MFI Auto gives residents of Clubview and the surrounding Centurion suburbs a nearby option for buying a pre-owned vehicle without travelling into central Pretoria.',
  NULL,
  NULL, NULL,
  '["https://www.cars.co.za/groups/Individual-Dealers/MFI-Auto/7912/","https://www.mfiauto.co.za/","https://www.autotrader.co.za/dealer/mfi-auto/137800"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mfi-auto-clubview'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-eye-geo-and-environ-pty-ltd-clubview', 'Tigers Eye Geo and Environ (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'CB Centre, 75 Durham Road, Clubview East, Centurion, 0157', '072 910 7017', NULL, NULL,
  'Tigers Eye Geo and Environ (Pty) Ltd is a geotechnical and environmental engineering consultancy with an office at the CB Centre on Durham Road in Clubview East, Centurion. The company carries out site assessments, project design input and environmental compliance work for construction and development projects in the area.

Besides its Centurion branch, the firm also operates from offices in Pretoria''s Sunnyside and in Polokwane, giving it reach beyond this single location, though the Clubview East office serves as its base for work in and around Centurion. Its services are aimed at developers, contractors and property owners who need geotechnical or environmental input before or during a building project.',
  NULL,
  NULL, NULL,
  '["https://www.tigersgeo.co.za/contact/","https://pretoria.co.za/place/tigers-eye-geo-and-environ-pty-ltd","https://www.africabizinfo.com/ZA/tigers-eye-geo-and-environ-pty-ltd-072-910-7017"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tigers-eye-geo-and-environ-pty-ltd-clubview'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'sonja-smith-funeral-group-clubview', 'Sonja Smith Funeral Group',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  '85 Lyttelton Road, Clubview, Centurion, 0157', '012 654 9902', NULL, NULL,
  'Sonja Smith Funeral Group (Pty) Ltd is a funeral services company with its head office and service centre at 85 Lyttelton Road in Clubview, Centurion. The group has operated in the funeral industry since 1998, offering burials, memorials, embalming, exhumations and repatriation services, together with funeral policies and tombstones.

From its Clubview head office, the group runs a round-the-clock emergency contact line and coordinates a network of branches and franchises across Gauteng and beyond, including a further Clubview branch on Edinburgh Avenue East. Families in Clubview and the surrounding Centurion suburbs can arrange funeral services directly through this head office location.',
  NULL,
  NULL, NULL,
  '["https://pretoria.infoisinfo.co.za/card/sonja-smith-funeral-group-pty-ltd/302902","https://sonjasmith-funerals.co.za/branches-and-franchises/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sonja-smith-funeral-group-clubview'),
  (SELECT id FROM categories WHERE slug = 'funeral-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-queen-pet-shop-clubview', 'The Queen Pet Shop',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'Clubview Corner, Cnr Lyttelton Road & Harvard Avenue, Clubview, Centurion, 0157', '012 942 9394', NULL, NULL,
  'The Queen Pet Shop is a pet supply store trading from Clubview Corner, on the corner of Lyttelton Road and Harvard Avenue in Centurion. It is one of several branches making up The Queen Pet Shop chain, offering pet food, accessories and other supplies for dogs, cats and other household pets.

Situated among the speciality stores at Clubview Corner, alongside the centre''s SPAR supermarket, pharmacy and several food outlets, the shop forms part of a convenience-focused retail mix on the corner of Lyttelton Road and Harvard Avenue. It gives Clubview residents a dedicated local option for pet food and accessories without needing to travel to a larger pet superstore elsewhere in Centurion or Pretoria, and is listed alongside the chain''s other branches on the company''s own store locator.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/the-queen-pet-shop-clubview-012-942-9394","https://queenpets.co.za/pages/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-queen-pet-shop-clubview'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pizza-perfect-clubview-clubview', 'Pizza Perfect Clubview',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'Clubview Corner, Cnr Lyttelton Road & Harvard Avenue, Clubview, Centurion, 0157', '012 654 1228', NULL, NULL,
  'Pizza Perfect Clubview is a branch of the Pizza Perfect restaurant chain, trading from the Clubview Corner shopping centre on the corner of Lyttelton Road and Harvard Avenue in Centurion. The outlet serves pizza and other Italian-style dishes for sit-down dining as well as takeaway orders.

As one of several food tenants at Clubview Corner, alongside other restaurants and the centre''s SPAR supermarket, Pizza Perfect Clubview gives residents of Clubview and nearby parts of Centurion a nearby option for a pizza meal or a takeaway order without needing to leave the local shopping centre. The branch operates within the centre''s general trading hours, seven days a week.',
  NULL,
  NULL, NULL,
  '["https://www.yellowpages.net/phone-27-126541228-italian-restaurant-Centurion-ZA268437.html","https://za.africabz.com/gauteng/pizza-perfect-clubview-4576"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizza-perfect-clubview-clubview'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'burger-bistro-clubview-clubview', 'Burger Bistro Clubview',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'Shop 6, Clubview Corner, Cnr Lyttelton Road & Harvard Avenue, Clubview, Centurion, 0157', '012 654 0825', NULL, NULL,
  'Burger Bistro Clubview operates from Shop 6 at the Clubview Corner shopping centre, on the corner of Lyttelton Road and Harvard Avenue in Centurion. The restaurant specialises in burgers, serving a casual sit-down and takeaway menu to shoppers and residents in the area.

The outlet forms part of the food offering at Clubview Corner, which also includes a pizza restaurant, a Chinese restaurant and other eateries alongside the centre''s SPAR supermarket and specialty stores. Burger Bistro Clubview gives local residents a casual dining and takeaway option within walking distance of home in Clubview, operating within the shopping centre''s general trading hours.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/burger-bistro-clubview-012-654-0825","https://www.findglocal.com/ZA/Centurion/2148038661886136/Burger-Bistro-Clubview"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'burger-bistro-clubview-clubview'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'emppro-clubview', 'EMPPRO',
  (SELECT id FROM suburbs WHERE slug = 'clubview'),
  'Zwartkop Golf Estate, 29 Nelson Woods Drive, Clubview, Centurion, 0157', '071 380 9691', NULL, NULL,
  'EMPPRO, also known as EmpPro, is a human resources and recruitment consultancy based at Zwartkop Golf Estate, 29 Nelson Woods Drive in Clubview, Centurion. The business describes itself as an HR and employee relations specialist, providing onsite HR services, tailored staffing support and practical HR strategy advice aimed at helping other businesses manage their people processes.

Operating on weekdays from its Clubview office, EMPPRO works with client businesses across the wider Centurion area, offering an alternative to larger national recruitment agencies for companies that want a more hands-on, locally based HR and staffing partner. The consultancy has built up a small base of client reviews through local business directories covering the Centurion area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/emppro","https://destinali.com/centurion/hr-recruitment/emppro-centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'emppro-clubview'),
  (SELECT id FROM categories WHERE slug = 'recruitment-hr-services'),
  1
);

