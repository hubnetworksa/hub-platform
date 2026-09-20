-- Cape Town routine: Noordhoek suburb research (2 Farm Village tenants, 1 standalone)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'village-sushi-noordhoek', 'Village Sushi',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Village Lane, Noordhoek, Cape Town, 7979', '021 789 2760', NULL, NULL,
  'Village Sushi is a sushi and Asian-food restaurant in Noordhoek Farm Village, offering sit-down dining, takeaway and delivery.',
  NULL, NULL,
  '["https://thefarmvillage.co.za/village-sushi/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d5872795-Reviews-Village_Sushi-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'village-sushi-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-toad-in-the-village-noordhoek', 'The Toad in the Village',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Village Lane, Noordhoek, Cape Town, 7979', '021 789 2973', NULL, NULL,
  'The Toad in the Village is a relaxed country pub and restaurant in Noordhoek Farm Village.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-toad-in-the-village-26354", "https://www.capepointroute.co.za/moreinfoRestaurants.php?aID=401"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-toad-in-the-village-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noordhoek-veterinary-clinic-noordhoek', 'Noordhoek Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  'Corner Kenali Close & Main Road, Noordhoek, Cape Town, 7975', '021 789 2888', 'https://www.noordhoekvet.com/', NULL,
  'Noordhoek Veterinary Clinic is a small-animal and equine veterinary practice on Main Road, Noordhoek.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/noordhoek-veterinary-clinic-179250", "https://www.brabys.com/za/western-cape/cape-town/noordhoek/veterinary-clinics/noordhoek-veterinary-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noordhoek-veterinary-clinic-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
