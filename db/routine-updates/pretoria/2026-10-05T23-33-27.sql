-- thin-pages pretoria batch 11, checkpoint 1: Centurion + Willow Glen
-- (group4 of parallel verification: butcheries (partial), car-dealerships,
-- computer-it-services (partial), fashion-clothing, jewellers,
-- supermarkets-groceries, dentists (partial), business-consulting/willow-glen (partial))

-- Butcheries, Centurion (partial: 1/2 -- the other crawled lead, Wierda Park Butchery,
-- is a phone-number duplicate of an existing published business "wierda-park-butchery-
-- wierdapark" under a different suburb; excluded per the duplicate rule, not republished)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'toit-s-slaghuis-centurion', 'Toit''s Slaghuis',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  '1 Logan Ave, Centurion, Pretoria', '012 665 4367', NULL, NULL,
  'Toit''s Slaghuis is an owner-managed butchery trading from 1 Logan Ave in Centurion, Pretoria. The shop specialises in fresh cuts of meat for daily, weekly and monthly household supplies, and is known locally for its droewors and other dried meat products. It also offers spit braai packages for customers who want ready-made options for gatherings at home.

Customers have praised the quality, professionalism and friendliness of the staff, with many describing it as one of the best butcheries in the Centurion area for freshness. The butchery takes pride in every part of its daily operation, from how the meat is prepared to how customers are served. Toit''s Slaghuis is open seven days a week, making it a convenient stop for fresh meat and braai supplies for households across Centurion.',
  'Mon-Fri 07:00-18:00, Sat 07:00-16:00, Sun 08:00-13:00',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/toits-slaghuis-17623", "https://pretoria.infoisinfo.co.za/search/butchers/b/centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'toit-s-slaghuis-centurion'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

-- Car Dealerships, Centurion (closes combo: 2/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'audi-centre-centurion-centurion', 'Audi Centre Centurion',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  '1010 Lenchen Avenue North, Centurion, Gauteng, 0046', '087 771 9900', 'https://www.audicenturion.co.za', 'Autohausinfo@nttgroup.co.za',
  'Audi Centre Centurion is an authorised Audi dealership on Lenchen Avenue North in Centurion, offering a full range of new Audi vehicles alongside a quality selection of used cars. The dealership operates separate sales, service and parts departments, each able to assist customers directly by phone or in person at the Centurion showroom.

As part of the Audi franchise network, the dealership provides the full range of services associated with a new-vehicle dealer, from vehicle sales to after-sales service and genuine parts supply. Audi Centre Centurion serves customers across Centurion and the wider Pretoria area looking to buy, service or source parts for an Audi vehicle, with its sales, service and parts departments each keeping their own weekday and Saturday hours and remaining closed on Sundays.',
  'Mon-Fri 08:00-17:30, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://www.audicenturion.co.za/contact", "https://za.africabz.com/gauteng/audi-centre-centurion-564097"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'audi-centre-centurion-centurion'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'lazarus-ford-centurion-centurion', 'Lazarus Ford Centurion',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  '400 West Ave, Highveld, Centurion', '012 678 0000', 'https://www.laz.co.za/ford', NULL,
  'Lazarus Ford Centurion is an authorised Ford dealership on West Ave in Highveld, Centurion, operating as part of the Lazarus motor group. The dealership is listed under the Ford Dealer category on local business directories and sells both new and used Ford vehicles from its Highveld showroom.

Customers can contact the dealership''s general customer care line for enquiries about sales, service or parts, and the business describes itself as welcoming all feedback on customer experience. Lazarus Ford Centurion operates Monday to Friday mornings through to late afternoon and on Saturday mornings, serving customers across Centurion and the wider Pretoria area looking to buy or service a new or used Ford vehicle.',
  'Mon-Fri 07:30-17:00, Sat 08:00-13:00',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/lazarus-ford-centurion-414208", "https://www.laz.co.za/ford/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lazarus-ford-centurion-centurion'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

-- Computer & IT Services, Centurion (partial: 1/2 -- Incus Data excluded, reads as a
-- software/IT training institute with no sourced IT support/repair/consulting activity,
-- not a genuine fit for this category; publishing only I T Wise)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'i-t-wise-centurion', 'I T Wise',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  '86 Oak Ave, Highveld Technopark, Centurion, 0169', '012 665 2204', 'https://www.itwise.co.za', 'sales@itwise.co.za',
  'I T Wise is a computer and IT services provider based at 86 Oak Ave in Highveld Technopark, Centurion. The business was established in 1998, giving it close to three decades of operation in the Centurion area by the time of this listing.

I T Wise can be reached by phone, fax or email for IT-related enquiries, and publishes a dedicated sales email address alongside its company website for customers wanting to discuss computer and IT service requirements before calling or visiting. Situated within the Highveld Technopark business park, the company is positioned to serve other businesses and offices in the immediate Highveld area as well as households and firms across the wider Centurion region needing computer and IT support.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/i-t-wise-012-665-2204", "https://pretoria.infoisinfo.co.za/search/computer-services/b/centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'i-t-wise-centurion'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

-- Fashion & Clothing, Centurion (closes combo: 1/1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'jam-clothing-south-lake-mall-centurion', 'JAM Clothing - South Lake Mall',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  'Shop LG02A, South Lake Centre, Lenchen Ave, Centurion', '012 884 0161', 'https://www.jamclothing.co.za', NULL,
  'JAM Clothing - South Lake Mall is a clothing store at Shop LG02A in South Lake Centre on Lenchen Ave in Centurion, in the Hennopspark area. The store sells clothing, children''s wear and fashion accessories, and is listed in local directories under the Clothing Store, Children''s Clothing Store and Fashion Accessories Store categories.

Customer reviews describe JAM Clothing as a budget-friendly option for bargain hunters, offering clothing for men, women and children at lower prices than many other retailers, with some reviewers noting that part of the range includes overstock or returned items from other stores sold at reduced prices. JAM Clothing - South Lake Mall is open seven days a week, serving shoppers across Centurion looking for affordable family clothing and accessories.',
  'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 09:00-14:00',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/jam-clothing-15912", "https://pretoria.infoisinfo.co.za/search/clothing/b/centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jam-clothing-south-lake-mall-centurion'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

-- Jewellers, Centurion (closes combo: 2/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'van-der-bank-jewellers-centurion', 'Van Der Bank Jewellers',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  '103A, 1st Floor, Lougardia Building, Centurion, 0157', '012 663 4304', NULL, NULL,
  'Van Der Bank Jewellers is a jewellery manufacturer on the first floor of the Lougardia Building in Centurion, specialising in custom-made diamond engagement rings designed to each customer''s specification and budget. The family business has traded for 44 years, having started out in the Vaal Triangle town of Vanderbijlpark before relocating to Centurion.

Over its history, the business has received recognition including an honourable mention at the PlatAfrica 2006 competition, and a platinum piece it created was featured on the cover of Top Billing magazine in December 2006. Van Der Bank Jewellers specialises in platinum and diamond pieces and serves customers across Centurion seeking custom-designed jewellery.',
  'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/gp/centurion/jewellery/van-der-bank-jewellers_618567+0.html", "https://pretoria.infoisinfo.co.za/search/jewellers/b/centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'van-der-bank-jewellers-centurion'),
  (SELECT id FROM categories WHERE slug = 'jewellers'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'jeane-manufacturing-jewellers-centurion', 'Jeane Manufacturing Jewellers',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  'Shop 26, Centurion Lifestyle Centre, Lenchen St / Old Johannesburg Rd, Centurion', '082 781 2381', NULL, NULL,
  'Jeane Manufacturing Jewellers is a jewellery manufacturing and repair business trading from Shop 26 at Centurion Lifestyle Centre, on the corner of Lenchen Street and Old Johannesburg Road in Centurion. The business is listed in local directories under the Jewellers - Manufacturing category and specialises in producing and repairing jewellery pieces.

The workshop manufactures and repairs jewellery made from gold, silver and platinum, covering both custom-made pieces and repair work on existing jewellery. Operating from within Centurion Lifestyle Centre, Jeane Manufacturing Jewellers serves customers across Centurion who need jewellery manufactured to order or repaired by a specialist, whether for an everyday piece or a special-occasion item.',
  NULL,
  NULL, NULL,
  '["https://nearfinderza.com/en/business/gp/centurion/jewellers-manufacturing/jeana-manufacturing-jewellers_245917+0.html", "https://pretoria.infoisinfo.co.za/search/jewellers/b/centurion"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jeane-manufacturing-jewellers-centurion'),
  (SELECT id FROM categories WHERE slug = 'jewellers'),
  1
);

-- Supermarkets & Groceries, Centurion (closes combo: 1/1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'spar-hennops-centurion', 'SPAR Hennops',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  'Cnr Blackwood & Klip St, Hennopspark, Centurion', '012 654 6174', NULL, NULL,
  'SPAR Hennops is a full-service supermarket on the corner of Blackwood and Klip Street in Hennopspark, Centurion, offering groceries, fresh produce and prepared food as part of the independently run SPAR retail group. The store underwent a major revamp at some point, which customers have noted has left it looking fresh and well presented.

Shoppers describe the store as clean, well stocked and not overly busy, with ample parking and friendly service, and point to the prepared food counter''s boerewors rolls as a popular quick-lunch option. SPAR Hennops serves households across Hennopspark and the wider Centurion area for everyday grocery and fresh produce shopping, and is open seven days a week including extended Saturday trading hours.',
  'Mon-Fri 06:00-20:00, Sat 06:00-22:00, Sun 07:00-20:00',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/spar-hennops-329087", "https://pretoria.infoisinfo.co.za/search/supermarket/b/centurion", "https://www.africabizinfo.com/ZA/spar-hennopsview-centre-012-654-6177"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-hennops-centurion'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

-- Dentists, Centurion (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'smile-care-dental-studio-centurion', 'Smile Care Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'centurion'),
  'Shop 342B, Centurion Mall, 1 Embankment Road, Centurion, 0046', '012 663 8899', 'https://www.smilecare.co.za', NULL,
  'Smile Care Dental Studio is a dental practice at Shop 342B in Centurion Mall, on Embankment Road in Centurion, operating since 2004. The practice focuses on dental make-overs and rehabilitations, and also offers Botox and dermal fillers to complement its dental treatments, with further details on its range of services published on its own website.

Patients can book cosmetic or restorative dental work at the practice''s Centurion Mall premises, and the practice also renders an emergency call-out service until 22:00 for patients needing urgent attention outside normal hours. Smile Care Dental Studio serves patients across Centurion looking for both routine and cosmetic dental treatment within easy reach of the mall.',
  'Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://www.fyple.co.za/company/smile-care-dental-studio-11guztl/", "https://pretoria.infoisinfo.co.za/card/smilecare-dental-studio/345717"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smile-care-dental-studio-centurion'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

-- Business & Management Consulting, Willow Glen (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ndarama-management-consultants-willow-glen', 'Ndarama Management Consultants',
  (SELECT id FROM suburbs WHERE slug = 'willow-glen'),
  '22 Overberg, Equestria, Willow Glen, Pretoria, 0041', '012 442 5021', 'https://ndaramaconsultants.co.za', 'info@ndaramaconsultants.co.za',
  'Ndarama Management Consultants is a business management consulting firm based at 22 Overberg in Willow Glen, Pretoria. The firm was founded on 14 January 2011 and is classified under the professional services industry, with its stated line of business recorded as business management consulting.

Clients can reach Ndarama Management Consultants by phone or email during normal weekday office hours from its Willow Glen office, which keeps regular business hours from Monday to Friday. Having operated for around sixteen years since its founding, the firm continues to provide business management consulting services to clients in the Willow Glen area and wider Pretoria.',
  'Mon-Fri 09:00-17:00',
  NULL, NULL,
  '["https://ndaramaconsultants.co.za/contacts.html", "https://www.africabizinfo.com/ZA/ndarama-management-consultants-012-442-5021"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ndarama-management-consultants-willow-glen'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);
