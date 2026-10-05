-- Thin-page fill, Pretoria batch 9, checkpoint 2: Raslouw
-- Note: 3 candidates from this suburb's research (Builders Express Raslouw,
-- PostNet Raslouw, Dic Homes) were dropped before writing this file -- their
-- phone numbers already belong to existing businesses published under the
-- neighbouring "celtisdal" suburb slug (same boundary-suburb issue
-- business-discovery.md describes). Not re-inserted as duplicates.
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'peritus-auto-raslouw', 'Peritus Auto',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  '53 Baard Rd, Raslouw AH, Centurion', '+27 83 655 4026', NULL, NULL,
  'Peritus Auto is a general automotive repair workshop based on Baard Road in the Raslouw AH area of Centurion. The business services and repairs passenger vehicles, and is open to customers from Monday to Friday, 08:00 to 17:00.

Customer feedback collected over several years points to consistent, communicative service, with reviewers noting that they were kept informed throughout the repair process and that vehicles were returned in improved condition. Several reviewers describe returning to the workshop more than once, suggesting an established base of repeat customers in the Raslouw area who rely on it for general car servicing and repair work.',
  'Mon-Fri 08:00-17:00', NULL, NULL,
  '["https://za.africabz.com/gauteng/peritus-auto-78422", "https://www.facebook.com/p/Peritus-Auto-100057570665266/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peritus-auto-raslouw'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'norocke-consulting-raslouw', 'Norocke Consulting',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  '317 Ruimte Street, Raslouw, Centurion', '072 734 3694', 'nrkc.co.za', NULL,
  'Norocke Consulting is a business and management consulting firm based on Ruimte Street in Raslouw, Centurion. The company focuses on ISO management systems, working with organisations to design, implement and maintain quality and process-management frameworks aligned with internationally recognised ISO standards such as ISO 9001.

Operating as a small, specialist consultancy rather than a broad general-business advisory, Norocke Consulting helps client organisations formalise how they document, monitor and improve their internal processes in order to meet ISO requirements. Based in Raslouw, the firm serves businesses across Centurion and the wider Pretoria area that are working toward or maintaining ISO certification.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/isocertificatepretoria/", "https://www.cybo.com/ZA-biz/norocke-consulting"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'norocke-consulting-raslouw'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kleine-skuur-teater-raslouw-raslouw', 'Kleine Skuur Teater Raslouw',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  'Plot 383/60, end of cul-de-sac in Amesite Street, off Lochner Street, Raslouw, Centurion', '060 845 5845', NULL, 'kleineskuurteater@gmail.com',
  'Kleine Skuur Teater Raslouw is an events and theatre venue located off Lochner Street in Raslouw, Centurion. The venue is available for hire for private and business functions, including weddings, anniversaries, birthday celebrations and mini-festivals, and also operates as a small theatre space offering performance opportunities to both established and up-and-coming artists.

The venue has been renovated and features a high, corrugated-iron roofed structure with multiple exits, which has hosted musicians, bands and other performers in addition to private celebrations. Located on a plot at the end of a cul-de-sac in Raslouw, it offers both indoor space and outdoor areas suited to functions of varying sizes, and has built a strong base of repeat customers and positive reviews over time.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/KleineSkuurTeaterRaslouw/", "https://za.africabz.com/gauteng/kleine-skuur-teater-452028"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kleine-skuur-teater-raslouw-raslouw'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'devenue-raslouw', 'DeVenue',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  '152 Johann Avenue, Raslouw AH, Centurion', '082 820 5306', NULL, 'devenueraslouw@gmail.com',
  'DeVenue is a function venue on Johann Avenue in Raslouw, Centurion, available for hire for weddings, corporate events and private celebrations. The venue is child-friendly and offers optional catering, decorating and photography services as add-ons for events booked there, letting hosts arrange much of an event through the venue itself rather than coordinating several separate outside suppliers.

