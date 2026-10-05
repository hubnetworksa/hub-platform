-- Thin-page fill, Pretoria batch 2, checkpoint 4: Hennopspark + Waterkloof Glen
-- Two verified-looking candidates were excluded as duplicates of existing
-- businesses rather than published: "Monitor Net" (security-services/hennopspark)
-- shares its 0861 toll-free number with the existing monitor-net-security-company
-- listing (Blue Valley Golf Estate) -- a shared national line, not pinned to this
-- branch. "Caltex Waterkloof Glen" (fuel-stations/waterkloof-glen) shares its phone
-- number exactly with the existing astron-energy-waterkloof-glen listing -- almost
-- certainly the same physical station under its pre-rebrand Caltex name (Astron
-- Energy acquired Chevron/Caltex's SA stations). Neither combo is closed by this
-- checkpoint as a result.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'fin5-incorporated-hennopspark', 'Fin5 Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '2nd Floor, Auto Investments Building, The Gables Centre, c/o Hendrik Verwoerd and Gallway Ave, Hennopspark, Centurion', '079 065 7276', 'https://www.finfive.com', NULL,
  'Fin5 Incorporated is a firm of chartered accountants, auditors, business consultants and tax specialists operating from the Gables Centre in Hennopspark, Centurion. The practice provides accounting, auditing and taxation services, financial consulting, treasury support, forensic services and financial planning to a client base that spans listed multinational companies as well as local small and medium enterprises. It positions itself as a Level Two B-BBEE contributor with majority Black ownership, and promotes an open, team-based approach intended to maximise interaction with clients throughout an engagement.

Based in Hennopspark, the firm structures its service approach around integrated, cohesive teams for each client engagement, with a focus on the specific needs, risks and stakeholders of every business it works with. Methods are designed to improve efficiency and help contain costs, with specific planning and project management applied to address particular circumstances and risks. The practice is open on weekdays and closed over weekends, and supports clients ranging from resource and mining companies to government entities needing accounting, audit and tax expertise.',
  'Mon-Fri 07:00-18:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://pretoria.co.za/place/fin5-incorporated", "https://www.africabizinfo.com/ZA/fin-incorporated-079-065-7276", "https://www.finfive.com/contact.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fin5-incorporated-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ldr-accounting-and-tax-solutions-hennopspark', 'LDR Accounting & Tax Solutions',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'Unit 1C, 17 Hilda Avenue, Hennopspark, Centurion, 0157', '082 574 1714', 'https://www.ldraccounting-tax.co.za', 'info@ldraccounting-tax.co.za',
  'LDR Accounting & Tax Solutions is an accounting, tax and advisory practice operating from Hilda Avenue in Hennopspark, Centurion. The firm processes financial data such as invoices, bank statements and petty cash records onto accounting systems, compiles financial statements for companies, close corporations, sole proprietors and partnerships, and handles the submission of financial statements to SARS and CIPC. It also assists with audit preparation, runs payroll processing with monthly payslips and annual IRP5 certificates, and manages EMP201 submissions and IRP5 reconciliations.

Beyond compliance work, the practice offers income tax services for companies and individuals, including provisional tax calculations, tax return submissions, dispute resolution and VAT assistance. For business clients it prepares management accounts, budgets, cash flow analysis and key performance indicators, alongside internal control reviews aimed at supporting tax planning and risk management. Operating from its Centurion office, the firm positions itself as using current technology to keep clients compliant with applicable financial regulations while offering services tailored to each client''s needs.',
  NULL,
  NULL, NULL,
  '["https://www.ldraccounting-tax.co.za/contact.html", "https://www.goafricaonline.com/za/1211133-ldr-accounting-tax-solutions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ldr-accounting-and-tax-solutions-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'wash-and-go-cleaning-service-centurion-hennopspark', 'Wash and Go Cleaning Service Centurion',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '10 Hilda Ave, Hennopspark, Centurion', '084 289 5201', 'https://www.washngo-cleaningservicesjhb.co.za/wash-and-go-cleaning-centurion/', NULL,
  'Wash and Go Cleaning Service Centurion operates from Hilda Avenue in Hennopspark, offering a range of cleaning services for homes, offices, factories and commercial premises across the greater Centurion area. The business provides contract maid rental and housekeeping placements, supplying the same screened and security-checked personnel on a recurring basis so that one person returns to a client''s premises each time rather than rotating staff. Placements begin with a site assessment to agree on days, hours and duties, followed by a trial period before an ongoing contract is confirmed.

Alongside staff placement, the business offers carpet cleaning with stain removal and sanitisation, window cleaning, home and office cleaning, deep cleaning for move-ins and move-outs, gutter cleaning, and car washing and detailing. From its Hennopspark base it serves Centurion CBD and surrounding areas including Midrand, Irene, Highveld, Monavoni, Eldoraigne, Lyttelton, Clubview, Rooihuiskraal, Wierdapark, Erasmia and the Centurion Golf Estate, positioning itself as a single point of contact for recurring commercial and residential cleaning contracts in the area.',
  NULL,
  NULL, NULL,
  '["https://www.thebusinessdirectory.co.za/listings/wash-and-go-cleaning-service-centurion/", "https://firmania.co.za/centurion/wash-and-go-cleaning-service-centurion-190311", "https://www.washngo-cleaningservicesjhb.co.za/wash-and-go-cleaning-centurion/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wash-and-go-cleaning-service-centurion-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'hybrid-electrical-and-plumbing-hennopspark', 'Hybrid Electrical and Plumbing',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'Unit 11, Edison Square Office Park, 137 Edison Cres, Hennopspark, Centurion, 0172', '012 653 1494', 'https://www.hybridelec.co.za', NULL,
  'Hybrid Electrical and Plumbing is an electrical and plumbing contracting business operating from Edison Square Office Park in Hennopspark, Centurion. Established in 1992, the company has grown into an operation with around 80 permanent staff, ranging from semi-skilled workers to qualified electricians, and specialises in the electrification and reticulation of new developments, including houses, residential complexes, conference centres and commercial factories. Its plumbing division installs plumbing and reticulation systems for new developments such as townhouse complexes and blocks of flats.

The company has worked on projects spanning residential estate phases, school and university developments, and commercial refurbishments, reflecting a focus on new-build electrical and plumbing installation rather than residential call-outs alone. Operating from its Hennopspark offices for more than three decades, the business emphasises professional, cost-effective delivery, meticulous planning and on-time completion as an electrical and plumbing contractor serving the construction industry across the Centurion area.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/hybrid-electrical-and-plumbing-012-653-1494", "https://firmania.co.za/centurion/hybrid-electrical-and-plumbing-116362", "https://www.hybridelec.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hybrid-electrical-and-plumbing-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'electricians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'bossie-s-gym-and-personal-training-studio-hennopspark', 'Bossie''s Gym and Personal Training Studio',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '1st Floor, 207 Edison Crescent, Hennopspark, Centurion, 0157', '072 482 7922', 'https://bossiesgym.co.za', 'bossiesgym@gmail.com',
  'Bossie''s Gym and Personal Training Studio is a family-run gym operating from Edison Crescent in Hennopspark, Centurion. The gym offers one-on-one personal training with eight dedicated coaches, pairing each session with a personalised diet plan and regular body assessments to track progress. Alongside personal training, it provides open-gym access on a commercial training floor equipped with weights, cardio machines, a functional training area and a boxing area, available on month-to-month, six-month or twelve-month contracts, as well as day passes.

Describing itself as a small, independent gym rather than a franchise, the business markets itself around the values of honesty, commitment and community, aiming to keep a personal relationship with members rather than operating at large scale. A free open-gym trial is offered to prospective members before they commit to a membership or personal training package. Based in Hennopspark, the gym serves clients from Centurion, Midstream and surrounding suburbs looking for a smaller, locally run training facility.',
  'Mon-Thu 05:00-20:00, Fri 05:00-19:00, Sat 08:00-11:00, Sun Closed',
  NULL, NULL,
  '["https://bossiesgym.co.za/contact/", "https://www.africabizinfo.com/ZA/bossies-gym-and-personal-training-072-482-7922"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bossie-s-gym-and-personal-training-studio-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'rooidop-furniture-hennopspark', 'Rooidop Furniture',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '47 Venturi Cres, Hennopspark, Centurion, 0172', '012 881 0277', 'http://www.rooidopfurniture.co.za', NULL,
  'Rooidop Furniture is a furniture and homeware shop based on Venturi Crescent in Hennopspark, Centurion. The shop offers a range of furniture including chairs and tables, selling both brand-new and used pieces, along with office furniture and home furniture. Customers can shop in-store or arrange delivery for orders placed off-site, with the business handling packaging as part of its service offering.

Operating from its Hennopspark premises, Rooidop Furniture positions itself as a local, affordable option for furniture shoppers in the greater Centurion area, stocking a general range of seating and tables alongside other household furniture pieces. The shop is closed on Mondays and Sundays, trading on weekdays and Saturday mornings, and offers street parking for customers visiting in person.',
  'Mon Closed, Tue-Fri 09:00-16:00, Sat 09:00-14:00, Sun Closed',
  NULL, NULL,
  '["https://thebranchlocator.com/shop/listing/rooidop-furniture-hennopspark/", "https://pretoria.co.za/place/rooidop-furniture"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rooidop-furniture-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'mb-pine-and-furniture-hennopspark', 'MB Pine & Furniture',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '118 Jakaranda Street, Hennopspark, Centurion, 0172', '012 663 1158', 'https://www.mbpinefurniture.co.za', 'msa@mbpinefurniture.co.za',
  'MB Pine & Furniture is a furniture shop on Jakaranda Street in Hennopspark, Centurion, specialising in locally made pine furniture. The range covers bedroom furniture, dining room sets, storage solutions and custom-made pieces, with units available either raw or finished in a variety of colours and stains to suit a customer''s own home. All pine furniture sold is manufactured in South Africa, and the shop offers delivery with assembly included where necessary.

The business trades across all categories of pine furniture for the home, from bed frames and wardrobes to dining tables and chests of drawers, and will match or beat a competitor''s price on the same product. Operating from its Hennopspark store for a number of years, MB Pine & Furniture is also categorised locally as a bed and mattress retailer, reflecting a range that extends beyond pine furniture alone into bedroom and sleep products for customers across Centurion.',
  'Mon-Fri 09:00-17:00, Sat 09:00-14:00, Sun 10:00-13:00',
  NULL, NULL,
  '["https://www.furniture1000.com/ZA/Centurion/1285226454878932/MB-Pine-%26-Furniture", "https://za.africabz.com/gauteng/mb-pine-furniture-135272", "https://www.mbpinefurniture.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mb-pine-and-furniture-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'halp-media-hennopspark', 'HALP! Media',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  '2 Bell Cres, Hennopspark, Centurion, 0172', '081 304 5655', 'https://halp.co.za', NULL,
  'HALP! Media is a trade marketing and brand execution agency based on Bell Crescent in Hennopspark, Centurion. With a history spanning more than a decade, the agency specialises in trade marketing for fast-moving consumer goods brands, having worked on campaigns for international snack, confectionery and sports drink brands sold in South Africa. Its work spans activations, events, advertising and online marketing, combining traditional business values with current marketing strategies and techniques.

The agency is a Level 2 B-BBEE contributor and describes its approach as built on direct, handshake-style client relationships rather than purely transactional service delivery. Drawing on a team with more than 25 years of collective experience, HALP! Media positions itself as a trade marketing specialist able to help brands build recognition and achieve measurable results in a competitive retail environment, operating from its Hennopspark base to serve clients across the wider Centurion and Pretoria area.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/halp-media", "https://www.findglocal.com/ZA/Centurion/617201801673358/HALP-Media", "https://halp.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'halp-media-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'elite-signs-and-branding-hennopspark', 'Elite Signs & Branding',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'Unit B2, 184 Edison Cres, Hennopspark, Centurion, 0157', '083 498 2872', 'https://www.elitesb.co.za', 'info@elitesb.co.za',
  'Elite Signs & Branding is a signage and branding company operating from Edison Crescent in Hennopspark, Centurion. With a combined 20 years of experience in the sector, the team designs, manufactures and installs a wide range of signage and digital display solutions, working directly with clients to interpret their brand vision and translate it into cost-effective visual and physical signage. Services extend from artwork design and advice on materials through to on-site installation of finished signage.

Operating from its Hennopspark workshop, the business serves commercial clients across the Centurion area needing branded signage for shopfronts, vehicles and premises, drawing on craftsmanship and close collaboration with each client to meet specific brand requirements. The company keeps standard weekday trading hours and is closed over weekends, positioning itself as a dedicated signage and branding specialist rather than a general printing or marketing agency.',
  'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/elite-signs-branding-083-498-2872", "https://www.elitesb.co.za/Contacts/", "https://www.goafricaonline.com/za/1323757-elite-signs-branding"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elite-signs-and-branding-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kill-roach-hennopspark', 'Kill Roach',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'Unit 2, SCW Business Park, 60 Jakaranda St, Hennopspark, Pretoria, 0157', '082 925 6966', 'http://www.killroach.com', NULL,
  'Kill Roach is a pest control business operating from the SCW Business Park on Jakaranda Street in Hennopspark, Pretoria. The company provides exterminator and pest control services for residential and commercial properties, carrying out inspections to identify pest species, the extent of an infestation and entry points before applying a treatment plan suited to the property. Services cover insect and rodent control, including the cockroach treatments the business is named after.

Operating from its Hennopspark premises on weekdays, the business combines chemical treatments, baiting and trapping with sealing and exclusion measures where appropriate, aiming to limit repeat infestations rather than offer a single once-off treatment. It serves both home owners and commercial premises across the Centurion and greater Pretoria area, positioning itself within a local network of pest management providers operating out of Hennopspark''s commercial and industrial parks.',
  'Mon-Fri 08:00-17:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/kill-roach-011-865-5655", "https://fumigators.co.za/contractors/kill-roach/", "https://www.cybo.com/ZA-biz/kill-roach"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kill-roach-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'pest-control'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'gc-solar-retail-store-hennopspark', 'GC Solar Retail Store',
  (SELECT id FROM suburbs WHERE slug = 'hennopspark'),
  'Lenchen Centre, Unit 6, 9 Jakaranda St, Hennopspark, Centurion', '012 653 2664', 'https://gcsolar.co.za', NULL,
  'GC Solar Retail Store is a solar energy retail outlet based at the Lenchen Centre on Jakaranda Street in Hennopspark, Centurion. The store sells solar panels, inverters and batteries for backup power and off-grid systems, along with solar hot water equipment, serving customers looking to set up residential or small commercial solar installations in response to load-shedding and rising electricity costs. Walk-in customers can get advice on choosing and upgrading a solar system, with staff able to explain how to connect panels to an existing backup power setup.

The retail store is a branch of a wider GC Solar operation headquartered in Midrand, with the Hennopspark branch functioning as a dedicated local outlet for the Centurion area rather than an installation-only service. Customers can collect stock directly from the Hennopspark premises, and the store keeps weekday and Saturday morning trading hours to serve both individual homeowners and businesses sourcing solar equipment locally.',
  'Mon-Fri 08:00-16:00, Sat 09:00-13:00, Sun Closed',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/gc-solar-retail-store-359761", "https://www.goafricaonline.com/za/1350450-gc-solar-retail-store", "https://www.brabys.com/za/gauteng/centurion/hennops-park/solar-panels/g-c-solar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gc-solar-retail-store-hennopspark'),
  (SELECT id FROM categories WHERE slug = 'solar-renewable-energy'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'capital-connection-waterkloof-glen', 'Capital Connection',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-glen'),
  '402 Mendelssohn St, Waterglen Shopping Centre, Waterkloof Glen, Pretoria, 0010', '064 176 3074', NULL, NULL,
  'Capital Connection is a cell phone and electronics repair shop located in the Waterglen Shopping Centre on Mendelssohn Street in Waterkloof Glen, Pretoria. The business offers phone repairs along with a range of other electronics services, with same-day turnaround available for many repairs. Customers can drop off devices for in-store repair and collection, or arrange delivery for items that cannot be brought in personally, giving the shop flexibility for both walk-in and off-site customers.

Payment at the shop can be made by card, including contactless NFC payment, alongside standard credit and debit card options. Operating from its Waterkloof Glen premises inside the Waterglen Shopping Centre, Capital Connection positions itself as a convenient, fast-turnaround repair option for residents and businesses in the surrounding Waterkloof Glen and Menlyn area needing phone or electronics repairs without having to travel to a mall-based chain store.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/capital-connection", "https://za.africabz.com/gauteng/capital-connection-554103"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capital-connection-waterkloof-glen'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'ultimus-electronics-waterkloof-glen', 'Ultimus Electronics',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-glen'),
  '152 Dallas Avenue, Waterkloof Glen, Pretoria, 0010', '071 688 1518', NULL, 'ultimus.electronics@gmail.com',
  'Ultimus Electronics is a second-hand and new electronics dealer operating from Dallas Avenue in Waterkloof Glen, Pretoria. The business buys and sells a range of quality new and used electronics, including smartphones, laptops and gaming consoles, giving customers in the area a local option for trading in older devices or buying pre-owned electronics at a lower price than retail.

From its Waterkloof Glen premises, Ultimus Electronics deals directly with the public on both the buying and selling side, handling enquiries by phone or email rather than operating as a walk-in mall store. The business has built a small but loyal customer base in the Waterkloof Glen and wider Pretoria area for its mix of new electronics and carefully checked second-hand devices.',
  NULL,
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/ultimus-electonics-071-688-1518", "https://www.facebook.com/ultimuselec/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ultimus-electronics-waterkloof-glen'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'art-of-print-waterkloof-glen', 'Art of Print',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-glen'),
  'Shop 3, Lighting Warehouse Building, 322 Garsfontein Rd, Waterkloof Glen, Pretoria, 0181', '012 761 3700', 'https://www.artofprint.co.za', 'info@artofprint.co.za',
  'Art of Print is a specialist printing and framing business located on Garsfontein Road in Waterkloof Glen, Pretoria, sharing premises with the Outdoorphoto store in the Lighting Warehouse building. The business focuses on giclee fine art printing, producing high-resolution reproductions on fibre and cotton-based art papers using advanced archival inkjet printing technology, alongside photographic prints on resin-coated paper that aim to replicate the look of traditional chemical prints. Customers can also order canvas prints, stretched on sustainably sourced wooden frames or supplied flat for later framing.

Beyond fine art and photographic printing, the business offers custom picture framing, books and calendars, and reproduction services for photographers, illustrators, galleries and other creatives. Operating from its Waterkloof Glen premises on weekdays and Saturday mornings, Art of Print positions itself as a specialist alternative to general print shops, aimed at customers who need archival-quality fine art and photographic output rather than everyday document printing.',
  'Mon-Thu 08:00-17:30, Fri 08:00-17:00, Sat 08:00-14:00, Sun Closed',
  NULL, NULL,
  '["https://www.artofprint.co.za/contact", "https://pretoria.co.za/place/art-of-print", "https://www.africabizinfo.com/ZA/art-of-print-012-761-3700"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'art-of-print-waterkloof-glen'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
