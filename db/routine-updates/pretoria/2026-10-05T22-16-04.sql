INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mahdiyyah-patel-attorneys-valhalla', 'Mahdiyyah Patel Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '2 Imatra Rd, Valhalla, Pretoria, 0185', '+27845265669', NULL, NULL,
  'Mahdiyyah Patel Attorneys is a legal services firm based in Valhalla, Pretoria, operating from an office on Imatra Road. The practice offers consultations, legal advice, document preparation and representation, assisting individuals, families and small businesses with matters that arise in day-to-day life as well as more complex legal concerns.

From an initial assessment through to follow-up support, the firm works through each stage of a client''s matter, aiming to explain options in plain language and respond promptly to questions. It serves clients based in Valhalla as well as the surrounding Centurion and greater Pretoria area. The office is wheelchair accessible, with an accessible restroom and parking available on site.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/mahdiyyah-patel-attorneys","https://destinali.com/pretoria/legal-services/mahdiyyah-patel-attorneys-pretoria","https://www.facebook.com/OfficialMahdiyyahPatelAttorneys/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mahdiyyah-patel-attorneys-valhalla'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'valhalla-book-exchange-valhalla', 'Valhalla Book Exchange',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '1 Vindhella Road, Valhalla, Pretoria, 0185', '074 096 6322', NULL, NULL,
  'Valhalla Book Exchange is a second-hand bookshop on Vindhella Road in Valhalla, Pretoria. It sells affordable used books, priced from around R5 to R150, and allows customers to bring in books they have already read and exchange them for another title at a reduced price.

The shop carries a large selection of pre-loved books, including titles from authors such as John Grisham, James Patterson, Jonathan Kellerman, Danielle Steel and Patricia Cornwell. It also stocks a wide range of Mills & Boon romance novels, alongside other general fiction. Customers can visit the shop in person or contact it directly to ask whether a specific title is in stock.',
  NULL,
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/1438680579711028/Valhalla-Book-Exchange","https://www.africabizinfo.com/ZA/valhalla-book-exchange_3T","https://www.facebook.com/p/Valhalla-Book-Exchange-100037594075807/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'valhalla-book-exchange-valhalla'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'pro-pc-stationery-and-office-automation-valhalla', 'Pro PC - Stationery and Office Automation',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '14 Imatra Rd, Valhalla, Centurion, 0046', '+27126510045', NULL, NULL,
  'Pro PC - Stationery and Office Automation is a stationery and office supply shop on Imatra Road in Valhalla, Centurion. It stocks everyday office items such as pens and toner cartridges, alongside office furniture and broader office automation products.

Alongside stationery, the shop also provides computer services, combining paper-based office supplies with basic computer support under one roof. Shopping is in-store, and credit cards are accepted for payment. The shop serves households and small businesses in Valhalla and the surrounding Centurion area that need office and stationery essentials, from everyday supplies to toner and furniture, without travelling further into central Pretoria.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/pro-pc-stationery-and-office-automation","https://www.africabizinfo.com/ZA/pro-pc-stationery-and-office-automation-012-651-0045","https://www.infobel.com/en/southafrica/pro_pc_stationery_and_office_automation/valhalla/ZA100369575-0126510045/businessdetails.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pro-pc-stationery-and-office-automation-valhalla'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'el-lucido-cleaning-services-valhalla', 'El Lucido Cleaning Services',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '120 Bruarfoss Rd, Valhalla, Pretoria, 0185', '073 092 8362', NULL, NULL,
  'El Lucido Cleaning Services is a cleaning company based at 120 Bruarfoss Road in Valhalla, Pretoria, 0185. It is listed in local business directories as a cleaning service provider, offering its services to homes and businesses in and around the Valhalla suburb of Centurion.

The business trades through the week, open Monday to Friday from 8am to 5pm and on Saturday mornings from 8am to 1pm. It is listed in more than one Pretoria business directory as a cleaning service based in Valhalla, giving customers in the area a locally based option for routine household or small office cleaning tasks.',
  'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/1948426628768277/El-Lucido-Cleaning-Services","https://za.top10place.com/el-lucido-cleaning-services-491904516.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'el-lucido-cleaning-services-valhalla'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'elsa-support-services-cc-valhalla', 'ELSA Support Services CC',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '5 Mayhew Rd, Valhalla, Pretoria, 0185', '012 660 2464', NULL, NULL,
  'ELSA Support Services CC is an IT services company based at 5 Mayhew Road in Valhalla, Pretoria, 0185. It offers computer services and technical support, working with the kind of day-to-day IT issues that households and small businesses in the area run into.

