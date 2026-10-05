-- thin-pages pretoria batch 10, checkpoint 3: Wonderboom South (10 businesses --
-- closes printing-services and restaurants-takeaways to 3)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'taxtoria-wonderboom-south', 'Taxtoria',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '534 Meyer St, Wonderboom South, Pretoria, 0084', '012 335 2269', NULL, NULL,
  'Taxtoria is a professional accounting and tax services firm based on Meyer Street in Wonderboom South, Pretoria. The practice specialises in accounting services, tax preparation and financial planning, and is positioned as a provider of comprehensive financial and administrative support for its clients. It operates from a private, professional environment geared toward accurate, personalised assistance rather than a high-volume walk-in setup.

Appointments are essential, and clients are encouraged to contact the firm directly to confirm fees, availability or specific requirements before a visit. Taxtoria operates Monday to Friday during standard business hours and is closed over weekends and public holidays, serving individuals and small businesses in the Wonderboom South area of Pretoria that need ongoing accounting and tax support.',
  'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
  '["https://www.findmy.co.za/services/business/taxtoria/29755", "https://www.africabizinfo.com/ZA/taxtoria-012-335-2269", "https://www.thinklocal.co.za/biz/taxtoria-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'taxtoria-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'voncal-auto-wonderboom-south', 'Voncal Auto',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '520 Fred Nicholson Street, Wonderboom South, Pretoria, 0084', '+27 10 000 6150', 'https://www.voncalauto.co.za', NULL,
  'Voncal Auto is a pre-owned vehicle dealership on Fred Nicholson Street in Wonderboom South, Pretoria. The dealership sells a range of used cars and bakkies and offers vehicle finance, describing its approach as aiming for a transparent and pressure-free car-buying experience. Alongside sales, it also handles trade-ins, offering valuations for customers looking to sell or exchange their current vehicle.

The dealership has built up a base of positive customer reviews since opening and is active on social media, where it regularly lists its current stock of used vehicles. Voncal Auto is open Monday to Friday from 08:00 to 17:30 and on Saturdays from 08:00 to 13:00, serving buyers and sellers across Wonderboom South and the wider Pretoria area.',
  'Mon-Fri 08:00-17:30, Sat 08:00-13:00, Sun Closed',
  '["https://voncalauto.co.za", "https://www.autotrader.co.za/dealer/voncal-auto/150783"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'voncal-auto-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'big-or-small-projects-and-engineering-wonderboom-south', 'Big or Small Projects and Engineering',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '665 Louis Trichardt Street, Wonderboom South, Pretoria, 0084', '082 774 0800', 'https://www.bigorsmall.co.za', 'info@bigorsmall.co.za',
  'Big or Small Projects and Engineering is a mechanical engineering and machining business based on Louis Trichardt Street in Wonderboom South, Pretoria. Established in 2008, the company has built a track record in the design and building of machines and testing equipment, along with sample preparation and general engineering work for industrial clients.

The business operates as a machining manufacturer and engineering consultancy, handling projects of varying scale as its name suggests. It keeps standard weekday business hours, operating Monday to Friday from 08:00 to 17:00 and closing over weekends, and serves clients from its Wonderboom South premises in Pretoria.',
  'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
  '["https://www.africabizinfo.com/ZA/big-or-small-projects-and-engineering-082-774-0800", "https://www.cybo.com/ZA-biz/big-or-small-projects-and-engineering", "https://bizbay.co.za/Company/Big-or-Small-Projects-and-Engineering"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-or-small-projects-and-engineering-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'fmis-marketing-wonderboom-south', 'FMIS Marketing',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '963 11th Ave, Wonderboom South, Pretoria, 0084', '+27 63 403 1691', NULL, NULL,
  'FMIS Marketing is a marketing and advertising agency on 11th Avenue in Wonderboom South, Pretoria. The agency offers a range of marketing services aimed at helping local businesses grow, including digital campaigns, branding and content development, with a focus on measurable, results-driven outcomes for its clients.

Clients can book consultations through online appointments, which the agency positions as a convenient way to plan campaigns and strategy sessions in a professional, client-focused setting. FMIS Marketing operates from its Wonderboom South premises and serves small and medium businesses across Pretoria that are looking for tailored digital marketing, branding and content support to grow their customer base.',
  '["https://pretoria.co.za/place/fmis-marketing", "https://yellowpages-af.cybo.com/ZA-biz/fmis-marketing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fmis-marketing-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'printaholic-wonderboom-south', 'Printaholic',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '9th Ave, Wonderboom South, Pretoria, 0084', '+27 84 433 0121', NULL, NULL,
  'Printaholic is a print shop on 9th Avenue in Wonderboom South, Pretoria, offering small-format printing for local businesses and individuals. Its services include business cards, flyers and posters, with an emphasis on quick turnaround for customers who need printed materials on short notice for an event or deadline.

The shop is set up for round-the-clock access, operating 24 hours a day to accommodate urgent print jobs and busy schedules, and offers on-site wheelchair-accessible parking for customers visiting in person. Printaholic serves the Wonderboom South area of Pretoria and positions itself as a reliable, on-demand option for everyday printing needs at short notice.',
  'Open 24 hours',
  '["https://pretoria.co.za/place/printaholic", "https://spurmtbleague.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'printaholic-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'qb-creations-wonderboom-south', 'QB Creations',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '979 5th Ave, Wonderboom South, Pretoria, 0084', '+27 82 933 8940', 'https://www.qbcreations.co.za', NULL,
  'QB Creations (Pty) Ltd is a print shop on 5th Avenue in Wonderboom South, Pretoria, offering a full range of printing services for businesses and individuals. Its offering spans business cards, banners and personalised stationery, with an emphasis on quality finishing and quick turnaround times for everyday and promotional printing needs.

