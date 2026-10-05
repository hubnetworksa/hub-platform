-- Thin-page fill, Pretoria batch 9, checkpoint 4: Brummeria + Marabastad
-- Note: a 7th candidate, "Calais Property Managers and Rentals"
-- (commercial-property-office-space/brummeria), was dropped before writing
-- this file -- its phone (082 921 2439) and address (Unit D, Calais Centre,
-- 58 Hendrik Ave, Brummeria) are already attached to the existing published
-- business atriplea-recruitment-and-temps-brummeria. Same office/line, not a
-- distinct new branch, so not re-inserted.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'marabi-auto-spares-and-body-parts-marabastad', 'Marabi Auto Spares & Body Parts',
  (SELECT id FROM suburbs WHERE slug = 'marabastad'),
  '533 11th Ave, Marabastad, Pretoria, 0142', '012 326 1310', 'http://www.marabiauto.co.za', 'marabiinfo@gmail.com',
  'Marabi Auto Spares & Body Parts is an auto parts store in Marabastad, Pretoria, supplying replacement spares and body parts for vehicles. The business is registered under the Automotive industry category as an Auto Parts Store, serving motorists and workshops who need parts without going through a franchise dealership.

The shop trades from 11th Avenue in Marabastad and can be reached by phone or email, with its own website listed alongside its contact details. It keeps regular hours from Monday to Saturday, with a shorter day on Friday that includes a midday break, and is closed on Sundays. Customers in and around Marabastad can collect parts directly from the store during trading hours.',
  'Mon-Thu 08:00-17:00, Fri 08:00-12:00 & 13:30-17:00, Sat 08:00-16:30, Sun Closed', NULL, NULL,
  '["https://www.africabizinfo.com/ZA/marabi-auto-spares-body-parts-012-326-1310", "https://www.findmy.co.za/services/business/morabi-autobody-parts-spares/86852", "https://www.marabiauto.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marabi-auto-spares-and-body-parts-marabastad'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'new-market-butchery-marabastad', 'New Market Butchery',
  (SELECT id FROM suburbs WHERE slug = 'marabastad'),
  '40 Boom St, Marabastad, Pretoria', '012 323 1710', NULL, NULL,
  'New Market Butchery is a butcher shop on Boom Street in Marabastad, Pretoria, selling fresh meat to shoppers and traders in the area. It operates as an independent, standalone butchery rather than as part of a chain, and is listed among the meat suppliers and butcher shops serving the busy Marabastad and Pretoria Central trading district, an area long known for its market stalls and small independent traders.

The shop is open six days a week, Monday to Saturday, with stated hours of 08:00 to 18:00. A customer review on a local business directory describes it as a regular stop for good quality meat, praising the staff and management for their service and describing it as among the best in the area.',
  'Mon-Sat 08:00-18:00', NULL, NULL,
  '["https://za.africabz.com/gauteng/new-market-butchery-634858", "https://www.worldofmeats.co.za/view/new-market-butchery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'new-market-butchery-marabastad'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'busstop-butchery-marabastad', 'Busstop Butchery',
  (SELECT id FROM suburbs WHERE slug = 'marabastad'),
  '104 2nd St, Marabastad, Salvokop, Pretoria, 0002', '012 323 5953', NULL, NULL,
  'Busstop Butchery is a butcher shop in Marabastad, Pretoria, operating from 2nd Street in the Marabastad area, within the Salvokop postal district. It is an independent, standalone outlet rather than a branch of a national chain, trading alongside the other small shops and traders that make up this part of Pretoria.

The business can be contacted by phone and is listed in local business directories under the butcher shop category for the Marabastad and Pretoria Central area. Like other small traders in Marabastad, a historic and long-established trading district, it serves local shoppers looking for fresh meat close to home.',
  NULL, NULL, NULL,
  '["https://www.africabizinfo.com/ZA/busstop-butchery_10-012-323-5953", "https://www.africanadvice.com/1064520/Butcher_Shops/Pretoria/Busstop_Butchery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'busstop-butchery-marabastad'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'body-kinetics-brummeria', 'Body Kinetics',
  (SELECT id FROM suburbs WHERE slug = 'brummeria'),
  'CSIR Building 24, Meiring Naudé Road, Brummeria, Pretoria', '012 841 4141', 'https://www.bodykinetics.co.za', 'info@bodykinetics.co.za',
  'Body Kinetics is a gym located inside Building 24 of the CSIR campus on Meiring Naudé Road in Brummeria, Pretoria. The facility offers access 24 hours a day, seven days a week, and has qualified biokineticists on hand to assist members with their training and recovery.

Because it sits inside the CSIR campus, the gym is positioned to serve people working in and around the science and research precinct in Brummeria, as well as other members from the surrounding area. It can be reached by phone, email or through its own website, and offers wheelchair-accessible facilities for members who need them.',
  'Open 24 hours', NULL, NULL,
  '["https://www.africabizinfo.com/ZA/body-kinetics_5p-012-841-4141", "https://www.localgymsandfitness.com/ZA/Pretoria/892176830862598/Body-Kinetics"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'body-kinetics-brummeria'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'st-paulus-pre-primary-and-primary-school-brummeria', 'St Paulus Pre-Primary and Primary School',
  (SELECT id FROM suburbs WHERE slug = 'brummeria'),
  '23 Boekenhout Street, Brummeria, Pretoria, 0184', '012 804-9670', 'https://stpaulus.co.za', 'admissions@stpaulus.co.za',
  'St Paulus Pre-Primary and Primary School is an independent, dual-medium, co-educational Catholic school in Brummeria, Pretoria East. The school has been operating for more than 60 years and is an accredited member of the Independent Schools Association of Southern Africa and the Catholic Schools Board, offering education from pre-primary through to primary level.

The school occupies a 26-hectare campus set against a koppie in Brummeria, with indigenous fauna and flora on the grounds, and runs a pre-primary programme for children aged four to six alongside its primary school. An aftercare facility is available for pupils who need supervised care after school hours, where children are given a meal and kept productively occupied until they are collected. The school office can be reached by phone or email for admissions enquiries.',
  'Mon-Fri 07:30-16:00', NULL, NULL,
  '["https://stpaulus.co.za/contact", "https://www.schools4sa.co.za/province/gauteng/pretoria/?suburb_filter=646"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'st-paulus-pre-primary-and-primary-school-brummeria'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'swopp-brummeria', 'Swopp',
  (SELECT id FROM suburbs WHERE slug = 'brummeria'),
  '72 Brummeria Rd, Pretoria, 0081', '+27 61 413 1558', 'https://swopp.co.za', NULL,
  'Swopp is a certified pre-owned technology store on Brummeria Road in Pretoria, selling second-hand iPhones, MacBooks, iPads, Apple Watches and Samsung devices, along with consoles such as PlayStation and Xbox. Each device is checked before resale and comes with a warranty, and the store also buys devices from customers who want to sell or trade in their old tech.

The shop trades on weekdays from 09:00 to 16:30 and is closed on both Saturdays and Sundays. Swopp offers delivery on orders and a return period for customers who are not satisfied with their purchase, giving shoppers in Pretoria East a lower-cost option to buying new devices.',
  'Mon-Fri 09:00-16:30, Sat Closed, Sun Closed', NULL, NULL,
  '["https://firmania.co.za/pretoria/swopp-223315", "https://swopp.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'swopp-brummeria'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