The company is listed in multiple South African business directories under IT Services and Computer Services and Technical Support categories, each one consistently showing its Mayhew Road, Valhalla address. For customers in Valhalla and the surrounding Centurion area, it provides a locally based alternative to travelling into central Pretoria for computer support and related technical assistance, without needing to deal with a call centre based outside the area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.infoisinfo.co.za/card/elsa-support-services-cc/250722","https://www.africabizinfo.com/ZA/elsa-support-services-cc-012-660-2464","https://sabusinesslistings.co.za/listings/elsa-support-services-cc/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elsa-support-services-cc-valhalla'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ryk-s-electrical-valhalla', 'Ryk''s Electrical',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '71 Viking Rd, Valhalla, Pretoria', '+27 71 698 3086', NULL, NULL,
  'Ryk''s Electrical is an appliance repair business at 71 Viking Road in Valhalla, Pretoria. It repairs household appliances, working on items such as ovens, washing machines and other electrical appliances brought in by customers from Valhalla and the surrounding Centurion area.

The business is open Monday to Friday from 8am to 5pm and on Saturday mornings from 8am to 11am. It carries spare parts for common household appliances, allowing repairs to be carried out on-site rather than ordering parts in and waiting. It appears consistently across several South African business directories under the appliance repair service category, each one listing the same Viking Road address.',
  'Mon-Fri 08:00-17:00, Sat 08:00-11:00, Sun Closed',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/ryks-electrical-97846","https://www.africabizinfo.com/ZA/ryks-electrical-071-698-3086"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ryk-s-electrical-valhalla'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'doolys-cell-phones-and-electronic-valhalla', 'Doolys Cell Phones and Electronic',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '42 Broadway E, Valhalla, Centurion, 0185', '+27829645457', NULL, NULL,
  'Doolys Cell Phones and Electronic is a cell phone and electronics shop at 42 Broadway East in Valhalla, Centurion, 0185. It sells mobile phones, accessories and general electronics, and also offers repair services for phones and other devices brought in by customers.

The shop operates as an in-store outlet, giving customers in Valhalla a nearby option for everyday phone and electronics needs rather than travelling further into Centurion or central Pretoria. It is listed under the mobile shops and cell phone store categories in several South African business directories, each one citing the same Broadway East, Valhalla address and phone number.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/doolys-cell-phones-and-electronic","https://www.africabizinfo.com/ZA/doolys-cell-phones-and-electronic-082-964-5457","https://local.infobel.co.za/ZA101545486/doolys_cell_and_electronics-valhalla.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'doolys-cell-phones-and-electronic-valhalla'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'fashion-express-valhalla', 'Fashion Express',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '23 Broadway E, Valhalla, Pretoria, 0185', '+27126514417', NULL, NULL,
  'Fashion Express is a clothing shop at 23 Broadway East in Valhalla, Pretoria, 0185, selling clothing for both men and women. The shop operates as an in-store outlet, with customers browsing and buying on site rather than ordering online.

It stocks a range of everyday and on-trend clothing aimed at shoppers looking for an affordable wardrobe update without needing to travel out of Valhalla. The shop is listed under clothing and fashion store categories in more than one South African retail directory, each one citing the same Broadway East address and confirming it as a Valhalla-based store rather than a listing for a different branch of a larger chain.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/fashion-express-1","https://www.cybo.com/ZA-biz/fashion-express_86D","https://www.stores24.co.za/business/south-africa/gauteng/pretoria/express/fashion-express-clothing-store-near-you-in-pretoria-6/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fashion-express-valhalla'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-liquorshop-valhalla-valhalla', 'Shoprite LiquorShop Valhalla',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '20 Broadway E, Valhalla, Pretoria, 0185', '+27126739400', NULL, NULL,
  'Shoprite LiquorShop Valhalla is a liquor store at 20 Broadway East in Valhalla, Pretoria, 0185, selling wine, beer and spirits. It operates as an in-store outlet, accepting cash, card, debit card and NFC mobile payments from customers shopping in person at the till.

The branch trades on weekdays from 8am to 7pm and on Sundays from 9am to 2pm. It is one of the Shoprite LiquorShop chain''s branches, listed under this specific Broadway East, Valhalla address across several South African retail directories, distinguishing it clearly from other Shoprite liquor branches found elsewhere across greater Pretoria and the wider Centurion area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/shoprite-liquorshop-valhalla","https://www.africabizinfo.com/ZA/shoprite-liquorshop-valhalla-012-673-9400","https://www.cybo.com/ZA-biz/shoprite-liquorshop-valhalla"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-liquorshop-valhalla-valhalla'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'viva-spares-cc-valhalla', 'Viva Spares CC',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  'Shop 6, 71 Viking Rd, Valhalla, Pretoria, 0185', '+27123270892', NULL, NULL,
  'Viva Spares CC is an auto parts and auto electrical business operating from Shop 6 at 71 Viking Road in Valhalla, Pretoria, 0185. It sells spare parts for vehicles and offers in-store shopping, with items that are not currently in stock available to order in for customers who need them.

Payment can be made by credit card, and the business focuses on parts and repairs needed for everyday vehicle maintenance rather than specialised or performance work. It is listed under auto parts categories in South African business directories, each one confirming the same Viking Road, Valhalla address and phone number for this branch.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/viva-spares-cc","https://za.africabz.com/gauteng/viva-spares-cc-190048","https://local.infobel.co.za/ZA102330927-0123270892/viva_spares-pretoria.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'viva-spares-cc-valhalla'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'detronic-auto-electrical-motor-spares-and-repairs-valhalla', 'Detronic Auto Electrical Motor Spares and Repairs',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '71 Viking Rd, Valhalla, Pretoria, 0185', '+27613146559', NULL, NULL,
  'Detronic Auto Electrical Motor Spares and Repairs is an auto electrical workshop at 71 Viking Road in Valhalla, Pretoria, 0185. It carries out diagnostics, repairs and spares for vehicle electrical systems, covering faults in charging systems, starters, alternators and wiring.

