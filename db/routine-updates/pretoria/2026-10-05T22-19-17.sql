-- Thin-page fill, Pretoria batch 2, checkpoint 3: Laudium + Heritage Hill Estate
-- Note: a 2nd printing-services/laudium candidate (PostNet Laudium) was found but
-- already exists in the snapshot as slug postnet-laudium-laudium, filed under
-- logistics-courier-transport rather than printing-services -- not re-inserted
-- (discovery may only INSERT brand-new businesses, not re-categorise an existing
-- one), so that combo stays 1 short rather than closed.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'munaf-s-hardware-laudium', 'Munaf''s Hardware',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '221 2nd Avenue, Laudium, Pretoria, 0037', '012 374 6303', NULL, 'munafshardware@gmail.com',
  'Munaf''s Hardware is a hardware shop on 2nd Avenue in Laudium, Pretoria, stocking a general range of building and home-improvement supplies. Its offering spans plumbing fittings and sanitary ware, paint, timber, sand, and cement alongside general hardware and DIY items, serving both tradespeople and homeowners working on repairs or small building projects.

The shop offers in-store shopping and collection as well as delivery for larger or bulkier orders such as sand, cement, and timber. It trades from Monday to Friday and on Saturday mornings, giving local residents and contractors in Laudium a nearby source for everyday hardware and plumbing supplies without needing to travel to a larger hardware chain outside the suburb.',
  'Mon-Fri 08:00-17:00, Sat 08:00-14:00',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/munafs-hardware-622975", "https://www.findglocal.com/ZA/Laudium/109088241766789/Munaf%27s-Hardware", "https://www.facebook.com/munafshardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'munaf-s-hardware-laudium'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'the-print-and-computer-shop-laudium', 'The Print & Computer Shop',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '281 Tangerine St, Laudium, Centurion, 0037', '074 942 4307', NULL, NULL,
  'The Print & Computer Shop operates on Tangerine Street in Laudium, Centurion, offering printing and computer-related services alongside a broad stationery selection for local residents and small businesses. Alongside standard printing and copying, the shop provides basic computer assistance, giving customers a single nearby stop for everyday printing, stationery, and simple computer-related needs rather than having to visit separate specialist outlets.

The shop keeps long daily trading hours, opening every day from morning until evening, which makes it a convenient option for last-minute printing jobs or stationery purchases outside typical office hours. Its straightforward, customer-focused approach and easy in-store browsing suit shoppers looking for quick service without an appointment, positioning it as a practical, everyday resource for the Laudium community.',
  'Mon-Sun 09:00-21:00',
  NULL, NULL,
  '["https://pretoria.co.za/place/the-print-amp-computer-shop", "https://magicpin.com/south-africa/Laudium/Laudium/Other/The-Print-and-Copy-Shop/store/28b2315"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-print-and-computer-shop-laudium'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'triple-threat-security-solutions-laudium', 'Triple Threat Security Solutions',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '610 Bengal St, Laudium, Pretoria', '078 273 2350', NULL, NULL,
  'Triple Threat Security Solutions is a security services company based on Bengal Street in Laudium, Pretoria, offering installation, repair and maintenance of home and business security equipment. Its services cover CCTV systems using both analogue and IP cameras, alarm systems, electric fencing, access control, and intercoms, along with the supply and automation of gates and garage doors.

The company works on both residential and industrial properties and provides a guarantee on completed jobs, positioning it as a general security-equipment contractor rather than a guarding or patrol service. It trades daily, giving homeowners and businesses in Laudium a nearby option for new security installations as well as repairs and maintenance on existing alarm, camera, and access-control systems.',
  'Mon-Sun 06:00-18:00',
  NULL, NULL,
  '["https://fire-and-security.co.za/companies/triple-threat-security-solutions/", "https://destinali.com/pretoria/security-services/triple-threat-security-solutions-pretoria", "https://www.procompare.co.za/providers/mcdnldmatope"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'triple-threat-security-solutions-laudium'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'cell-fix-and-computer-repairs-laudium', 'Cell Fix & Computer Repairs',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '283 Tangerine St, Laudium, Centurion, 0037', '012 374 2900', 'http://cell-fix-computer-repairs.business.site/', NULL,
  'Cell Fix & Computer Repairs operates from Tangerine Street in Laudium, Centurion, offering repair services for phones, tablets, and computers alongside a range of cell phone accessories. The shop handles everyday device problems such as screen and component repairs, giving local residents a nearby option for fixing devices without having to send them away for extended periods.

