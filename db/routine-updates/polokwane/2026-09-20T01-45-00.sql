-- Job 1: polokwane-central -- 1 new business (Virgin Active Polokwane, Sportsnode branch)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-polokwane-polokwane-central', 'Virgin Active Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Burger Street Ext, Sportsnode, Polokwane, 0699', '015 291 1611', 'https://www.virginactive.co.za/gyms/polokwane', NULL,
  'Virgin Active Polokwane is a gym in the Sportsnode precinct near Peter Mokaba Stadium, part of the national Virgin Active chain, offering gym equipment and group fitness classes.',
  NULL, NULL,
  '["https://www.africanadvice.com/1413294/Companies_And_Businesses/Limpopo/Virgin_Active_(polokwane)/", "https://www.callupcontact.com/b/business/Virgin_Active_Polokwane/114145", "https://www.virginactive.co.za/gyms/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-polokwane-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
