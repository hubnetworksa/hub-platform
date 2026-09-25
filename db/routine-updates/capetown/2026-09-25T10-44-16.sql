-- Jobs 1-2: Manenberg new business (Nyanga Junction Shopping Centre tenant)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-nyanga-junction-manenberg', 'Capitec Bank',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 28, Nyanga Junction, Duinefontein Road, Manenberg, Cape Town, 7750', '0860 102 043', NULL, NULL,
  'Capitec Bank is a retail bank branch offering everyday banking services, in Nyanga Junction Shopping Centre, Manenberg.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/capitec-bank-nyanga-junction_768033+8.html", "https://www.callupcontact.com/b/Banks/Capitec_Bank_Nyanga_Junction/4918"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-nyanga-junction-manenberg'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