The business keeps unusually long trading hours, opening every day of the week from mid-morning until late evening, which makes it convenient for customers who need a device repaired or an accessory outside standard business hours. Its combination of repair services and accessory sales makes it a practical, everyday technology stop for the Laudium community.',
  'Mon-Sun 10:30-23:00',
  NULL, NULL,
  '["https://rsa.worldorgs.com/catalog/centurion/repair-service/cell-fix-computer-repairs", "https://www.findmy.co.za/services/business/cell-fix-and-computer-repairs/2558"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cell-fix-and-computer-repairs-laudium'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'k4-computers-laudium', 'K4 Computers',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '370 2nd Avenue, Laudium, Pretoria, 0037', '012 374 4666', 'https://k4computers.co.za', 'aadil.adam@k4.co.za',
  'K4 Computers is a computer retailer and repair business based on 2nd Avenue in Laudium, Pretoria. It sells computer components, peripherals, and complete systems, and offers repairs, upgrades, and CCTV installation alongside networking and web-solutions services such as hosting and website design for small businesses.

The business has been operating for more than two decades, building a reputation for hardware and software troubleshooting as well as straightforward repair work such as screen and component replacements. Customers can shop in-store, collect orders, or arrange delivery, and the shop supports both individual computer users and businesses needing networking or web-hosting support in the Laudium area.',
  NULL,
  NULL, NULL,
  '["https://www.facebook.com/k4itsolutions/", "https://www.findglocal.com/ZA/Laudium/601344203289973/K4-Computers", "https://k4computers.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'k4-computers-laudium'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'harvey-world-travel-laudium-laudium', 'Harvey World Travel Laudium',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '190 Bengal St, Laudium, Centurion, 0037', '012 374 1042', 'https://www.harveyworld.co.za', 'adminoffice@harveyworld.co.za',
  'Harvey World Travel Laudium is a retail travel agency operating from Bengal Street in Laudium, Centurion. It forms part of the wider Harvey World Travel network, one of the longer-established retail travel franchises in Southern Africa, and offers consultations covering flights, holiday packages, car rental, travel insurance, and cruise or coach bookings.

Being owner-managed, as with other agencies in the franchise, the branch handles both leisure and short-trip travel arrangements, from an overseas holiday to a short bus or rail journey. It trades on weekdays and Saturday mornings, giving Laudium residents a local point of contact for planning and booking travel rather than having to deal with an agency further from the suburb.',
  'Mon-Fri 09:00-17:00, Sat 09:00-12:00, Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/harvey-world-travel-laudium-012-374-1042", "https://firmania.co.za/pretoria/harvey-world-travel-laudium-9396", "https://www.harveyworld.co.za/hwt-agent/laudium/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harvey-world-travel-laudium-laudium'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'rajalaxmi-travel-and-tours-laudium', 'Rajalaxmi Travel & Tours',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  'Suite 22, Jhina Centre, 189 6th Avenue, Laudium, Pretoria, 0037', '012 374 2645', 'https://www.rajalaxmi.co.za', 'laxmi@rajalaxmi.co.za',
  'Rajalaxmi Travel & Tours is a travel agency operating from Suite 22 in the Jhina Centre on 6th Avenue in Laudium, Pretoria. The agency arranges flight bookings and other travel services for clients, and publishes seasonal specials and brochures covering its available packages and fares.

Operating from a shared retail centre alongside other local businesses, the agency gives Laudium residents a nearby option for booking flights and planning trips without needing to use an online-only booking service or travel further from the suburb. It has maintained a presence in the centre for a number of years, offering a point of personal contact for travel arrangements in the area.',
  NULL,
  NULL, NULL,
  '["https://www.rajalaxmi.co.za/contact.html", "https://www.africabizinfo.com/ZA/rajalaxmi-travel-tours-012-374-2644"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rajalaxmi-travel-and-tours-laudium'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'spar-kismet-laudium', 'SPAR Kismet',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '264 18th Avenue, Laudium, Pretoria', '012 374 3307', NULL, 'kismet_stores@yahoo.com',
  'SPAR Kismet is a supermarket on 18th Avenue in Laudium, Pretoria, trading under the SPAR banner while focusing on a range suited to the local community. Alongside general groceries and household products, the store stocks a wide selection of Indian spices, rice varieties, and toiletries, and has been trading in Laudium for around 40 years.

