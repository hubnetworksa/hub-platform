INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'goodwood-dental-studio-goodwood', 'Goodwood Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '1st Floor, Voortrekker Centre, 100 Voortrekker Road, Goodwood, Cape Town', '021 591 6131', 'https://www.goodwooddentalstudio.co.za/', NULL,
  'Goodwood Dental Studio is a dental practice offering preventive, cosmetic and implant dentistry, in Goodwood.',
  NULL, NULL,
  '["https://www.goodwooddentalstudio.co.za/contact-us/", "https://www.facebook.com/GoodwoodDentalStudio/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goodwood-dental-studio-goodwood'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-sae-chikte-goodwood', 'Dr SAE Chikte',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  'Ground Floor, Knobbs Building, Cnr Voortrekker Road & Hugo Street, Richmond Estate, Goodwood, Cape Town', '021 592 6605', NULL, NULL,
  'Dr SAE Chikte is a dental practice in Richmond Estate, Goodwood.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=201505", "https://www.recomed.co.za/dentist/goodwood/sae-chikte/4947/4746/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-sae-chikte-goodwood'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-thys-kachelhoffer-goodwood', 'Dr Thys Kachelhoffer',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '83 Vasco Boulevard, Goodwood, Cape Town, 7460', '021 592 1282', 'https://thysgoodwood.wixsite.com/website', NULL,
  'Dr Thys Kachelhoffer is a general practice in Goodwood.',
  NULL, NULL,
  '["https://www.recomed.co.za/general-practitioner/cape-town/thys-kachelhoffer/29511/37553/", "https://www.findglocal.com/ZA/Goodwood/280911289205388/Dr-Thys-Kachelhoffer"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-thys-kachelhoffer-goodwood'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brackenfell-dierekliniek-animal-clinic-brackenfell', 'Brackenfell Dierekliniek / Animal Clinic',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Mediese Sentrum, Old Paarl Road, Brackenfell, Cape Town, 7560', '021 981 3811', NULL, 'brackvet.info@gmail.com',
  'Brackenfell Dierekliniek / Animal Clinic is a veterinary practice offering routine exams, vaccinations and consultations, in Brackenfell.',
  NULL, NULL,
  '["https://www.facebook.com/brackenfellvet/", "https://topvet.net/practices/south-africa/western-cape/cape-town/brackenfell-dierekliniek---animal-clinic-26629"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brackenfell-dierekliniek-animal-clinic-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fps-attorneys-brackenfell', 'FPS Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  '8 Gert Kotze Street, Brackenfell, Cape Town, 7560', '021 982 0665', 'https://fpslaw.co.za/', NULL,
  'FPS Attorneys is a law firm in Brackenfell.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099868080398336/fps-law/brackenfell/attorneys", "https://directorysouthafrica.co.za/directory/fps-attorneys-7560/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fps-attorneys-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kraaifontein-hardware-kraaifontein', 'Kraaifontein Hardware',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '45 Station Street, Belmont Park, Kraaifontein, Cape Town, 7570', '021 988 1133', 'http://www.kraaifonteinhardware.co.za', 'kraaifonteinhardware0@gmail.com',
  'Kraaifontein Hardware is a family-run hardware store in Belmont Park, Kraaifontein, established in 1975.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kraaifontein-hardware-155672", "https://sa.jupiteryellowdetail.com/cape-town/search-by-listings/hardware-and-electrical-stores-/belmont-park-/kraaifontein-hardware/85831.jws"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kraaifontein-hardware-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