The shop has built a strong local reputation, with a high average customer rating from its reviews, and offers wheelchair-accessible parking and entrance for customers visiting the premises in person. QB Creations serves the Wonderboom South community in Pretoria, supporting both branding projects and one-off personalised print orders for local households and businesses alike.',
  '["https://pretoria.co.za/place/qb-creations-pty-ltd", "https://local.infobel.co.za/ZA101366492/qb_creations-wonderboom_south.html", "https://www.cybo.com/ZA-biz/qb-creations-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'qb-creations-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'print-ad-wonderboom-south', 'Print Ad',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '961 15th Avenue, Wonderboom South, Pretoria, 0084', '012 331 1919', 'https://www.printad.co.za', 'info@printad.co.za',
  'Print Ad is a printing and signage business on 15th Avenue in Wonderboom South, Pretoria. Founded in 1990 by a small team working out of a garage, the business has grown into a fully-fledged signage operation with a qualified staff holding a combined 30 years of experience in the industry, and it holds a level 3 BEE status.

The business covers most facets of signage and printing work, including CNC and laser cutting, vehicle branding, vinyl printing and cutting, shop interior design and fit-out, expo branding and stand construction, and wallpaper installation, with in-house manufacturing and nationwide installation capability. Print Ad operates from its Wonderboom South premises in Pretoria, serving retail, commercial and exhibition clients.',
  '["https://www.printad.co.za", "https://firmania.co.za/pretoria/print-ad-signs-207401", "https://www.cylex.net.za/company/print-ad-signs-23854974.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'print-ad-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, source_urls, status, origin)
VALUES (
  'hoshii-wonderboom-south-wonderboom-south', 'Hoshii Wonderboom South',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  'Shop 6, Wonderboom Plaza, De Beer St, Wonderboom South, Pretoria, 0084', '+27 71 285 0428', NULL, NULL,
  'Hoshii Wonderboom South is an Asian restaurant and sushi bar in Shop 6 of Wonderboom Plaza on De Beer Street, Wonderboom South, Pretoria. The menu covers sushi, chow faan and other Asian dishes, with the Hot & Sour soup, deep-fried sushi and cheese-and-vegetable spring rolls among the dishes most mentioned by customers. Vegetarian options are also available.

The restaurant offers sit-down dining as well as an outdoor seating area, and is wheelchair accessible. It also supports takeaway and delivery, including through third-party delivery services, for customers who prefer to eat at home. Hoshii is open daily from 11:00 to 21:00 and has built a strong local reputation, ranking among the more highly-rated restaurants in Pretoria on review platforms.',
  'Mon-Sun 11:00-21:00',
  '["https://restaurantguru.com/Hoshii-Wonderboom-South-Pretoria", "https://za.africabz.com/gauteng/hoshii-wonderboom-south-106663", "https://rsa.worldorgs.com/catalog/pretoria/asian-restaurant/hoshii-wonderboom-south"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hoshii-wonderboom-south-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'pregoman-takeaway-wonderboom-south', 'PregoMan Takeaway',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '475 Naude St, Wonderboom South, Pretoria, 0084', '+27 67 402 8506', NULL, NULL,
  'PregoMan Takeaway is a casual takeaway restaurant on Naude Street in Wonderboom South, Pretoria. The menu centres on fries alongside a broader range of snacks and full meals, served in a family-friendly setting aimed at quick, flavourful orders rather than formal sit-down dining for customers on the go.

The takeaway accepts card and NFC mobile payments and offers wheelchair-accessible parking and entrance for customers collecting orders in person. PregoMan has built a solid local following, maintaining a strong average rating from reviewers, and serves the Wonderboom South area of Pretoria with speedy, no-fuss takeout for busy households and passing trade alike.',
  '["https://pretoria.co.za/place/pregoman-takeaway", "https://za.africabz.com/gauteng/pregoman-takeaway-576310", "https://www.cybo.com/ZA-biz/pregoman-takeaway"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pregoman-takeaway-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
VALUES (
  'ls-wonderboom-suid-wonderboom-south', 'LS Wonderboom-Suid',
  (SELECT id FROM suburbs WHERE slug = 'wonderboom-south'),
  '12th Ave, 785 Hertzog Street, Wonderboom South, Pretoria, 0084', '012 942 8705', NULL, 'skool@lswbs.net',
  'LS Wonderboom-Suid (also known as Wonderboom-Suid Skool, part of the LSEN Akademie) is a primary school on 12th Avenue in Wonderboom South, Pretoria, dedicated to learners with special educational needs. The school caters to learners with mild to severe intellectual disabilities and autism spectrum disorder, offering a curriculum adapted to a wide range of developmental needs.

Lessons are delivered by a dedicated teaching team within a broad extracurricular programme, in a safe and nurturing environment designed around inclusive education. The school operates Monday to Friday and has enrolment information available for prospective families, serving the Wonderboom South community in Pretoria.',
  '["https://www.facebook.com/ls.wonderboom.suid/", "https://pretoria.co.za/place/ls-wonderboom-suid-lsen-akademie"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ls-wonderboom-suid-wonderboom-south'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
