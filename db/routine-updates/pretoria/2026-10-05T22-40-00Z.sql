-- Thin-page fill, Pretoria batch 5, checkpoint 2: Willow Park Manor
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'tnc-consulting-engineers-willow-park-manor', 'TNC Consulting Engineers',
  (SELECT id FROM suburbs WHERE slug = 'willow-park-manor'),
  'Unit C28, 10 Havelock Road, Willow Park Manor, Pretoria, 0184', '082 371 5767', 'https://www.tnce.co.za', NULL,
  'TNC Consulting Engineers is a civil and structural engineering consultancy based in Willow Park Manor, in Pretoria East. The firm offers consulting services for the built environment, covering civil and structural engineering input across the construction process, from early design through to project completion.

Operating from Unit C28 on Havelock Road in Willow Park Manor, the firm positions itself as a partner to its clients throughout a construction project rather than a single-service provider, aiming to build lasting working relationships over repeat projects. The practice has shared project updates on its own website, including completed structural work, and is listed under the contractors and engineering categories in independent Pretoria business directories, which record the same Willow Park Manor address and contact details as the firm''s own site.',
  NULL, NULL, NULL,
  '["https://www.tnce.co.za/contact/", "https://www.findglocal.com/ZA/Pretoria/106490075414177/TNC-Consulting-Engineers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tnc-consulting-engineers-willow-park-manor'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'sila-digital-printing-willow-park-manor', 'Sila Digital Printing',
  (SELECT id FROM suburbs WHERE slug = 'willow-park-manor'),
  'Unit C6, Co Space, 11 Havelock Road, Willow Park Manor, Pretoria, 0184', '060 992 5164', 'https://siladigital.co.za', NULL,
  'Sila Digital Printing is a digital print and branding business operating from Co Space on Havelock Road in Willow Park Manor, Pretoria. The business offers branding and printing services on clothing and promotional products, working under the broader Sila Digital brand, which has been in business for five years providing corporate and government branding, promotional gifts, workwear, headwear, vehicle branding and marketing signage.

From its Willow Park Manor unit, the business serves small and larger clients across Pretoria who need printed or branded goods, combining design and production under one roof. It keeps regular weekday trading hours, and its Willow Park Manor address and phone number are recorded consistently on both its own website and an independent Pretoria business directory.',
  'Mon-Fri 09:00-16:00, Sat Closed, Sun Closed', NULL, NULL,
  '["https://siladigital.co.za/", "https://www.findglocal.com/ZA/Pretoria/104570482551471/Sila-Digital-Printing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sila-digital-printing-willow-park-manor'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'businessprint-willow-park-manor', 'BusinessPrint',
  (SELECT id FROM suburbs WHERE slug = 'willow-park-manor'),
  'N4 Gateway Industrial Park, 2 Amatole Road, Willow Park Manor X65, Pretoria East, 0186', '012 843 7600', 'https://www.businessprint.co.za', 'hello@businessprint.co.za',
  'BusinessPrint is a commercial printing company operating from the N4 Gateway Industrial Park on Amatole Road in Willow Park Manor, Pretoria East. The company works as a commercial printer, digital printer and packaging provider, offering printed materials and packaging to business clients across the greater Pretoria area.

Customer reviews describe prompt turnaround and consistent quality across repeat printing jobs. The company keeps regular weekday trading hours, running slightly shorter hours on Fridays, and can be reached by phone or email through its own website. Its Willow Park Manor address, phone number and trading hours are recorded consistently on both its own website and an independent South African business directory, giving Pretoria East businesses a local option for commercial print and packaging work rather than using a supplier elsewhere in the city.',
  'Mon-Thu 08:00-16:00, Fri 08:00-15:00, Sat Closed, Sun Closed', NULL, NULL,
  '["https://www.businessprint.co.za/contact-us/", "https://za.africabz.com/gauteng/businessprint-43546"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'businessprint-willow-park-manor'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'glory-room-boutique-willow-park-manor', 'GLORY ROOM Boutique',
  (SELECT id FROM suburbs WHERE slug = 'willow-park-manor'),
  '9 Havelock Road, Willow Park Manor, Pretoria', '065 668 5009', NULL, NULL,
  'GLORY ROOM Boutique is a clothing retailer trading from Havelock Road in Willow Park Manor, Pretoria East. The boutique sells ready-to-wear fashion items, including seasonal colour releases, and takes orders and enquiries directly from customers over WhatsApp.

Operating out of its Willow Park Manor premises, the boutique serves shoppers in the surrounding Pretoria East area who are looking for in-store fashion retail rather than an online-only option. Its Havelock Road address in Willow Park Manor is recorded on its own social media page as well as on an independent local business directory, both of which identify the boutique at the same street address.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/61551074728633/videos/27593702773614972/", "https://www.findglocal.com/ZA/Pretoria/116356108231956/GLORY-ROOM-Boutique"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'glory-room-boutique-willow-park-manor'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'computer-guardian-willow-park-manor', 'Computer Guardian',
  (SELECT id FROM suburbs WHERE slug = 'willow-park-manor'),
  'Unit C32/C33, Co.Space Entrepreneur Village, 11 Havelock Road, Willow Park Manor, Pretoria, 0184', '012 001 8530', 'https://computerguardian.co.za', 'info@computerguardian.co.za',
  'Computer Guardian is a computer repair and IT support business based in the Co.Space Entrepreneur Village on Havelock Road in Willow Park Manor, Pretoria. The business offers computer repairs and refurbishment, general IT support and technical assistance, computer parts and accessories, networking and connectivity services, and VoIP business telephone lines.

Operating from its Willow Park Manor premises, Computer Guardian also describes a community and training focus alongside its core repair and IT support work, giving it a broader role in the local small-business and co-working community it is based in. It keeps regular weekday office hours and can be reached by phone or email. Its Willow Park Manor address and contact details are recorded consistently on both its own website and an independent South African business directory.',
  NULL, NULL, NULL,
  '["https://computerguardian.co.za/contact/", "https://za.africabz.com/gauteng/computer-guardian-pretoria-628313"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'computer-guardian-willow-park-manor'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
