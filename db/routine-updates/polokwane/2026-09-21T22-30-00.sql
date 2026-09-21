INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpha-sand-stone-annadale', 'Alpha Sand & Stone',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  '40 Railway St, Annadale, Polokwane, 0699', '015 293 0208', 'http://www.alphasand.co.za', 'alphasand@xnets.co.za',
  'Alpha Sand & Stone is a sand and stone supplier and plant hire company, offering TLB hire and abnormal lowbed services, in Annadale.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/business/Alpha_Sand_And_Stone/142150", "https://www.brabys.com/business/2649371/south-africa/limpopo/polokwane/annadale/railway-st/sand-suppliers/building-sand-stone/building-sand-suppliers/builders-plant-hire/plant-hire/sand-stone-suppliers/alpha-sand-stone-plant-hire"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpha-sand-stone-annadale'),
  (SELECT id FROM categories WHERE slug = 'building-materials-timber-merchants'),
  1
);