The workshop sells the spares it needs for its own repair work rather than operating purely as a parts counter, and takes on both diagnostic work and hands-on electrical repair jobs for customers. It is listed under auto electrician and motor spares categories in several South African business directories, each one citing the same Viking Road, Valhalla address and phone number.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/detronic-auto-electrical-motor-spares-and-repairs","https://autoelectricians.co.za/providers/detronic-auto-electrical-motor-spares-and-repairs/","https://sabusinesslistings.co.za/listings/detronic-auto-electrical-motor-spares-and-repairs/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'detronic-auto-electrical-motor-spares-and-repairs-valhalla'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'spartan-spares-valhalla', 'Spartan Spares',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '71 Viking Rd, Valhalla, Centurion', '+27 12 660 1475', NULL, NULL,
  'Spartan Spares is a used auto parts store at 71 Viking Road in Valhalla, Centurion. It is categorised as a used auto parts store in South African business directories, which consistently list the same Viking Road address and phone number for the business.

The store trades Monday to Thursday from 8am to 5pm, Friday from 8am to 12pm and again from 2pm to 5pm, and Saturday mornings from 8am to 1pm. It forms part of a small cluster of motor spares businesses operating from the same Viking Road premises in Valhalla, alongside other auto parts and auto electrical outlets in the same stretch of road.',
  NULL,
  NULL, NULL,
  '["https://za.africabz.com/gauteng/spartan-spares-275799","https://rsa.worldorgs.com/catalog/pretoria/used-auto-parts-store/spartan-spares","https://www.autos1000.com/ZA/Centurion/2107997382748897/Spartan-Spares"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spartan-spares-valhalla'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'proton-solar-distributors-valhalla', 'Proton Solar Distributors',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '17 Hugo Rd, Valhalla, Centurion, 0157', '+27125343649', NULL, NULL,
  'Proton Solar Distributors is a solar energy equipment supplier at 17 Hugo Road in Valhalla, Centurion, 0157. It specialises in solar batteries and related equipment for home and business solar installations in the area, rather than selling a broader general electronics range.

The business is listed under the solar energy equipment supplier category in South African directories, each one citing the same Hugo Road, Valhalla address. It gives customers in Valhalla and the surrounding Centurion area a local source for solar batteries and equipment, rather than needing to order from suppliers based elsewhere in greater Pretoria or further away from home.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/proton-solar-distributors","https://za.africabz.com/gauteng/proton-solar-distributors-478252","https://rsa.worldorgs.com/catalog/centurion/solar-energy-equipment-supplier/proton-solar-distributors"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'proton-solar-distributors-valhalla'),
  (SELECT id FROM categories WHERE slug = 'solar-renewable-energy'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'vs-travel-and-tours-valhalla', 'VS Travel and Tours',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '59 Bergen Rd, Valhalla, Pretoria, 0185', '+27718892230', NULL, NULL,
  'VS Travel and Tours is a travel agency at 59 Bergen Road in Valhalla, Pretoria, 0185. It arranges tailored itineraries and guided tours for clients, covering both local trips within South Africa and international travel further afield for those planning a longer holiday.

The agency is listed under the travel agency category in more than one business directory, each one citing the same Bergen Road, Valhalla address and phone number. It gives residents of Valhalla a locally based travel agency to plan trips through, rather than needing to arrange them via an agency based elsewhere in Pretoria or online only.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/vs-travel-and-tours","https://www.goafricaonline.com/za/1341760-vs-travel-and-tours","https://rsa.worldorgs.com/catalog/pretoria/tour-agency/vs-travel-and-tours"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vs-travel-and-tours-valhalla'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ringpharm-osmans-pharmacy-valhalla', 'Ringpharm Osmans Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'valhalla'),
  '24 Hekla Rd, Valhalla, Centurion, 0185', '+27126540456', NULL, NULL,
  'Ringpharm Osmans Pharmacy is a pharmacy at 24 Hekla Road in Valhalla, Centurion, part of the Ringpharm pharmacy group. It dispenses prescription medicine and stocks over-the-counter remedies, along with a range of cosmetics and beauty products for customers who shop in person.

The pharmacy accepts credit cards, debit cards and NFC mobile payments, and trades across Monday to Saturday each week. It is listed under the pharmacy category in several South African health and business directories, each one citing the same Hekla Road, Valhalla address, distinguishing this branch from other Ringpharm and Osmans-named pharmacies found elsewhere across greater Gauteng province.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/ringpharm-osmans-pharmacy","https://za.africabz.com/gauteng/osmans-pharmacy-27492","https://www.facebook.com/OsmansPharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ringpharm-osmans-pharmacy-valhalla'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

