-- Jobs 1-2: Zonnebloem suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lekker-vegan-zonnebloem', 'Lekker Vegan',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '37 Barrack Street, Zonnebloem, Cape Town', '076 734 7098', NULL, NULL,
  'Lekker Vegan is a plant-based restaurant serving vegan versions of classic junk food like burgers and gatsbys, on Harrington Street in Zonnebloem.',
  NULL, NULL,
  '["https://www.ubereats.com/za/store/lekker-vegan-harrington-street/QzrGG1aiRGu3wwCOK4ue6Q", "https://www.dining-out.co.za/md/Lekker-Vegan-Harrington/10093"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lekker-vegan-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harris-barber-zonnebloem', "Harri's Barber",
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '59 Harrington Street, Zonnebloem, Cape Town', '081 648 0664', NULL, NULL,
  "Harri's Barber is a barbershop on Harrington Street in Zonnebloem.",
  NULL, NULL,
  '["https://www.fresha.com/lvp/harris-barber-harrington-street-cape-town-wr90XD", "https://za.africabz.com/western-cape/harris-barber-362462"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harris-barber-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zonnebloem-boys-primary-school-zonnebloem', 'Zonnebloem Boys Primary School',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '592 Cambridge Street, Zonnebloem, Cape Town', '021 465 4260', NULL, NULL,
  'Zonnebloem Boys Primary School is a public primary school on Cambridge Street in Zonnebloem, established in 1858.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/zonnebloem-boys-primary-school/", "https://www.waze.com/live-map/directions/za/wc/cape-town/zonnebloem-boys-primary-school?to=place.ChIJlb2G9XZdzB0RFf7mdfmvJsQ", "https://zonnebloembps.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zonnebloem-boys-primary-school-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
