INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'walsh-fireplaces-retreat', 'Walsh Fireplaces',
  (SELECT id FROM suburbs WHERE slug = 'retreat'),
  '23 Honeywell Road, Retreat, Cape Town, 7945', '021 701 9910', NULL, NULL,
  'Walsh Fireplaces is a custom fireplace manufacturer in Retreat, Cape Town, building made-to-order fireplaces and mantlepieces and specialising in restoring and repairing Victorian fireplaces.',
  NULL, NULL,
  '["https://www.victorianfireplaces.co.za/fireplaces-cape-town/walsh-fireplaces/", "https://www.bestdirectory.co.za/victorian-fireplaces-fireplaces-home-improvement-home-house-in-retreat-cape-town-western-cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'walsh-fireplaces-retreat'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-total-rocklands-rocklands', 'KFC Total Rocklands',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  'Cnr Spine Road & Weltevreden Road, Total Mitchells Plain, Rocklands, Cape Town', '021 391 9420', NULL, NULL,
  'KFC Total Rocklands is a fried-chicken fast-food branch at the Total service station on the corner of Spine Road and Weltevreden Road in Rocklands, Mitchells Plain.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g3175959-d24184351-Reviews-Kfc_Totalenergies_Rocklands-Mitchells_Plain_Western_Cape.html", "https://www.cylex.net.za/company/kfc-total-rocklands-23708516.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-total-rocklands-rocklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
