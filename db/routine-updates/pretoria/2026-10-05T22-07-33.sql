-- Thin-page fill, Pretoria batch 2, checkpoint 2: Doornpoort (+ Lukasrand: nothing verified)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'nano-creations-doornpoort', 'Nano Creations',
  (SELECT id FROM suburbs WHERE slug = 'doornpoort'),
  '325 Cassia St, Doornpoort, Pretoria', '083 463 8171', NULL, 'info@nanocreations.co.za',
  'Nano Creations is an electronics store in Doornpoort, Pretoria, specialising in Arduino-based products and components for hobbyists, students and professionals working on electronics projects. The shop stocks a range of gadgets and components, including CCTV cameras and surveillance equipment, alongside the boards, sensors and accessories used in DIY and educational electronics builds.

Staff offer guidance on selecting the right components for a project, helping customers avoid costly mistakes when sourcing parts for custom builds. The store accepts debit card payments for a straightforward checkout process. Based on Cassia Street in Doornpoort, Nano Creations serves the surrounding northern Pretoria suburbs as a specialist alternative to big-box electronics retailers for anyone working with microcontrollers, sensors or home security camera systems.',
  'Mon-Thu 08:00-17:00, Fri 08:00-14:00, Sat Closed, Sun Closed',
  NULL, NULL,
  '["https://pretoria.co.za/place/nano-creations", "https://www.cylex.net.za/company/nano-creations-23771308.html", "https://firmania.co.za/doornpoort/nano-creations-130757"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nano-creations-doornpoort'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'delcor-real-estates-doornpoort', 'Delcor Real Estates',
  (SELECT id FROM suburbs WHERE slug = 'doornpoort'),
  '500 Peerboom St, Doornpoort, Pretoria', '082 455 3107', NULL, NULL,
  'Delcor Real Estates is an estate agency based in Doornpoort, Pretoria, offering residential property sales and letting services to buyers and sellers in the surrounding area. The agency provides comprehensive property listings alongside guidance on pricing, market conditions and the practical steps involved in a sale or purchase.

Clients are supported through clear, organised communication from enquiry to closing, with a focus on transparency throughout the process. Based on Peerboom Street in Doornpoort, the agency has built a track record in the local market, reflected in a strong base of client reviews for its professional, approachable service. Delcor Real Estates suits homeowners looking to sell in the Doornpoort area as well as buyers seeking a locally based agent with direct knowledge of the neighbourhood''s property market.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/delcor-real-estates", "https://www.findglocal.com/ZA/Pretoria-North-East/102986695006158/Delcor-Real-Estate", "https://firmania.co.za/doornpoort/delcor-real-estate-100057", "https://www.africabizinfo.com/ZA/delcor-real-estates-082-455-3107"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'delcor-real-estates-doornpoort'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'bluecare-insurance-brokers-doornpoort', 'BlueCare Insurance Brokers',
  (SELECT id FROM suburbs WHERE slug = 'doornpoort'),
  '697 Amandelboom Rd, Doornpoort, Pretoria', '082 494 5624', 'https://www.bluecare.co.za', 'skemp@bluecare.co.za',
  'BlueCare Insurance Brokers is a life insurance brokerage based on Amandelboom Road in Doornpoort, Pretoria, serving clients across the Doornpoort, Wonderboom and wider Gauteng area. The brokerage focuses on life cover, income protection, and disability and dread disease benefits, helping individuals, families and small business owners put long-term financial protection in place.

Rather than selling standard packages, the team carries out a needs analysis that considers a client''s household responsibilities, debts and existing cover before recommending a policy, and offers ongoing reviews as circumstances change. Beyond life insurance, the brokerage also assists clients with investments, retirement annuities, unit trusts, wills and estate planning, business insurance and funeral cover, making it a broader financial services contact point for households and small businesses in the Doornpoort area.',
  NULL,
  NULL, NULL,
  '["https://www.yellowpages.biz/insurance-broker/ZA-Gauteng/Pretoria/BlueCare-Insurance-Brokers-ZA268426.html", "https://firmania.co.za/pretoria/bluecare-insurance-brokers-14662", "https://www.africabizinfo.com/ZA/bluecare-insurance-brokers-082-494-5624", "https://doornpoort.co.za/bluecare-financial-services/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bluecare-insurance-brokers-doornpoort'),
  (SELECT id FROM categories WHERE slug = 'insurance'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-doornpoort-doornpoort', 'PostNet Doornpoort',
  (SELECT id FROM suburbs WHERE slug = 'doornpoort'),
  'Shop 13, Doornpark Shopping Centre, 487 Airport Rd, Doornpoort, Pretoria', '012 547 0300', 'https://www.postnet.co.za/stores/doornpoort', 'doornpoort@postnet.co.za',
  'PostNet Doornpoort is a business services outlet based at the Doornpark Shopping Centre on Airport Road in Doornpoort, offering printing, copying and courier shipping services to local residents and businesses. The branch also provides mailbox rentals and a range of stationery and office supplies.

Customers can drop off parcels for countrywide courier delivery, have documents and marketing material printed or laminated, and purchase everyday stationery and craft supplies without having to travel further into Pretoria. As part of a national franchise network, the Doornpoort branch combines the convenience of a small, locally staffed shop with access to PostNet''s broader printing and logistics network, making it a practical stop for both business errands and personal post and printing needs in the area.',
  'Mon-Tue 08:00-17:30, Wed 08:00-17:00, Thu-Fri 08:00-17:30, Sat 08:00-13:00',
  NULL, NULL,
  '["https://pretoria.co.za/place/postnet-doornpoort", "https://www.findglocal.com/ZA/Pretoria/109365731552010/PostNet-Doornpoort"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-doornpoort-doornpoort'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'intl-studios-doornpoort', 'INTL Studios',
  (SELECT id FROM suburbs WHERE slug = 'doornpoort'),
  '287 Rivea St, Doornpoort, Pretoria', '067 061 5244', NULL, NULL,
  'INTL Studios is a marketing and advertising agency based in Doornpoort, Pretoria, offering branding, digital marketing and content creation services to local businesses. The agency plans and builds multi-channel campaigns designed to grow a client''s visibility and reach their target audience.

Services include media planning and campaign analytics, allowing clients to track how their marketing spend performs across different channels. Operating from Rivea Street in Doornpoort, the studio combines a small agency''s personalised approach with a broader marketing skill set spanning design, digital advertising and content production, giving nearby businesses a local option for campaigns that would otherwise require working with an agency based further into central Pretoria.',
  NULL,
  NULL, NULL,
  '["https://pretoria.co.za/place/intl-studios", "https://www.africabizinfo.com/ZA/intl-studios-067-061-5244", "https://www.cybo.com/ZA-biz/intl-studios"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'intl-studios-doornpoort'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);
