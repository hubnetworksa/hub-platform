INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'little-lambs-christian-daycare-imizamo-yethu', 'Little Lambs Christian Daycare',
  (SELECT id FROM suburbs WHERE slug = 'imizamo-yethu'),
  'Van Hoogstraten Street, Imizamo Yethu, Hout Bay, Cape Town, 7806', '021 791 1748', 'https://www.littlelambs.org.za', NULL,
  'Little Lambs Christian Daycare is a non-profit early childhood daycare centre on Van Hoogstraten Street in Imizamo Yethu, caring for children aged 1 to 6.',
  NULL, NULL,
  '["https://www.littlelambs.org.za/contact-us", "https://www.capetownetc.com/education/little-lambs-centre-brings-education-and-empowerment-to-imizamo-yethu/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'little-lambs-christian-daycare-imizamo-yethu'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hout-bay-main-road-clinic-imizamo-yethu', 'Hout Bay Main Road Clinic',
  (SELECT id FROM suburbs WHERE slug = 'imizamo-yethu'),
  'ERF 1477, Hout Bay Main Road, Imizamo Yethu, Cape Town, 7806', '021 814 1850', NULL, 'houtbaymainroad.clinic@capetown.gov.za',
  'Hout Bay Main Road Clinic is a City of Cape Town public health clinic on Main Road in Imizamo Yethu.',
  NULL, NULL,
  '["https://www.capetown.gov.za/local%20and%20communities/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/hout-bay-main-road-clinic", "https://www.africanadvice.com/1387208/Hospitals,_Medical_Centre_And_Clinics/Cape_Town/Hout_Bay_Main_Road_Clinic/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hout-bay-main-road-clinic-imizamo-yethu'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
