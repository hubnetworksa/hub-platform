INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stoep-stories-magalieskruin', 'Stoep Stories',
  (SELECT id FROM suburbs WHERE slug = 'magalieskruin'),
  '520 Braam Pretorius Street, Magalieskruin, Pretoria, 0182', '064 846 2838', NULL, NULL,
  'Stoep Stories is a family-friendly pub, restaurant and grill on Braam Pretorius Street in Magalieskruin, Pretoria, offering dine-in and takeaway meals, outdoor seating, late-night food service and occasional live music.',
  NULL, NULL,
  '["https://pretoria.co.za/place/stoep-stories", "https://www.foodyas.com/ZA/Pretoria/105286507616320/Stoep-Stories-Restaurant-Pub-and-Grill"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stoep-stories-magalieskruin'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'liquor-city-magalieskruin-magalieskruin', 'Liquor City Magalieskruin',
  (SELECT id FROM suburbs WHERE slug = 'magalieskruin'),
  '406 Braam Pretorius St & Gryshout Rd, Magalieskruin, Pretoria, 0150', '012 543 0307', NULL, NULL,
  'Liquor City Magalieskruin is a branch of the Liquor City retail chain, selling wines, spirits and beer at the corner of Braam Pretorius Street and Gryshout Road in Magalieskruin, Pretoria, open Monday to Saturday and Sunday mornings.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/magalieskruin/liquor-city/406-bra-pretorius-st-gryshout-rd", "https://www.tiendeo.co.za/stores/pretoria/liquor-city-braam-pretorius-st-gryshout-rd-magalieskruin-pretoria/66380"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'liquor-city-magalieskruin-magalieskruin'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