The property combines indoor and outdoor areas, including manicured garden space and covered terraces, allowing hosts to combine or separate spaces depending on the size and style of their function. Positioned in Raslouw within easy reach of the N1 and R21, DeVenue serves clients from across Centurion and the wider Pretoria area looking for a garden-style setting for their event, whether an intimate family gathering or a larger wedding or corporate function.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/p/DeVenue-100089909144579/", "https://eventvenuessa.co.za/venues/south-africa/gauteng/centurion/de-venue/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'devenue-raslouw'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'printink-raslouw', 'Printink',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  '113 Lochner Rd, Raslouw AH, Centurion, 0157', '061 518 4887', 'https://printink.co.za/', 'info@printink.co.za',
  'Printink is a printing and graphic-design business operating from Lochner Road in the Raslouw AH area of Centurion. The business produces business cards, brochures, notepads, posters, banners and branded calendars, alongside graphic-design work to prepare artwork for these products.

Describing itself as a Raslouw-based print shop, Printink works with small businesses, schools and individuals on branding and marketing material, offering guidance on what a design should communicate before producing the finished printed item. Products such as X-banners and branded calendars give a client''s business repeated visibility over time, in addition to one-off print jobs such as posters and business cards.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/100088457400100/posts/print-done-right-113-lochner-rd-raslouw-ah-centurion-0157061-518-4887-infoprinti/188200120805234/", "https://printink.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'printink-raslouw'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'kapi-s-engineering-solutions-cc-raslouw', 'Kapi''s Engineering Solutions cc',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  '4 Piano Crescent, Raslouw Manor, Centurion, 0157', '082 334 1730', 'kapisengineering.co.za', 'admin@kapisengineering.co.za',
  'Kapi''s Engineering Solutions cc is an electrical contracting business based on Piano Crescent in the Raslouw Manor area of Centurion. The company works across electrical contracting, construction, instrumentation and automation, and is also listed as offering solar energy installation services for clients wanting to add renewable power to a home or business.

Operating from its Raslouw Manor address, the business combines standard electrical contracting work with instrumentation and automation projects, as well as solar energy system installations for clients moving toward renewable power. It serves construction and automation clients across the wider Centurion area, and maintains an online presence where it shares project updates and photographs of completed electrical, automation and solar installations with prospective clients.',
  NULL, NULL, NULL,
  '["https://www.facebook.com/profile.php/?id=61561142162640", "https://www.findglocal.com/ZA/Centurion/349870198208725/Kapi%27s-Engineering-Solutions-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kapi-s-engineering-solutions-cc-raslouw'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'footgear-raslouw-raslouw', 'Footgear Raslouw',
  (SELECT id FROM suburbs WHERE slug = 'raslouw'),
  (SELECT id FROM shopping_centers WHERE slug = 'raslouw-lifestyle-centre-raslouw'),
  'Shop 24, Raslouw Lifestyle Centre, Cnr Hendrik Verwoerd Drive & Rooihuiskraal Road, Celtisdal, Centurion, 0157', '+27 87 086 8629', 'www.footgear.co.za', NULL,
  'Footgear Raslouw is a branch of the Footgear shoe-store chain, located in Shop 24 of the Raslouw Lifestyle Centre on the corner of Hendrik Verwoerd Drive and Rooihuiskraal Road in Centurion. The store sells footwear for adults and children, including everyday shoes, sneakers and school and sports shoes such as court shoes.

The branch is open daily, from 09:00 to 19:00 Monday to Thursday, 08:00 to 19:00 on Fridays, 08:00 to 17:00 on Saturdays and 09:00 to 17:00 on Sundays. Customer reviews describe staff fitting school and sports shoes for children and assisting with sizing and exchanges, making it a long-running fitting-focused option for shoe shopping in the Raslouw area.',
  'Mon-Thu 09:00-19:00, Fri 08:00-19:00, Sat 08:00-17:00, Sun 09:00-17:00', NULL, NULL,
  '["https://za.africabz.com/gauteng/footgear-raslouw-255409", "https://rsa.worldorgs.com/catalog/centurion/boot-store/footgear-raslouw"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'footgear-raslouw-raslouw'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