The supermarket takes orders over WhatsApp and offers a delivery service, and regularly runs promotional specials on groceries, frozen foods, and household essentials. Its long-standing presence and focus on items used in Indian cooking make it an established, specialised grocery option for Laudium shoppers alongside the suburb''s other general supermarkets.',
  NULL,
  NULL, NULL,
  '["https://www.facebook.com/kismetstores/", "https://www.findglocal.com/ZA/Pretoria/477206462366642/SPAR-Kismet"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-kismet-laudium'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'jergens-beds-factory-laudium', 'Jergens Beds Factory',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  'Unit 1, A&E Building, 370 2nd Avenue, Laudium, Pretoria, 0037', '012 374 5183', NULL, NULL,
  'Jergens Beds Factory manufactures beds, mattresses, and bedding accessories from its premises on 2nd Avenue in Laudium, Pretoria. The factory produces custom-made headboards, mattresses, and bed bases to order, along with pillows, catering to customers who want bedding made to a specific size or design rather than off-the-shelf furniture.

Operating from Unit 1 of the A&E Building, the business trades on weekdays and Saturday mornings, giving customers in Laudium and the surrounding area a local source for made-to-order bedroom furniture. Its focus on manufacturing rather than retail distribution allows it to offer custom sizing and finishes that are not typically available from standard furniture retailers.',
  'Mon-Fri 08:00-17:00, Sat 08:00-13:00',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Pretoria/129370443884685/Jergens-Beds-Factory", "https://pretoria.infoisinfo.co.za/card/jergens-beds/402441"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jergens-beds-factory-laudium'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ibmc-pm-laudium', 'IBMC PM',
  (SELECT id FROM suburbs WHERE slug = 'laudium'),
  '393 Himalaya Street, Laudium, Pretoria, 0037', '083 229 6459', 'https://ibmc.co.za', 'arshad@ibmcpm.co.za',
  'IBMC PM, trading as Ismail Business Management Consultants, is a consulting agency based on Himalaya Street in Laudium, Pretoria. The firm positions itself as a provider of business management support, aiming to make the administrative side of running a business more straightforward for its clients.

Its service lines include tax administration and financial administration, reflected in staff roles the firm has advertised for its tax admin and financial admin functions. The agency trades on weekdays from its Laudium office, giving local small businesses a nearby option for outsourced business-management, tax, and financial administration support rather than having to manage these functions entirely in-house.',
  'Mon-Fri 08:00-17:00',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Laudium/381629865502843/IBMC-PM", "https://www.facebook.com/IBMCSA/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ibmc-pm-laudium'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'lavish-hair-artistry-heritage-hill-estate', 'Lavish Hair Artistry',
  (SELECT id FROM suburbs WHERE slug = 'heritage-hill-estate'),
  'The Courtyard, Suite 8, Heritage Hill Estate, Centurion', '076 237 0374', NULL, NULL,
  'Lavish Hair Artistry is a hair salon operating from Suite 8 in The Courtyard at Heritage Hill Estate in Centurion. The salon focuses on colour work and hair health, using the Lanza professional haircare range exclusively across its colour and treatment services, positioning itself as a specialist in colour technique rather than a general hairdressing outlet.

The business has expanded its stylist team over the past year, advertising for additional fully qualified hairstylists with their own client base to join on a commission or basic-plus-commission structure. It maintains an active social media presence, sharing styling work and salon updates, and closes over the December holiday period before reopening in the new year. Clients in the Heritage Hill Estate area can book an appointment directly with the salon for colour, styling, and hair treatment services.',
  NULL,
  NULL, NULL,
  '["https://www.beautynailhairsalons.com/ZA/Centurion/460279774522718/Lavish-Hair-Artistry", "https://www.facebook.com/profile.php/?id=100063728103508"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavish-hair-artistry-heritage-hill-estate'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
