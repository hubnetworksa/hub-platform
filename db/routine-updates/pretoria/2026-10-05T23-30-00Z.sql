-- Thin-page fill, Pretoria batch 5, checkpoint 4: Roodeplaat
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'roodeplaat-dierekliniek-roodeplaat', 'Roodeplaat Dierekliniek',
  (SELECT id FROM suburbs WHERE slug = 'roodeplaat'),
  'Plot 71, Dwarsweg, Roodeplaat, 0039', '012 808 1119', NULL, NULL,
  'Roodeplaat Dierekliniek is a veterinary clinic based at Plot 71 in Roodeplaat, on the northern edge of Pretoria. Listed on South Africa''s Medpages healthcare directory under veterinary clinics, the practice treats animals for the farms and smallholdings that make up much of the surrounding Roodeplaat area.

Operating from its Roodeplaat premises, the clinic gives pet owners and smallholders in the area a nearby veterinary option rather than having to travel into central Pretoria for routine check-ups, vaccinations and other animal healthcare needs. Its Roodeplaat address and phone number are recorded consistently across the Medpages healthcare directory and an independent South African business directory, both of which list it under the same plot number.',
  NULL, NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=243807", "https://za.africabz.com/gauteng/roodeplaat-dierekliniek-101961"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'roodeplaat-dierekliniek-roodeplaat'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'die-poort-dierekliniek-veterinary-clinic-roodeplaat', 'Die Poort Dierekliniek / Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'roodeplaat'),
  'Plot 871, Kameeldrift Road, Roodeplaat, Pretoria', '012 819 1030', NULL, NULL,
  'Die Poort Dierekliniek, trading as Die Poort Veterinary Clinic, is a veterinary practice based on Plot 871 in Roodeplaat, on the northern edge of Pretoria. The clinic is listed on an independent South African veterinary directory as one of a small number of veterinary clinics serving the Roodeplaat area.

Based on a smallholding-style plot in Roodeplaat, the clinic serves pet owners and smallholders across the surrounding area, who might otherwise need to travel further into Pretoria for animal healthcare. Its Plot 871, Roodeplaat address and phone number are recorded consistently across more than one independent veterinary and local business directory, each identifying it under the same plot number in Roodeplaat.',
  NULL, NULL, NULL,
  '["https://savet.co.za/vets/gauteng/pretoria/roodeplaat", "https://za.africabz.com/gauteng/die-poort-dierekliniek-71018"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'die-poort-dierekliniek-veterinary-clinic-roodeplaat'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'bushveld-pond-roodeplaat', 'Bushveld Pond',
  (SELECT id FROM suburbs WHERE slug = 'roodeplaat'),
  '220 Bosveld Street, Bosveldpark, Roodeplaat, Pretoria', '083 377 8511', 'https://bushveldpond.co.za', NULL,
  'Bushveld Pond is a wedding and events venue based at 220 Bosveld Street in Bosveldpark, Roodeplaat, on the northern edge of Pretoria. The family-owned venue combines a ballroom and gardens with on-site accommodation, and offers wedding packages designed to suit different guest sizes and budgets.

Customer reviews describe attentive, hands-on hosts and a beautiful setting, with guests praising both the food and the overall experience of their day. Alongside weddings, the venue is used for other milestone events. Its Bosveldpark, Roodeplaat address and phone number are recorded consistently on both an independent South African business directory and a wedding-venue search platform, which lists it among the venues available in the Roodeplaat area.',
  NULL, NULL, NULL,
  '["https://za.africabz.com/gauteng/bushveld-pond-40993", "https://www.findglocal.com/ZA/Pretoria/1418095211820155/Bushveld-Pond"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bushveld-pond-roodeplaat'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);
